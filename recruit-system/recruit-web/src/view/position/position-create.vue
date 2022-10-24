<template>
	<!-- 发布职位页面 -->
	<div class="container" v-if="!showCreate">
		<div class="title">
			<span>新增职位</span>
		</div>
		<el-divider></el-divider>
		<div class="wrap">
			<el-row>
				<el-col :lg="16" :md="20" :sm="24" :xs="24">
					<el-form :model="form" status-icon ref="form" label-width="100px" v-loading="loading" @submit.native.prevent>
						<el-form-item label="职位名称" prop="title">
							<el-input size="medium" v-model="form.title" placeholder="请填写职位名称"></el-input>
						</el-form-item>
						<el-form-item label="职位分类" prop="category_id">
							<el-autocomplete @focus="loadCategorySuggestions" popper-class="my-autocomplete" class="inline-input"
								v-model="categoryState" :fetch-suggestions="queryCategorySearch" placeholder="请填写职位所属分类" @select="handleCategorySelect">
								<template slot-scope="{ item }">
									<span class="id">{{ item.id }}</span>
									<span class="name">{{ item.name }}</span>
								</template>
							</el-autocomplete>
						</el-form-item>
						<el-form-item label="招聘人数" prop="quantity">
							<el-input size="medium" v-model="form.quantity" placeholder="请填写职位招聘人数"></el-input>
						</el-form-item>
						<el-form-item label="薪资">
							<el-input size="medium" v-model="form.salary_down" style="float: left;width: 20%" placeholder="请填写最低薪资">
							</el-input>
							<span style="float: left;">~</span>
							<el-input size="medium" v-model="form.salary_up" style="float: left;width: 20%" placeholder="请填写最高薪资">
							</el-input>
						</el-form-item>
						<el-form-item label="工作地点" prop="city">
							<el-input size="medium" v-model="form.city" placeholder="请填写工作地点"/>
						</el-form-item>
						<el-form-item label="学历要求" prop="edu_back">
							<el-input size="medium" v-model="form.edu_back" placeholder="请填写学历要求"/>
						</el-form-item>
						<el-form-item label="职位要求" prop="requirement">
							<el-input size="medium" type="textarea" :rows="4" v-model="form.requirement" placeholder="请填写职位要求">
							</el-input>
						</el-form-item>
						<el-form-item label="公司名称">
							<el-input size="medium" v-model="form.company_name" disabled></el-input>
						</el-form-item>
						<el-form-item class="submit">
							<el-button type="primary" @click="submitForm('form')" :disabled="isdisable">保 存</el-button>
							<el-button @click="resetForm('form')">重 置</el-button>
						</el-form-item>
					</el-form>
				</el-col>
			</el-row>
		</div>	
	</div>

<!-- 企业认证 -->
<company-create v-else @createClose="createClose"></company-create>
</template>

<script>
import CompanyCreate from '@/view/company/company-create'
import {
  HRCompany
} from '@/model/hrCompany'
import {
  Category
} from '@/model/category'
import {
  Position
} from '@/model/position'

export default {
  components: {
    CompanyCreate,
  },
  data() {
    return {
      loading: false,
      form: {},
      categoryState: '',
      categorySuggestions: [],
      showCreate: false,
      isdisable: false,
    }
  },
  async mounted() {
    try {
      this.loading = true
      // 先验证是否完成企业认证
      const res = await HRCompany.get(this.$store.getters.user.id)
      if (res.state !== 1) {
        this.$message.error("未完成企业认证不能发布职位");
        this.isdisable = true
      }
      // 没有发生异常，说明已经完成企业认证，给表单的公司名称赋值
      this.form.company_name = res.name
      this.loading = false
    } catch (error) {
      this.loading = false
      console.log(error)
      // 还未完成企业认证，会显示企业认证组件
      this.showCreate = true
    }
  },
  methods: {
    async submitForm(formName) {
      try {
        this.loading = true
        // 拿到HR对应的Company的id值
        const result = await HRCompany.get(this.$store.getters.user.id)
        this.form.company_id = result.id
        // 给hr_id赋值
        this.form.hr_id = this.$store.getters.user.id
        // 新增职位
        const res = await Position.create(this.form)
        this.loading = false
        if (res.code < window.MAX_SUCCESS_CODE) {
          this.$message.success(`${res.message}`)
          // 清空输入框，方便继续添加职位
          this.resetForm(formName)
        }
      } catch (error) {
        this.loading = false
        console.log(error)
      }
    },
    // 重置表单
    resetForm(formName) {
      this.$refs[formName].resetFields()
    },
    queryCategorySearch(queryString, cb) {
      // eslint-disable-next-line
      const suggestions = this.categorySuggestions
      const results = queryString ? suggestions.filter(this.createCategoryFilter(queryString)) : suggestions
      cb(results)
    },
    createCategoryFilter(queryString) {
      // eslint-disable-next-line
      return suggestion => {
        return suggestion.name.toLowerCase().indexOf(queryString.toLowerCase()) === 0
      }
    },
    handleCategorySelect(item) {
      this.categoryState = item.name
      // 给表单的职位分类id赋值
      this.form.category_id = item.id
    },
    async loadCategorySuggestions() {
      if (this.categorySuggestions.length > 0) {
        return
      }
      try {
        this.categorySuggestions = await Category.getList()
        if (this.categorySuggestions.length === 0) {
          this.$message.error('暂无职位分类，请先添加')
        }
      } catch (error) {
        this.$message.error('获取职位分类失败')
        console.error(error)
      }
    },
  },
}
</script>

<style lang="scss" scoped>
.el-divider--horizontal {
  margin: 0;
}

.container {
  .title {
    height: 59px;
    line-height: 59px;
    color: $parent-title-color;
    font-size: 16px;
    font-weight: 500;
    text-indent: 40px;

    .back {
      float: right;
      margin-right: 40px;
      cursor: pointer;
    }
  }

  .wrap {
    padding: 20px;
  }

  .submit {
    float: left;
  }
}

.my-autocomplete {
  li {
    line-height: normal;
    padding: 7px;
    display: inline-flex;
    align-content: space-around;

    .name {
      text-overflow: ellipsis;
      overflow: hidden;
    }

    .id {
      margin-right: 15px;
      font-size: 12px;
      color: #b4b4b4;
    }

    .highlighted .addr {
      color: #ddd;
    }
  }
}
</style>
