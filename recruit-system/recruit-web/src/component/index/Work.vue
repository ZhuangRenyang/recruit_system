<!-- 首页热门职位模块 -->
<template>
	<div class="work">
		<div class="contains">
			<el-tabs v-model="activeWork" class="post">
				<el-tab-pane name="hot" >
					<span slot="label" :class="{'fontSize':true}">热门职位 </span>
					<WorkList  :workSort="work" />
				</el-tab-pane >
			</el-tabs>
		</div>
		
	</div>
</template>

<script type="">
import {Position} from '@/model/position'
import WorkList from '@/component/index/WorkList'
export default{
	components:{
		WorkList,
	},
	props:{
		work :{
			default:[]
		}
	},
	data(){
		return {
			activeWork:'hot',
		}
	},
	methods:{
	},
	async mounted() {
		try{
			if (this.work.length==0) return;
			const res = await Position.sortByHits()
			this.work = res
		}catch(e){
			this.work = [
				{
					title:"没有更多职位",
					hits:0,
					city:"未知",
					salary_down:0,
					salary_up:0,
					requirement:"该职位没有详细的描述",
					logo:require("@/assets/image/logo.png"),
					company_name:"校企直聘",
					edu_back:"专科"
				}
			]
		}
	},
}
</script>

<style lang="scss">
$nx-width:76.25rem;
$nx-color2:#0470B8;
.fontSize{
	font-size: 1rem;
}
.work{
	width: 100%;
	.contains{
		width: $nx-width;
		margin:0 auto ;
		.post{
			padding:1rem;
		}
	}
}
</style>