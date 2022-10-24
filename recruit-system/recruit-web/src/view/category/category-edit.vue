<template>
  <div class="container">
    <div class="title">
      <span>修改职位分类</span> <span class="back" @click="back"> <i class="iconfont icon-fanhui"></i> 返回 </span>
    </div>
    <el-divider></el-divider>
    <div class="wrap">
      <el-row>
        <el-col :lg="16" :md="20" :sm="24" :xs="24">
          <el-form :model="form" status-icon ref="form" label-width="100px" v-loading="loading" @submit.native.prevent>
            <el-form-item label="分类名称" prop="name">
              <el-input size="medium" v-model="form.name" placeholder="请输入职位分类名称"></el-input>
            </el-form-item>
            <el-form-item label="分类描述" prop="description">
              <el-input size="medium" type="textarea" :rows="4" v-model="form.description" placeholder="请输入职位分类描述">
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
import {
  Category
} from '@/model/category'

export default {
  components: {},
  // 定义变量
  props: {
    // 子组件定义的变量通过父组件赋值
    editCategoryID: {
      type: Number,
    },
  },
  data() {
    return {
      loading: false,
      form: {},
    }
  },
  async mounted() {
    this.loading = true
    const res = await Category.getById(this.editCategoryID)
    this.form = res
    this.loading = false
  },
  methods: {
    async submitForm() {
      const res = await Category.update(this.editCategoryID, this.form)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
        // 返回分类列表页面
        this.$emit('editClose')
      }
    },
    // 重置表单
    resetForm(formName) {
      this.$refs[formName].resetFields()
    },
    back() {
      // 由于showEdit这个变量是在父组件定义的，因此不能在子组件改变该变量的值，可以使用事件传递的方式，当点击了返回按钮，触发的事件处理机制交给父组件去处理
      this.$emit('editClose')
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
</style>
