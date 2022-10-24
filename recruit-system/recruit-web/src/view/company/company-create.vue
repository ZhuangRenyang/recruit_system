<template>
  <div class="container">
	<div class="title">企业认证</div>
	<div class="wrap">
	  <el-row>
		<el-col :lg="16" :md="20" :sm="24" :xs="24">
		  <el-form :model="form" status-icon ref="form" label-width="100px" @submit.native.prevent>
			<el-form-item label="公司名称" prop="name">
			  <el-input size="medium" v-model="form.name" placeholder="请填写公司名称"></el-input>
			</el-form-item>
			<el-form-item label="公司外文名" prop="foreign_name">
			  <el-input size="medium" v-model="form.foreign_name" placeholder="请填写公司外文名"></el-input>
			</el-form-item>
			<el-form-item label="总部地点" prop="city">
			  <el-input size="medium" v-model="form.city" placeholder="请填写总部地点"></el-input>
			</el-form-item>
			<el-form-item label="公司logo" prop="logo">
				<h6>填写顺序,第一张图为公司logo(必填), 第二张图为公司海报(非必填)</h6>
			  	<upload-imgs :max-num="2" ref="uploadEle" class="logo"/>
			</el-form-item>
			<el-form-item label="公司使命" prop="mission">
			  <el-input size="medium" v-model="form.mission" placeholder="请填写公司使命"></el-input>
			</el-form-item>
			<el-form-item label="公司简介" prop="description">
			  <el-input size="medium" type="textarea" :autosize="{ minRows: 4, maxRows: 8 }"
				placeholder="请输入公司简介" v-model="form.description" >
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
import {Company} from '@/model/company'
import {HRCompany} from '@/model/hrCompany'
import UploadImgs from '@/component/base/upload-image'

export default {
  components: {
	UploadImgs,
  },
  data() {
	return {
	  form: {
	  },
	  maxNum: 1,
	  loading: false,
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
	async submitForm(formName) {
	  await this.getValue()
	  try {
		this.loading = true
		// 新增企业
		const res = await Company.create(this.form)
		// 根据新增的企业的名称查询company表，拿到对应的id
		const result = await Company.getByName(this.form.name)
		// 根据hr_id和company_id新增一条记录到hr_company表
		await HRCompany.create(this.$store.getters.user.id, result.id)
		this.loading = false
		if (res.code < window.MAX_SUCCESS_CODE) {
		  this.$message.success(`${res.message}`)
		  // 返回我的企业信息页面
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
