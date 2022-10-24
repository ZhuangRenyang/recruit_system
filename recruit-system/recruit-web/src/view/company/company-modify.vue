<template>
  <!-- 我的企业信息页面 -->
  <div class="container" v-if="!showCreate">
    <div class="title" style=" text-align: left;">
      <span>我的企业信息</span>
    </div>
    <el-divider></el-divider>
    <div class="wrap">
      <el-row>
        <el-col :lg="16" :md="20" :sm="24" :xs="24">
          <el-form :model="form" status-icon ref="form" label-width="100px" v-loading="loading" @submit.native.prevent>
            <!-- 公司名称不设置prop属性，重置的时候就不会重置该字段 -->
            <el-form-item label="公司名称">
              <el-input size="medium" v-model="form.name" placeholder="请填写公司名称" disabled></el-input>
            </el-form-item>
            <el-form-item label="公司外文名" prop="foreign_name">
              <el-input size="medium" v-model="form.foreign_name" placeholder="请填写公司外文名"></el-input>
            </el-form-item>
            <el-form-item label="总部地点" prop="city">
              <el-input size="medium" v-model="form.city" placeholder="请填写公司总部地点"></el-input>
            </el-form-item>
            <el-form-item label="公司logo" prop="logo">
				      <p>如需更新公司海报,修改第二张图即可</p>
              <upload-imgs :max-num="2" ref="uploadEle" :value="initData" />
            </el-form-item>
            <el-form-item label="公司海报" prop="logo">
              <span><img :src="form.poster" alt="" class="posterImg"/></span>
              <span><el-button type="primary" @click="getValue">更 新</el-button></span>
            </el-form-item>
            <el-form-item label="公司使命" prop="mission">
              <el-input size="medium" v-model="form.mission" placeholder="请填写使命"></el-input>
            </el-form-item>
            <el-form-item label="公司简介" prop="description">
              <el-input size="medium" type="textarea" :rows="4" placeholder="请输入公司简介" v-model="form.description">
              </el-input>
            </el-form-item>
            <el-form-item label="认证状态" prop="state">
              <!-- <el-switch v-model="form.state"></el-switch> -->
              <span v-if="form.state" style="color:green">审核通过</span>
              <span v-else style="color:brown">待审核</span>
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

  <!-- 企业认证 -->
  <company-create v-else @createClose="createClose"></company-create>
</template>

<script>
import { HRCompany } from '@/model/hrCompany'
import { Company } from '@/model/company'
import UploadImgs from '@/component/base/upload-image'
import CompanyCreate from '@/view/company/company-create'

export default {
  components: {
    UploadImgs,
    CompanyCreate,
  },
  data() {
    return {
      loading: false,
      form: {
      },
      maxNum: 1,
      initData: [],
      initPosData: [],
      showCreate: false,
    }
  },
  async mounted() {
    try {
      this.loading = true
      const res = await HRCompany.get(this.$store.getters.user.id)
      console.log("res",res);
      if (!res.logo){
        // 还未完成企业认证，会显示企业认证组件
        this.$message.warning("还未完成企业认证,请先完成认证操作之后再继续.")
        this.showCreate = true
        return
      }
      this.initData = [
        {
          id: res.id,
          display:  res.logo,
        },
      ]
      this.form = res
      this.loading = false
    } catch (error) {
      this.loading = false
      // console.log(error)
      // 还未完成企业认证，会显示企业认证组件
      this.showCreate = true
    }
  },
  methods: {
    // 上传图片之后，获取服务器返回的url地址
    async getValue() {
      const val = await this.$refs.uploadEle.getValue()
      if (val && val.length > 0) {
        this.form.logo = val[0].display
        this.form.poster = val[1].display
      }
    },
    async submitForm() {
      await this.getValue()
      const res = await Company.update(this.form.id, this.form)
      // 修改公司状态为待审核，即state=0（每修改一次企业信息之后，都需要经过管理员再次审核）
      await Company.updateState(this.form.id, 0);
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
      }
      // 刷新页面，获取修改后的最新信息
      this.loading = true
      const result = await HRCompany.get(this.$store.getters.user.id)
      this.initData = [
        {
          id: result.id,
          display: result.logo,
        },
      ]
      this.form = result
      this.loading = false
    },
    // 重置表单
    resetForm(formName) {
      this.$refs[formName].resetFields()
    },
    async createClose() {
      this.showCreate = false
      // 再次访问接口填充表单数据
      this.loading = true
      const res = await HRCompany.get(this.$store.getters.user.id)
      this.initData = [
        {
          id: res.id,
          display: res.logo,
        },
      ]
      this.form = res
      this.loading = false
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

  .posterImg {
    width: 150px !important;
  }
}
</style>
