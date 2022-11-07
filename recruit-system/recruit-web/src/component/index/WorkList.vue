<!-- 首页热门职位的职位卡片模块 -->
<!-- 根据传入的workSort的值显示数据 -->
<template>
	<div class="workList">
		<el-dialog :visible.sync="showDetail">
			<div style="margin-left:20% ; text-align: center" >
				<position-detail v-if="showDetail" @detailClose="detailClose" :detailPositionID="detailPositionID" :temp="1">
				</position-detail>
			</div>
		</el-dialog>
		<ul class="work_list" v-if="workSort.length>0">
			<li v-for="(work,index) in workSort" :key="index" class="cardWork" @click.prevent="handleDetail(work)" >
				<div class="cardList">
					<div class="cardWork_Up">
						<div>
							<strong class="card_workNT"><span class="card_workName" :title="work.title">{{work.title}}</span></strong>
						</div>
						<div style = "margin-top:8px;" class="card-label">
							<span class="el-icon-location-information" :title="'公司位置: '+work.city">{{work.city}}</span>
							<span class="el-icon-user" :title="'学历要求: '+work.edu_back">{{work.edu_back}}</span>
							<span class="el-icon-view" :title="'职位浏览量: '+work.hits">{{work.hits}}</span>
						</div>
						<div style = "margin-top:10px;" class="card_des">
							<span :title="work.requirement">{{work.requirement}}</span>
						</div>
						<div class="card_workMoney">
							<!-- <span style="float: left;">薪资：</span> -->
							<span style="float: left;" v-if="work.salary_down>=1000">{{work.salary_down/1000}}</span>
							<span style="float: left;" v-else>{{work.salary_down}}元</span>
							<span style="float: left;">~</span>
							<span style="float: left;" v-if="work.salary_up>1000">{{work.salary_up/1000}}k</span>
							<span style="float: left;" v-else>{{work.salary_up}}元/天</span>
						</div>
					</div>
					<!-- 公司logo / 名字 -->
					<div class="cardWork_Down">
						<div class="card_workImg">
							<img :src="work.logo">
							<span>{{work.company_name}}</span>
						</div>
						<!-- <div style="margin-top:10px; margin-right:30px;">
							<p style="line-height: 20px">{{work.requirement}}</p>							
						</div> -->
					</div>
				</div>

			</li>
		</ul>
	</div>
</template>

<script type="">
	import PositionDetail from '@/view/position/position-detail'
	export default{
		data(){
			return{
				showDetail: false, // 是否显示职位详情页
				detailPositionID: 0, // 职位id
				workList:[]
			}
		},
		props:['workSort'],
		methods:{
			handleDetail(val) {
				this.showDetail = true;
				this.detailPositionID = val.id;
			},
			detailClose() {
				this.showDetail = false;
			},
			getShufflePos(array){
				let res = [],random;
				while(array.length>0){
					random = Math.floor(Math.random() * array.length);
					res.push(array[random]);
					array.splice(random,1);
				}
				return res;
			},
		},
		components:{
			PositionDetail,
		}

	}
</script>

<style lang="scss">
$nx-color2:#0470B8;
$nx-width:76rem;
.workList{
	width: 100%;
	.work_list{
		width: $nx-width;		
		margin: 1rem auto;
		zoom:1;
		&:after{
			display: block;
			content: '.';
			clear: both;
			line-height: 0;
			visibility: hidden;
		}
		.cardWork{
			position: relative;
			float: left;
			// width: 17.6rem;
			// height: 16.75rem;
			width: 23.5rem !important;
			height: 10rem !important;
			border:1px solid #eee;
			margin: 1rem 1rem 0 0;
			box-shadow: 1px 1px 1px #888;
			border-radius: 5px;
			border-bottom-right-radius: 20px;
			>div{
				width: 100%;
				height:100%;
				padding:  1rem;
				overflow: hidden;
				text-align: center;
				
				.cardWork_Up {
					// color: #999;
					text-align: left;
					.card_workNT {
						display: inline-block;
						font-weight: 400;


						.card_workTime {
							font-size: 0.8rem;
						}
					}

					.card_workExp {
						font-size: 0.8rem;
						color: #888;
					}

					ul {
						height: 4rem;
						border-bottom: 1px dashed #ddd;

						.card_workTags {
							float: left;
							font-size: 0.6rem;
							border: 1px solid #eee;
							padding: 0.2rem 0.3rem;
							margin: 0.6rem 0.6rem 2rem 0;
						}
					}
					// 职位标签
					.card-label span {
						display: inline-block;
						background-color: rgba(194, 194, 194, 0.2);
						padding: 3px 5px;
						font-size: 15px;
						margin: 0 5px;
						transition: all .3s;
						color: rgb(105, 105, 105);
						border-radius: 3px;
					}
					.card-label span::before {
						margin-right: 2px;
					}
					.card-label span:hover {
						color: white;
						background-color: rgba(0, 0, 0, 0.5);
					}
					// 职位描述
					.card_des span {
						max-width: 350px;
						width: 350px;
						overflow: hidden;
						display: inline-block;
						height: 45px;
						white-space: nowrap;
						text-overflow: ellipsis;
						margin-top: 10px;
						color: black;
					}
				}

				.cardWork_Down {
					float: left;
					width: 100%;
					height: 2.5rem;
					margin-top: 0.5rem;

					.card_workImg {
						width: 100%;
						text-align: left !important;
						height: 40px;
						line-height: 40px;
						display: flex;
						align-content: center;
						position: absolute;
						bottom: 0px;
						left: 0;
						background-color: rgba(185, 185, 185, 0.1) !important;
					}
					.card_workImg img {
						display: inline-block;
						margin-right: 1rem;
						width: 100px !important;
						border-right: 1px solid rgba(0, 0, 0, 0.1);
						background-color: white;
					}

					div {
						display: inline-block;

						span {
							font-size: 0.9rem;
						}

						ul .card_workIncTags {
							float: left;
							font-size: 0.8rem;
							color: #aaa;
						}
					}
				}
				
				// 薪水
				.card_workMoney {
					color: #FA606B; 
					margin-left: 75px; 
					margin-top:10px;
					position: absolute !important;
					top: 10px !important;
					right: 1rem;
					font-size: 19px;
				}
				// 职位名称
				.card_workName {
					float: left;
					max-width: 12rem;
					font-size: 1rem;
					text-overflow: ellipsis;
					overflow: hidden;
					white-space: nowrap;
					color: black !important;

					&:hover {
						color: $nx-color2 !important;
					}
				}
			}
		}
	}	
	.dialog {
		margin-top: 20px !important;
	}
	.el-dialog__header {
		display: none !important;

	}
	.el-dialog__body {
		
		>div:nth-child(1) {
			margin: 0 !important;
		}
		.el-form-item {
			margin: 0 !important;

			.el-form-item__content{
				margin-bottom: 0 !important;
			}
		}
		.wrap >div{
			widows: 100% !important;
		}
	}
	
	
	.pagination {
		display: flex;
		justify-content: flex-end;
		margin: 30px;
	}	

}
</style>