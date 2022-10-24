<template>
  <div class="container">
    <div class="title" style=" text-align: left;">新建职位分类</div>
    <div class="wrap">
      <el-row>
        <el-col :lg="16" :md="20" :sm="24" :xs="24">
          <el-form :model="form" status-icon ref="form" label-width="100px" @submit.native.prevent>
            <el-form-item label="分类名称" prop="name">
              <el-input size="medium" v-model="form.name" placeholder="请填写职位分类名称"></el-input>
            </el-form-item>
            <el-form-item label="分类描述" prop="description">
              <el-input size="medium" type="textarea" :autosize="{ minRows: 4, maxRows: 8 }" placeholder="请输入职位分类描述"
                v-model="form.description">
              </el-input>
            </el-form-item>

            <el-form-item class="submit">
              <el-button type="primary" @click="submitForm('form')" :loading="loading">保 存</el-button>
              <el-button @click="resetForm('form')">重 置</el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import { Category } from '@/model/category'

export default {
  data() {
    return {
      form: {
      },
      loading: false,
    }
  },
  methods: {
    async submitForm(formName) {
      try {
        this.loading = true
        const res = await Category.createCategory(this.form)
        this.loading = false
        if (res.code < window.MAX_SUCCESS_CODE) {
          this.$message.success(`${res.message}`)
          // 清空输入框，方便继续添加职位分类
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
  },
}
</script>

<style lang="scss" scoped>
.container {
  .title {
    height: 59px;
    line-height: 59px;
    color: $parent-title-color;
    font-size: 16px;
    font-weight: 500;
    text-indent: 40px;
    border-bottom: 1px solid #dae1ec;
  }

  .wrap {
    padding: 20px;
  }

  .submit {
    float: left;
  }
}
</style>
