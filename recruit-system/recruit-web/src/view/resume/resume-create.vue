<template>
  <div class="container">
    <div class="title">
      <span>创建简历</span>
    </div>
    <el-divider></el-divider>
    <div class="wrap">
      <el-row>
        <el-col :lg="16" :md="20" :sm="24" :xs="24">
          <el-form
            :model="form"
            status-icon
            ref="form"
            label-width="100px"
            v-loading="loading"
            @submit.native.prevent
          >
            <el-form-item label="专业技能" prop="ability">
              <el-input size="medium" v-model="form.ability" placeholder="请填写专业技能"></el-input>
            </el-form-item>
            <el-form-item label="工作经历" prop="work_experience">
              <el-input size="medium" v-model="form.work_experience" placeholder="请填写工作经历"></el-input>
            </el-form-item>
            <el-form-item label="项目经历" prop="project_experience">
              <el-input size="medium" v-model="form.project_experience" placeholder="请填写项目经历"></el-input>
            </el-form-item>
            <el-form-item label="教育经历" prop="education_experience">
              <el-input size="medium" v-model="form.education_experience" placeholder="请填写教育经历"></el-input>
            </el-form-item>
            <el-form-item label="个人总结" prop="personal_summary">
              <el-input size="medium" v-model="form.personal_summary" placeholder="请填写个人总结"></el-input>
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
import { Resume } from '@/model/resume'

export default {
  components: {
  },
  data() {
    return {
      loading: false,
      form: {
      },
    }
  },
  async mounted() {
  },
  methods: {
    // 制作简历
    async submitForm(formName) {
      try {
        this.loading = true
        // 拿到当前登录求职者用户id
        this.form.user_id = this.$store.getters.user.id
        // 创建简历
        const res = await Resume.create(this.form)
        this.loading = false
        if (res.code < window.MAX_SUCCESS_CODE) {
          this.$message.success(`${res.message}`)
          // 跳转到我的简历页面
          this.$emit('createClose')
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

