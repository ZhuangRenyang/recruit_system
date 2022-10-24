<template>
  <div class="container">
    <div class="title">
      <span>公司详细信息</span> <span class="back" @click="back"> <i class="iconfont icon-fanhui"></i> 返回 </span>
    </div>
    <el-divider></el-divider>
    <div class="wrap">
      <el-row>
        <el-col :lg="16" :md="20" :sm="24" :xs="24">
          <el-form :model="form" status-icon ref="form" label-width="100px" v-loading="loading" @submit.native.prevent>
            <el-form-item label="公司名称" prop="name">
              <el-input size="medium" v-model="form.name" disabled></el-input>
            </el-form-item>
            <el-form-item label="公司外文名" prop="foreign_name">
              <el-input size="medium" v-model="form.foreign_name" disabled></el-input>
            </el-form-item>
            <el-form-item label="总部地点" prop="city">
              <el-input size="medium" v-model="form.city" disabled></el-input>
            </el-form-item>
            <el-form-item label="公司logo" prop="logo">
              <upload-imgs :max-num="maxNum" ref="uploadEle" :value="initData" disabled />
            </el-form-item>
            <el-form-item label="公司海报" prop="logo">
              <upload-imgs :max-num="maxNum" ref="uploadEle" :value="poster" disabled />
              <!-- <img :src="form.poster" alt=""> -->
            </el-form-item>
            <el-form-item label="公司使命" prop="mission">
              <el-input size="medium" v-model="form.mission" disabled></el-input>
            </el-form-item>
            <el-form-item label="公司简介" prop="description">
              <el-input size="medium" type="textarea" :rows="4" v-model="form.description" disabled>
              </el-input>
            </el-form-item>
            <el-form-item class="submit">
              <!--通过公司的状态属性state来控制通过按钮和不通过按钮是否显示-->
              <el-button type="primary" @click="handlePass('form')" v-if="form.state === 0 && flag">通 过</el-button>
              <el-button @click="handleFail('form')" v-if="form.state == 0 && flag">不通过</el-button>
              <el-button type="primary" @click="handleFollow('form')" v-permission="{ permission: '新增关注' }"
                v-if="temp == 1">关注公司</el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import {
  Company
} from '@/model/company'
import {
  Follow
} from '@/model/follow'
import UploadImgs from '@/component/base/upload-image'

export default {
  components: {
    UploadImgs,
  },
  // 定义变量
  props: {
    // 子组件定义的变量通过父组件赋值
    detailCompanyID: {
      type: Number,
    },
    flag: {
      type: Boolean,
      default: true,
    },
    temp: {
      type: Number,
      default: 0,
    },
  },
  data() {
    return {
      loading: false,
      form: {},
      list: {},
      maxNum: 1,
      initData: [],
      poster:{}
    }
  },
  async mounted() {
    this.loading = true
    const res = await Company.getById(this.detailCompanyID)
    this.poster = [{
        id: res.id,
        display: res.poster,
      }
    ]
    this.initData = [{
      id: res.id,
      display: res.logo,
    },]
    this.form = res
    this.loading = false
  },
  methods: {
    async handlePass(val) {
      const res = await Company.updateState(this.detailCompanyID, 1)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
        this.$emit('detailClose')
      }
    },
    async handleFail(val) {
      const res = await Company.updateState(this.detailCompanyID, 2)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
        this.$emit('detailClose')
      }
    },
    // 关注公司
    async handleFollow(val) {
      // 获取当前登录求职者的用户id
      this.list.user_id = this.$store.getters.user.id
      // 获取当前关注的公司id
      this.list.company_id = this.detailCompanyID
      // 调用添加关注的方法
      const res = await Follow.create(this.list)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
      }
    },
    back() {
      // 由于showEdit这个变量是在父组件定义的，因此不能在子组件改变该变量的值，可以使用事件传递的方式，当点击了返回按钮，触发的事件处理机制交给父组件去处理
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
