<template>
  <div>
    <div class="container">
      <div class="title">
        <span>简历详细信息</span>
        <span class="back" @click="back">
          <i class="iconfont icon-fanhui"></i> 返回
        </span>
      </div>
      <el-divider></el-divider>
      <div>
        <Detail :id="detailResumeID"></Detail>
      </div>
    </div>
    <div class="wrap">
      <el-row>
        <el-col :lg="16" :md="20" :sm="24" :xs="24">
          <el-form :model="form" status-icon ref="form" label-width="100px" v-loading="loading" @submit.native.prevent>
            <el-form-item class="submit">
              <!--通过申请的状态属性state来控制通过按钮和不通过按钮是否显示-->
              <el-button type="primary" @click="handlePass('form')" v-if="this.applicationState == 0" round>通 过
              </el-button>
              <el-button @click="handleFail('form')" v-if="this.applicationState == 0" round>不通过</el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import { Resume } from '@/model/resume'
import { Application } from '@/model/application'
import Detail from './detail.vue'
export default {
  name: "ResumeDetail",
  components: {
    Detail
  },
  // 定义变量
  props: {
    detailResumeID: {
      type: String,
    },
    applicationID: {
      type: String,
    },
    applicationState: {
      type: String,
    }
  },
  data() {
    return {
      loading: false,
      form: {
      },
    }
  },
  async mounted() {
    try {
      this.loading = true
      const res = await Resume.getById(this.detailResumeID)
      this.form = res
      this.loading = false
    } catch (error) {
      this.loading = false
      console.log(error)
    }
  },
  methods: {
    async handlePass(val) {
      const res = await Application.updateState(this.applicationID, 1)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
        // 返回查询所有未处理简历的页面
        this.$emit('detailClose')
      }
    },
    async handleFail(val) {
      const res = await Application.updateState(this.applicationID, 2)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
        // 返回查询所有未处理简历的页面
        this.$emit('detailClose')
      }
    },
    back() {
      this.$emit('detailClose')
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
