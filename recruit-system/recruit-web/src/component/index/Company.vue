<!-- 首页的热门公司模块 -->
<template>
	<div class="company">
		<el-tabs v-model="activeCompany" class="companyList"  >
			<el-tab-pane name="hotCompany">
				<span slot="label" :class="{'fontSize':true,'cur':true}">热门公司</span>
				<CompanyList :companys="company_List" />
			</el-tab-pane>
		</el-tabs>
	</div>
</template>

<script type="">
import {Company} from '@/model/company'
import CompanyList from '@/component/index/CompanyList.vue'
export default{
	components:{
		CompanyList,
	},
	data(){
		return {
			activeCompany:'hotCompany',
			company_List:[],
		}
	},
	async mounted() {
		const res = await Company.findHotCompany()
		let random;
		while(this.company_List.length<8){
			random = Math.floor(Math.random() * res.length);
			this.company_List.push(res[random]);
			res.splice(random,1)
		}
  	},
}
</script>

<style lang="scss">
	$nx-color2:#0470B8;
	$nx-width:76.25rem;
	.fontSize{
		font-size: 1rem;
	}
	.cur{
		cursor: text;
	}
	.company{
		width: 100%;
		.companyList{
			width:$nx-width;
			margin:1.5rem auto;
			padding: 0 1rem 1rem;
		}
	}
</style>