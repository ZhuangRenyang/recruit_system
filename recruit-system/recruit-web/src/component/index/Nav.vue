<!-- 首页的职位分类模块 -->
<template>
	<div class="Nav">
		<div class="contains">
			<div class="nav-left">
				<div class="margin-top">
					<div v-if="userstate"  v-loading="loading">
						<span class="user-data">
                          	<img :src='userImg' alt="">
							<span>
								<h6>Hi,{{name}}</h6>
								<div>欢迎回来,{{dayTime}}</div>
							</span>
							<div class="update-resume" @click="updateResume">
								<el-row>
									<el-button size="mini" round>刷新简历</el-button>
								</el-row>
							</div>
						</span>
						<div class="application" v-if="role==2">
							<p>简历情况</p>
							<div>
								<span>
									<p>{{resumeInfo.count}}</p>
									<div>
										<router-link to="/box/wait">
											总共投递
										</router-link>
									</div>
								</span>
								
								<span>
									<p>{{resumeInfo.read}}</p>
									<div>
										<router-link to="/box/wait">
											企业看过
										</router-link>
									</div>
								</span>
								<span>
									<p>{{resumeInfo.result}}</p>
									<div>
										<router-link to="/box/wait">
											企业反馈
										</router-link>
									</div>
								</span>
							</div>
							<el-row>
								<router-link to="/resume-create">
									<el-button type="primary" plain>在线简历</el-button>
								</router-link>
								<el-button @click="goToCenter" type="primary btn_two">个人中心</el-button>
							</el-row>
						</div>
						<div class="application" v-else-if="role==3">
							<p>后台管理</p>
							<el-row>
								<!-- <router-link to="/resume-create"> -->
								<router-link to="/company/modify">
									<el-button type="primary" plain>我的企业</el-button>
								</router-link>
								<router-link to="/application/wait">
									<el-button type="primary" plain>查看职位申请</el-button>
								</router-link>
								<router-link to="/interview/manage">
									<el-button type="primary" plain>面试管理 </el-button>
								</router-link>
							</el-row>
						</div>
						<div class="application" v-else>
							<p>后台管理</p>
							<el-row>
								<router-link to="/company/examine/wait">
									<el-button type="primary" plain>企业认证管理</el-button>
								</router-link>
								<router-link to="/position/examine/wait">
									<el-button type="primary" plain>职位审核</el-button>
								</router-link>
							</el-row>
						</div>
						
						<div class="describe">
							<p>疫情数据:</p>
							<ul  v-if="ESList.length">
								<li v-for="item in ESList" :key="item.id">
									<div class="esSource">来自:{{item.infoSource}}</div>
									<div class="esDate">{{item.pubDateStr}}</div>
									<div class="estitle">{{item.title}}</div>
								</li>
							</ul>
							<ul  v-else>
								<li>
									<div class="esSource">来自:校企招聘</div>
									<div class="esDate">{{dayTime.substring(6)}}</div>
									<div class="estitle">没有发现新增疫情</div>
								</li>
							</ul>
						</div>
					</div>
					<div v-else>
						<span class="user-data">
							<img :src="require('@/assets/image/user/user.png')" alt="">
							<span>
								<h6>未登录</h6>
								<div>{{dayTime}}</div>
							</span>
						</span>
						<div class="describe">
							<!-- <p>偷偷告诉你,登录后可以给心仪岗位投递简历噢!</p><br/>
							<img :src="None_img" alt=""> -->
							<p>疫情数据:</p>
							<ul  v-if="ESList.length">
								<li v-for="item in ESList" :key="item.id">
									<div class="esSource">来自:{{item.infoSource}}</div>
									<div class="esDate">{{item.pubDateStr}}</div>
									<div class="estitle">{{item.title}}</div>
								</li>
							</ul>
							<ul  v-else>
								<li>
									<div class="esSource">来自:校企招聘</div>
									<div class="esDate">{{dayTime.substring(6)}}</div>
									<div class="estitle">没有发现新增疫情</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="nav-right">
				<el-carousel height="400px">
					<!-- 轮播图 -->
					<el-carousel-item v-for="(image, index) in imglist" :key="index">
						<img :src="getCompanyImg(image)" />
					</el-carousel-item>
				</el-carousel>
			</div>
		</div>
	</div>
</template>

<script>
import { Category } from '@/model/category'
import { Position } from '@/model/position'
import { Application } from '@/model/application'
import store from '@/store';
import {
  mapActions,
} from 'vuex'
import _axios, { get} from '@/lin/plugin/axios'

import vueQr from 'vue-qr'
export default {
	components:{
		Position,
		vueQr,
		top
	},
	data() {
		return {
			userImg:null,
			name: '',
			wName: [],
			role:0, // 求职者 2 , hr 3  , 管理员 1 4 5
			dayTime:"",
			overList: false,
			outList: true,
			resumeInfo:{
				count:0,
				read:0,
				result:0
			},
			imglist: [ "01.png", "02.jpg", "03.jpg", "04.jpg"],
			downloadData: {
                url: 'https://www.bilibili.com/',  //需要转化成二维码的网址
                // icon: "https://profile.csdnimg.cn/A/2/0/3_weixin_40888956"  //二维码中间的图片
            },
			None_timer:0,
			None_img:require("@/assets/image/company/ca9bb32d14.jpg"),
			loading:false,
			ESList:[], // 疫情数据
		}
	},
	computed:{
		userstate: function () {
			this.getUserState()
			if (!store.getters.user) {
				return false
			}
			this.name = store.getters.user.nickname;
			return true
		}
	},
	methods:{
		...mapActions(['loginOut', 'setUserAndState']),
		getCompanyImg(name){
			return require("@/assets/image/company/" + name);
		},
		goToCenter() {
			this.$router.push('/center')
		},
		getUserState(){
			let date=new Date();
			if(store.getters.user){
				clearInterval(this.None_timer)
				this.getResume()
				if(date.getHours()>=7&&date.getHours()<11){
					this.dayTime = "上午好";
				}else if(date.getHours()>=11&&date.getHours()<13){
					this.dayTime = "中午好";
				}else if(date.getHours()>=13&&date.getHours()<18){
					this.dayTime = "下午好";
				}else if(date.getHours()>=18&&date.getHours()<23){
					this.dayTime = "晚上好";
				}else{
					this.dayTime = "夜深了,早点休息";
				}
				try{
					this.userImg = store.getters.user["avatar"] ? store.getters.user.avatar : require("@/assets/image/user/user.png");
				}catch(e){
					console.log();
				}
			}else{
				this.None_timer = setInterval(() => {
					let date= new Date();
					var hour=date.getHours();
					hour=hour<10?"0"+hour:hour;
					var minute=date.getMinutes();
					minute=minute<10?"0"+minute:minute;
					var second=date.getSeconds();
					second=second<10?"0"+second:second;
					this.dayTime= `当前时间: ${hour}:${minute}:${second}`
				}, 1000);
			}
		},
		// 获取简历情况
	 	async getResume(){
			this.resumeInfo = {count:0,read:0,result:0}
			// 如果user的id为null,那么拦截下来并注销账号信息,解决首次访问时无法请求后台
			if (!this.$store.getters.user.id){
				this.loginOut()
				return;
			};
			this.role =  await get('recruit/user/getGroup/' + this.$store.getters.user.id) // 权限
			if(this.role!=2) return; // 只有应聘者才需要简历
			const temp = await Application.getByUserId(this.$store.getters.user.id)
			if(temp.total==0) return;
			this.resumeInfo.count = temp.total;
			for (let i in temp.items){
				if (temp.items[i].state >=3){this.resumeInfo.result +=1;}
				if (temp.items[i].state == 1){this.resumeInfo.read +=1;}
			}
		},
		updateResume(){
			this.resumeInfo = {count:0,read:0,result:0}
			if(this.loading) return;
			this.loading = true;
			setTimeout(() => {
				this.loading = false
				this.getResume();
			}, 1500);
		}
	},
	async mounted() {
		let data = await Application.ESsituation();
		this.ESList = data.data.newslist[0].news;
		const res = await Category.show()
		this.wName = res
		// console.log(Observer.onEvent.onmessage());
	},
}
</script>

<style lang="scss">
$nx-color: #449efe;
$all-padding: 0;
.Nav {
	width: 100%;
	height: 29rem;
	.contains {
		position: relative;
		width: 76.25rem;
		margin: 0 auto;
		.nav-left {
			margin-top: 1rem;
			.margin-top {
				width: 300px;
				height: 380px;
				>div {
    				box-shadow: 
						0px 0px 2px gainsboro,
                    	0px 0px 3px gainsboro,
                    	0px 0px 4px gainsboro;
					height: 100%;
					padding: 10px;
					text-align: left;
				}
				.user-data {
					span:nth-child(1) {
						display: inline-block;
						width: 100%;
						text-align: left;
					}
					span:nth-child(2) {
						display: inline-block;
						line-height: 30px;

						h6 {
							font-size: 16px;
							font-weight: 700;
						}
						div {
							font-size: 14px;
							opacity: .7;
						}
					}
					img {
						display: inline-block;
						width: 50px;
						margin-right: 15px;
					}
					.update-resume {
						position: absolute;
						top: 10px;
						left: 220px;
					}
				}
				.application {
					margin-top: 15px;
					text-align: center;
					>div>a{
						margin: 0 10px;
					}
					>div>span {
						display: inline-block;
						width: 33%;
						p {
							// margin-bottom: 10px;
							font-weight: 500;
							font-size: 24px;
							line-height: 34px;
							color: #5b7be9;
						}
						div {
							font-size: 12px;
							line-height: 17px;
							color: #333;
						}
					}
					button {
						margin-top: 10px;
						border-radius: 4px;
					}
					.btn_two {
						width: 150px;
						margin-left: 10px;
					}
					>p {
						border-top: 1px solid #00000017;
						padding-top: 10px;
					}
				}
				.describe {
					margin-top: 15px;
					list-style: 25px;
					height: 170px;
					.user-qr {
						text-align: center;

						img {
							width: 100px;
						}
					}
					>img {
						display: inline-block;
						height: 100%;
					}
					>P{
						font-weight: 700;
						font-size: 15px;
					}
					ul {
						overflow: auto;
						height: 97%;
					}
					ul::-webkit-scrollbar {
						width: 3px;
						overflow-x: hidden;
						overflow-y: hidden;
					}
					ul::-webkit-scrollbar-button{
						display: none;
					}
					ul::-webkit-scrollbar-thumb {
						background: #8b8b8b;
					}

					li {
						margin: 10px 0;
						font-size: 14px;
						padding: 5px;
						border-radius: 3px;
						cursor: pointer;
						border: 1px solid #c5c0c0;
						
						&:hover {
							background:#ebebeb;
							
							.esDate {
								color: rgb(0, 0, 0);
							}
						}

						.esSource,
						.esDate {
							display: inline-block;
							margin: 0 0 5px 5px;
						}
						.esSource {
							margin-left: 0;
						}
						.esDate {
							float: right;
							font-family: cursive;
							color: white;
							transition: color .5s;
						}
					}
				}
			}
		}
		.nav-right {
			position: absolute;
			right: 0;
			top: 0;
			width: 56rem;
			height: 27rem;
			img {
				height: 100%;
			}
			.work-list {
				position: absolute;
				width: 200px;
				height: 100%;
				background-color: rgba(79,90,102,.6);
				color: #fff;
				z-index: 99;
				overflow: auto;

				&::-webkit-scrollbar {
					width: 1px;
					transition: all .5s;
					opacity: 0;
				}
				&::-webkit-scrollbar-thumb {
					border-radius: 10px;
					background: rgba(22, 22, 22, 0.5);
				}
				&::-webkit-scrollbar-track {
					border-radius: 0;
					background: rgba(255, 255, 255);
				}
				&::-webkit-scrollbar-thumb:hover {
					width: 5px;
				}

				&:hover &::-webkit-scrollbar-thumb {
					opacity: 0;
				}
			}
			.work-li {
				position: relative;
				display: block;
				height: 3rem;
				line-height: 3rem;
				user-select: none;
				> span {
					font-size: 1rem;
					cursor: default;
				}
				&:hover,
				&:hover ul {
					display: block;
					background-color: rgba(0,0,0,.2);
					z-index: 10;
				}
			}
			// 当没有通过api获取到数据时渲染的li标签
			.nav-left-main-notList {
				border: 1px solid #dcdcdc;
			}
		}
	}
}
</style>