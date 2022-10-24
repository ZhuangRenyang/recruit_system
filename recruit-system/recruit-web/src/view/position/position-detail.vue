<template>
	<div class="container">
		<div class="title">
			<span>职位详细信息</span>
			<span class="back" @click="back">
			<i class="iconfont icon-fanhui"></i> 返回
			</span>
		</div>
		<el-divider></el-divider>
		<div class="wrap">
			<el-row>
				<el-col :xs="24">
					<el-form :model="form" status-icon ref="form" label-width="100px" v-loading="loading" @submit.native.prevent>
						<el-form-item label="职位名称" prop="title">
							<span>{{ form.title }}</span>
						</el-form-item>
						<el-form-item label="职位发布者" prop="title" v-if="hr">
							<span class="hr-name">{{ hr.name }}</span>
							<img :src="hr.avatar" alt="" class="hr-img">
							<span v-if="me">
								<el-button type="success" plain icon="el-icon-chat-line-round" class="mini" @click="contactHR" v-if="!me.hr">联系ta</el-button>
							</span>
							<span v-else class="login-msg">
								<el-alert title="登录后可与hr在线沟通噢" type="success"> </el-alert>
							</span>
						</el-form-item>
						<!-- <el-form-item label="所属分类" prop="category_name">
						<span>{{ form.category_name }}</span>
						</el-form-item> -->
						<el-form-item label="职位浏览量" prop="hits">
							<span>{{ form.hits }}</span>
						</el-form-item>
						<el-form-item label="招聘人数" prop="quantity">
							<span>{{ form.quantity }}</span>
						</el-form-item>
						<el-form-item label="薪资" prop="salary_up">
							<span>${{ form.salary_down }}~${{ form.salary_up }}</span>
						</el-form-item>
						<el-form-item label="工作地点" prop="city" v-if="me && !me.hr">
							<span>{{ form.city }}->({{city}})</span>&nbsp;
							<el-button type="success" plain icon="el-icon-map-location" class="mini" @click="showMap" >查看地图</el-button>
						</el-form-item>
						<el-form-item label="学历要求" prop="edu_back" v-if="me && !me.hr">
							<span>{{ form.edu_back }}</span>
						</el-form-item>
						<el-form-item label="职位要求" prop="requirement">
							<span>{{ form.requirement }}</span>
						</el-form-item>
						<el-form-item label="公司名称" prop="company_name" v-if="me && !me.hr">
							<span>{{ form.company_name }}</span>
						</el-form-item>
						<el-form-item label="公司简介" prop="company_desc">
							<span>{{ form.company_desc }}</span>
						</el-form-item>
						<el-form-item class="submit" v-if="me && !me.hr">
							<!--通过职位的状态属性state来控制通过按钮和不通过按钮是否显示-->
							<el-button type="primary" @click="handlePass('form')" v-if="form.state == 0 && flag">通 过</el-button>
							<el-button @click="handleFail('form')" v-if="form.state == 0 && flag">不通过</el-button>
							<span  v-if="temp == 1">
								<el-button type="primary" @click="handleDelivery('form')" v-if="isDelive('form')">投递简历</el-button>
								<el-button type="primary" v-else>已投递</el-button>
								<el-button @click="handleCollect('form')" class="el-icon-star-off">收藏职位</el-button>
							</span>
							<!-- <el-button type="primary" @click="handleDelivery('form')" v-if="temp == 1">投递简历</el-button> -->
							<!-- <el-button @click="handleCollect('form')" v-if="temp == 1">收藏职位</el-button> -->  
						</el-form-item>
						
						<el-form-item  v-else><span class="group-not">您在本次职位浏览中的权限是有限的(无法投递简历等..)</span></el-form-item>
					</el-form>
				</el-col>
			</el-row>
		</div>

		<el-dialog  
		:visible.sync="outMap"
		append-to-body
		class="mapUI">
			<!-- 地图 -->
			<div>
				<div id="container" style="height:660px;"></div>
			</div>
			<div class="mapUI-describe">
				<!-- <div>
					<span>当前坐标:</span> 
					<span>{{mapData.point}}</span>
				</div> -->
				<div>
					<span>省份:</span>
					<span>{{mapData.city}}</span>
				</div>
				<div>
					<span>目的地:</span>
					<span>{{mapData.district}}</span>
				</div>
				<div>
					<span>公司:</span>
					<span>{{form.company_name}}</span>
				</div>
				<div>
					<span>具体位置:</span>
					<span>{{mapData.address}}</span>
				</div>
				<div>
					<span>退出地图预览</span>
					<span>
						<el-button type="primary" round @click="outMap=false">退出</el-button>
						</span>
				</div>
				<!-- <div>你可能想找:</div>
				<div v-if="mapData.searchList" class="searchList">
					<div v-for="(item,index) in mapData.searchList" :key="index" @click="form.company_name = item.title"
					:title="item.address" >
						<span @click="showMap">({{item.address.substring(0,2)}}){{item.title}}</span>
					</div>
				</div> -->
			</div>
		</el-dialog>
		
	</div>
</template>

<script>
import { Position } from '@/model/position'
import { Application } from '@/model/application'
import { Resume } from '@/model/resume'
import { Favor } from '@/model/favor'
import Vue from 'vue'
import Utils from "@/lin/util/util"
import User from '@/lin/model/user'

import store from '@/store';
import router from '../../router'
import provinces from "@/lin/util/provinces"
import { VueJsonp } from 'vue-jsonp'
Vue.use(VueJsonp)

export default {
  // 定义变量
  props: {
    // 子组件定义的变量通过父组件赋值
    detailPositionID: {
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
		me:null,
		hr:null,
		city:null,
		loading: false,
		outMap : false,
		form: {},
		list: {
			user_id: '',
			position_id: '',
			resume_id: '',
			hr_id: '',
			company_id: '',
		},
		collect: {},
		mapData:{point:"",city:null,district:null,searchList:null,address:null},
		deAvatar:require("@/assets/image/user/94bf413e-7176-4713-bc08-fbfa44ac0f11.png")
    }
  },
  	async mounted() {
		this.loading = true
		const res = await Position.getById(this.detailPositionID)
		// 更新职位浏览量(每进入一次职位详情页面，职位浏览量加一)
		await Position.updateHits(this.detailPositionID)
		this.form = res
		this.loading = false;
		this.hr = await User.getID_UserData(this.form.hr_id)
		this.hr.avatar = this.hr.avatar!=null ? this.hr.avatar : this.deAvatar
		
		// 获取当前工作地点处于的省份
		provinces.forEach((item,index) => {
			item.city.forEach((itt, idx) => {
				if (itt.name.indexOf(this.form.city)!=-1) {
					this.city = item.name
				}else{
					// 如果 当前公司地址属于附属城市,那么判定当前城市的所有附属城市中是否有当前城市开头的,以"标识
					if(JSON.stringify(itt.districtAndCounty).indexOf('"'+this.form.city)!=-1){
						this.city = item.name
					}
				}
			})
		})
		// console.log("读取到的权限",store.getters.user);
		if (store.getters.user){
			// 未登录状态和hr不执行后续代码
			this.me = store.getters.user;
			if(this.me)return;
			this.getInfo()
		}
  },
  	methods: {
		async handlePass(val) {
		const res = await Position.updateState(this.detailPositionID, 1)
		if (res.code < window.MAX_SUCCESS_CODE) {
			this.$message.success(`${res.message}`)
			// 返回查询所有未审核职位的页面
			this.$emit('detailClose')
		}
		},
		async handleFail(val) {
		const res = await Position.updateState(this.detailPositionID, 2)
		if (res.code < window.MAX_SUCCESS_CODE) {
			this.$message.success(`${res.message}`)
			// 返回查询所有未审核职位的页面
			this.$emit('detailClose')
		}
		},
		async isDelive(val){
			if(!this.$store.getters.user) return;
			let result = await Application.getByPositionIdAndUserId(this.detailPositionID, this.$store.getters.user.id);
			// console.log("result",result);
			return result;
		},
		// 投递简历
		async handleDelivery(val) {
			if (this.$store.getters.user === null) {
				this.$message.error("请注册登录后投递简历")
				return
			}
			// 根据用户id和职位id判断用户是否已经投递过该职位，避免重复投递
			const flag = await Application.getByPositionIdAndUserId(this.detailPositionID, this.$store.getters.user.id)
			if (flag === false) {
				// 不能重复投递
				this.$message.error("你已投递过该职位，不可重复投递")
			} else {
				// 获取当前登录求职者的用户id
				this.list.user_id = this.$store.getters.user.id
				// 获取当前投递简历的职位id
				this.list.position_id = this.detailPositionID
				// 根据用户id查询绑定的简历id
				const temp = await Resume.getByUserId(this.$store.getters.user.id)
				this.list.resume_id = temp.resume_id
				// 根据职位id查询该职位所对应的hr_id
				const result = await Position.getById(this.detailPositionID)
				this.list.hr_id = result.hr_id
				this.list.company_id = result.company_id
				// 调用创建申请的方法
				const res = await Application.create(this.list)
				if (res.code < window.MAX_SUCCESS_CODE) {
				this.$message.success(`${res.message}`)
				}
			}
		},
		async getInfo() {
			// 获取当前登录求职者的用户id
			this.list.user_id = this.$store.getters.user.id
			// 获取当前投递简历的职位id
			this.list.position_id = this.detailPositionID
			// 根据用户id查询绑定的简历id
			const temp = await Resume.getByUserId(this.$store.getters.user.id)
			this.list.resume_id = temp.id
			// 根据职位id查询该职位所对应的hr_id
			const result = await Position.getById(this.detailPositionID)
			this.list.hr_id = result.hr_id
			this.list.company_id = result.company_id
		},
		// 收藏职位
		async handleCollect(val) {
			if (this.$store.getters.user === null) {
				this.$message.error("请注册登录后收藏职位")
				return
			}
			// 获取当前登录求职者的用户id
			this.collect.user_id = this.$store.getters.user.id
			// 获取当前收藏的职位id
			this.collect.position_id = this.detailPositionID
			// 调用添加收藏的方法
			const res = await Favor.create(this.collect)
			if (res.code < window.MAX_SUCCESS_CODE) {
				this.$message.success(`${res.message}`)
			}
		},
		back() {
			// this.$router.go(-1)
			// 由于showEdit这个变量是在父组件定义的，因此不能在子组件改变该变量的值，可以使用事件传递的方式，当点击了返回按钮，触发的事件处理机制交给父组件去处理
			this.$emit('detailClose')
		},
		// 查看地图
		showMap(){
			// 显示地图组件,优先执行,保证地图组件能够正常创建
			this.outMap = true;
			this.searchMap()
		},
		searchMap(){
			this.$message.success("正在获取地图数据")
			let url = "https://apis.map.qq.com/ws/place/v1/suggestion";
			let __this = this;
			this.$jsonp(url, {
					key: Utils.getMapAPI(),
					region: this.form.city,
					keyword: this.form.company_name,
					output: "jsonp",
				})
			.then((res) => {
				res.data.forEach((item) => {
					item.value = item.title;//因为element的远程搜索只能识别value所以需要对返回的数据进行一下处理
				});
				// console.log("res.data",res.data);
				__this.mapData.searchList = res.data
				if(res.data[0]){
					__this.mapData.address = res.data[0].address
					__this.mapData.city = res.data[0].province
					__this.mapData.district = res.data[0].city + "/"+res.data[0].district
					__this.createMap(res.data[0].location.lat,res.data[0].location.lng)
				}
			})
			.catch((err) => {
			console.log(err);
			});
		},
		// 生成地图数据
		createMap(w,h){
			//步骤：定义map变量 调用 qq.maps.Map() 构造函数   获取地图显示容器
			//自己设置地图中心点
			var myLatlng = new qq.maps.LatLng(w,h);
			this.mapData.point = w+","+h;
			//定义工厂模式函数
			var myOptions = {
				zoom: 15,               //设置地图缩放级别
				center: myLatlng,      //设置中心点样式
				mapTypeId: qq.maps.MapTypeId.ROADMAP  //设置地图样式详情参见MapType
			}
			//获取父元素
			let content = document.getElementById("container");
			//循环删除子元素，一直删除第一个子元素直到没有子元素即为清空
			while (content.hasChildNodes()) {
				content.removeChild(content.firstChild);
			}
			//获取dom元素添加地图信息
			var map = new qq.maps.Map(document.getElementById("container"), myOptions);
			//给定位的位置添加图片标注
			var marker = new qq.maps.Marker({
				position: myLatlng,
				map: map
			});
			//给定位的位置添加文本标注
			var marker1 = new qq.maps.Label({
				position: myLatlng,
				map: map,
				content:this.form.company_name
			});
			this.$message.success("获取地图数据成功!")
		},
		contactHR(){
			let msg = {
				recvId:this.form.hr_id,
				self:{name:this.me.nickname,icon:this.me.avatar},
				target:{name:this.hr.name,icon:this.hr.avatar},
				time:new Date().toLocaleString()
			}
			let data = {type:"handToken",info:msg}
			this.$ws.ws.send(JSON.stringify(data))
			this.$router.push("/ws-msg")
		}
	},
}
</script>

<style lang="scss" scoped>
.el-divider--horizontal {
  	margin: 0;
}
// 父窗口的类
.container {
	text-align: left;

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

	.hr-name {
		margin-left: 40px;
		margin-right: 10px;
	}
	.hr-img {
		display: inline-block;
		width: 32px;
		height: 32px;
		position: absolute;
		left: 0;
	}
  }

  .submit {
    float: left;
  }
}

@media screen and (max-width :1000px){
	.mapUI-describe {
		width: 250px;
	}
}
.mapUI {
	overflow: hidden;
	z-index: 9999;
	.mapUI-describe {
		background: #0000005e;
		color: white !important;
		padding: 5px;
		position: absolute;
		top: 0;
		right: 0;
		border-radius: 5px;
		border-top-left-radius: 0;
		border-bottom-right-radius: 0;
		transition: rgba,width .5s;
		&:hover {
			background: rgba(0, 0, 0, 0.7);
		}

		>div {
			margin-bottom: 20px;
			>span {
				display: inline-block;
			}
			>span:nth-child(1){
				width: 30%;
				text-align: left;
			}
			>span:nth-child(2){
				width: 70%;
				text-align: right;
				// color: black;
			}
		}
		.searchList {
			border: 1px solid black;
			height: 200px;
			overflow: auto;

			div {
				margin: 10px 0;
				padding: 10px 0;
				text-align: center;
				color: black;
				font-size: 16px;
			}
			div:hover {
				background-color: #0000002b;
			}
			div::-webkit-scrollbar {
				width: 2px !important;
			}
		}
	}
	.el-dialog {
		margin-top: 10vh !important;
		width: 80% !important;
		font-size: 25px;
	}
	::v-deep .el-dialog__header {
		display: none;
	}
}

.login-msg >div{
	padding: 0 !important;
	transition: all .5s;
	&:hover{
		color: #454641;
		background: none;
		// border: 1px solid #aaffaa;
	}
}
.group-not{
	color: crimson !important;
	cursor: pointer;
	pointer-events: none;
	user-select: none;
}

</style>
