<template>
  <div class="container">
    <div class="title">
      <span>修改职位信息</span> <span class="back" @click="back"> <i class="iconfont icon-fanhui"></i> 返回 </span>
    </div>
    <el-divider></el-divider>
    <div class="wrap">
      <el-row>
        <el-col :lg="16" :md="20" :sm="24" :xs="24">
          <el-form :model="form" status-icon ref="form" label-width="100px" v-loading="loading" @submit.native.prevent>
            <el-form-item label="职位名称" prop="title">
              <el-input size="medium" v-model="form.title"></el-input>
            </el-form-item>

            <el-form-item label="职位分类" prop="category_id">
              <el-autocomplete @focus="loadCategorySuggestions" popper-class="my-autocomplete" class="inline-input"
                v-model="categoryState" :fetch-suggestions="queryCategorySearch" placeholder="请填写职位所属分类"
                @select="handleCategorySelect">
                <template slot-scope="{ item }">
                  <span class="id">{{ item.id }}</span>
                  <span class="name">{{ item.name }}</span>
                </template>
              </el-autocomplete>
            </el-form-item>

            <el-form-item label="职位浏览量">
              <el-input size="medium" v-model="form.hits" disabled></el-input>
            </el-form-item>
            <el-form-item label="招聘人数" prop="quantity">
              <el-input size="medium" v-model="form.quantity"></el-input>
            </el-form-item>
            <el-form-item label="薪资">
              <el-input size="medium" v-model="form.salary_down" style="float: left;width: 10%"></el-input>
              <span style="float: left;">~</span>
              <el-input size="medium" v-model="form.salary_up" style="float: left;width: 10%"></el-input>
            </el-form-item>
            <el-form-item label="工作地点" prop="city">
              <el-input size="medium" v-model="form.city"></el-input>
            </el-form-item>
            <el-form-item label="职位要求" prop="requirement">
              <el-input size="medium" type="textarea" :rows="4" v-model="form.requirement">
              </el-input>
            </el-form-item>
            <el-form-item label="公司名称">
              <el-input size="medium" v-model="form.company_name" disabled></el-input>
            </el-form-item>
            <el-form-item label="公司简介">
              <el-input size="medium" type="textarea" :rows="4" v-model="form.company_desc" disabled>
              </el-input>
            </el-form-item>
            <el-form-item class="submit">
              <el-button type="primary" @click="submitForm('form')">保 存</el-button>
              <el-button @click="resetForm('form')">重 置</el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import { Position } from '@/model/position'
import { Category } from '@/model/category'

export default {
  // 定义变量
  props: {
    // 子组件定义的变量通过父组件赋值
    editPositionID: {
      type: Number,
    },
  },
  data() {
    return {
      loading: false,
      form: {
      },
      categoryState: '',
      categorySuggestions: [],
    }
  },
  async mounted() {
    this.loading = true
    const res = await Position.getById(this.editPositionID)
    this.categoryState = res.category_name
    // 更新职位浏览量(每进入一次职位详情页面，职位浏览量加一)
    await Position.updateHits(this.editPositionID)
    this.form = res
    this.loading = false
  },
  methods: {
    async submitForm() {
      // 拿到hr_id
      this.form.hr_id = this.$store.getters.user.id
      const res = await Position.updatePosition(this.form.id, this.form)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
        // 返回职位列表页面
        this.$emit('editClose')
      }
    },
    // 重置表单
    resetForm(formName) {
      this.$refs[formName].resetFields()
    },
    back() {
      this.$emit('editClose')
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

