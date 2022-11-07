<!-- 首页热门职位模块 -->
<template>
	<div class="ws-msg-form">
		<div class="msg-content">
			<p class="msg-title"  v-if="selectInfo.id==0">在线聊天</p>
			<p class="msg-title"  v-else>
				正在与 <b>{{selectInfo.name}}</b> 交流
				<span v-if="selectInfo.online">(对方在线)</span>
			</p>
			<div class="left">
				<div class="item" v-for="(item,index) in chatInfo" :key="index" @click="clickChat(item)"
						:class="{'select-style':item.id==selectInfo.id}">
					<img class="icon" :src="item.icon ? item.icon : defaultImg">
					<!-- <img class="icon" :src="defaultImg" v-else> -->
					<div class="name">{{item.name}}</div>
					<div class="msg" v-if="item.type!='sys'">
						<span v-if="item.msg && item.msg.length>0">{{item.msg[item.msg.length-1].text}}</span>
						<span v-else>快来与对方进行沟通吧</span>
					</div>
					<div class="msg" v-else>{{item.header}}</div>
					<span :class="{'newTip':item.isRead==0}"></span>
					<span :class="{'online':item.online}"></span>
					<span class="chat-time">{{item.msg[item.msg.length-1].time.split(" ")[1]}}</span>
				</div>
			</div>
			<div class="right">
				<div class="form">
					<div class="content" v-if="selectInfo.id==-1 || selectInfo.id>0">	
						<div v-if="selectInfo.msg.length>0">
							<div class="msg-item" v-for="(item,index) in selectInfo.msg" :key="index">
								<div :class="item.type">
									<img  :src="me.avatar ? me.avatar : defaultImg" v-if="item.type=='this'">
									<img  :src="selectInfo.icon" v-else>
									<span v-html="item.text"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="content" v-else></div>
					
					<div class="msg-footer">
						<textarea  v-model="inputRedis[selectInfo.id]" maxlength="500"></textarea>
						<div class="send">
							<el-row>
								<span v-if="inputRedis[selectInfo.id]">{{inputRedis[selectInfo.id].length}}/500</span>
								<span v-else>0/500</span>
								<el-button type="primary" @click="sendMsg">发送</el-button>
							</el-row>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
</template>

<script>
import { Application } from '@/model/application'
import Utils from '@/lin/util/util'
import store from '@/store';
export default{
	data(){
		return {
			me:null,
			inputRedis:{}, // 输入的内容缓存
			defaultImg:require("@/assets/image/user/user.png"),
			selectInfo:{
				id:0,
				msg:[]
			},
			chatInfo:{},
			target_info:[],
			token_msg : {},
			wsCtl:{
				allow:true,
				timer:null
			},
			hart:{
				timer:5,  // 每隔一段时间监听一次在线客户端 /s
				type:"ping",
				timeObj:null,
				check:{} // 当客户端离线之后,第一次离线的加入对象内, 如果第二次还是离线,那么将目标用户标志为离线,避免重复闪烁
			}
		}
	},
	methods:{
		clickChat(item){
			// console.log("item?",item);
			this.selectInfo=item;
			if(!item.isRead){
				this.$ws.ws.send(JSON.stringify({type:"state",readID:this.selectInfo.id}))
				item.isRead = 1;
			}
			this.moeScroll(10);
		},
		sendMsg(){
			if(!this.wsCtl.allow){return;}
			if(this.$ws.ws.readyState!=1){return this.$message.warning("暂时无法发送信息, 您与服务器的连接已断开.")}
			if(!this.inputRedis[this.selectInfo.id]) return;
			let inputMsg = this.inputRedis[this.selectInfo.id].slice(0,500); // 限制字数
			this.inputRedis[this.selectInfo.id] = ""  // 清空输入框

			this.selectInfo.msg.push({"type":"this","text":inputMsg,time:new Date().toLocaleString()})
			// this.target_info.push({"type":"target","text":inputMsg})
			this.wsCtl.timer = setTimeout(() => {
				this.wsCtl.allow = true;
				clearTimeout(this.wsCtl.timer);
				this.wsCtl.timer = null;
			}, 1000);
			try{
				this.$ws.ws.send(JSON.stringify({
					self:{
						name:this.me.nickname,
						icon:JSON.stringify(this.me.avatar).length >100 ? "null": this.me.avatar,
						id:this.me.id
					},
					target:{
						id:this.selectInfo.id,
						name:this.selectInfo.name,
						icon:JSON.stringify(this.selectInfo.icon).length >100 ? "null": this.selectInfo.icon
					},
					time:new Date().toLocaleString(),
					type:"alone",
					// this_info:this.selectInfo.msg,
					// target_info:this.target_info,
					content:inputMsg,
					recvID:this.selectInfo.id
				}));
				this.moeScroll();
				
			}catch(e){
				this.selectInfo.msg.push({"type":"this","text":"(发送失败)"+this.inputRedis[this.selectInfo.id]})
				// this.$ws.connect_sock(this.me.id)
				// this.$messge.warning("发送失败")
			}
		},
		recvMsg(){
			if (this.$ws.ws){
				// 机器人默认在线,除非用户断开了与后台的连接
				this.chatInfo["-1"]["online"] = true
				let msgInfo = {type:"token",_id:this.me.id}
				this.$ws.ws.send(JSON.stringify(msgInfo))
				
				this.$ws.ws.onmessage = async (res)=>{
					let data = JSON.parse(res.data)
					// console.log("res:",data); 
					// 捕获系统消息并跳出
					if(data.type=="system"){
						// 将匹配的内容结果传递给api,
						let info = await Application.getMsg(Utils.filterStr(data.content))
						this.chatInfo["-1"].msg.push({type:"sys",text:info.data,time:data.time});
						this.moeScroll();
						return;
					}
					
					if(data.type=="token"){
						const info = {};
						for(let i in data.content){
							let cls = data.content[i].recvId == this.me.id ? "target" : "this";
							// 如果信息列表没有这个用户的数据
							let keyID = data.content[i].sendId;
							if(info[keyID]==null){
								let name = JSON.parse(data.content[i].self).name;
								let icon = JSON.parse(data.content[i].self).icon;
								// 如果发送者的id是当前用户, 那么将写入数据的key修改为接收者的key
								if(parseInt(this.me.id) == parseInt(keyID)){
									keyID = data.content[i].recvId;
									name = JSON.parse(data.content[i].target).name;
									icon = JSON.parse(data.content[i].target).icon;
								}
								info[keyID] = keyID
								let msg = [{type:cls , text:data.content[i].content,time:data.content[i].timestamp}]
								if(this.chatInfo[keyID] && this.chatInfo[keyID]["msg"]){
									this.chatInfo[keyID]["msg"].push(msg[0]);
								}else{
									this.$set(this.chatInfo,keyID,this.packMsg(keyID,name,"alone",data.content[i].time,icon,msg,"null",0));
								}
							}else{
								this.chatInfo[keyID]["msg"].push({type:cls , text:data.content[i].content, time:data.content[i].timestamp});
							}
							this.chatInfo[keyID].isRead = data.readList.indexOf("^"+keyID+"&") != -1 ? 0 : 1;
						}
						if(data.ContactID !=-1){
							this.selectInfo = this.chatInfo[data.ContactID];
							this.selectInfo.isRead = 1;
						}else{
							let readList = data.readList.replace(/&/g,"").split("^").filter(item =>item!="")
							if(readList.length){
								this.selectInfo = this.chatInfo[readList[0]];
								if(this.selectInfo && !this.selectInfo.isRead){
									this.$ws.ws.send(JSON.stringify({type:"state",readID:this.selectInfo.id}))
									this.selectInfo.isRead = 1;
								}
							}
						}
						// 心跳包
						this.hartCheck(this.chatInfo)
						this.hart.timeObj = setInterval(() => {
							this.hartCheck(this.chatInfo)
						}, this.hart.timer*1000);
					}
					else if (data.type=="alone"){
						if(this.chatInfo[data.self.id]){
							this.chatInfo[data.self.id].msg.push({"type":"target","text":data.content,time:data.time});
							this.chatInfo[data.self.id].isRead = 0;
							
						}else{
							// 解决无法实时刷新dom
							this.$set(this.chatInfo,data.self.id,{"id":data.self.id,"name":data.self.nickName,"type":"user","time":data.time,
								"icon":data.self.icon,"msg":[{type:"target",text:data.content ,time:data.time}],"head":null,"isRead":0});
						}
						
					}else if  (data.type ==="ping"){
						this.hart.check = {}
						if (data.content.length){
							let info = data.content.split("|")
							for(let i =0;i< info.length-1;i++){
								this.hart.check[info[i]] = true
								this.$set(this.chatInfo[info[i]],"online",true)
							}
						}
					}

					this.moeScroll();
				}
			}
		},
		moeScroll(time=200){
			setTimeout(() => {
				var container = this.$el.querySelector(".content");
				container.scrollTop = container.scrollHeight;
			}, time);
		},
		getBrowserType() {
			// 获取浏览器 userAgent
			var ua = navigator.userAgent
			// 是否为 Opera
			if (ua.indexOf('Opera') > -1) { return 'Opera' }

			// 是否为 IE
			var isIE = (ua.indexOf('compatible') > -1) && (ua.indexOf('MSIE') > -1) && !isOpera
			var isIE11 = (ua.indexOf('Trident') > -1) && (ua.indexOf("rv:11.0") > -1)
			// 返回结果
			if (isIE11) { return 'IE11'
			} else if (isIE) {return "IE"}
			// 是否为 Edge
			if (ua.indexOf("Edg") > -1) { return 'Edge' }
			// 是否为 Firefox
			if (ua.indexOf("Firefox") > -1) { return 'Firefox' }
			// 是否为 Safari
			if ((ua.indexOf("Safari") > -1) && (ua.indexOf("Chrome") == -1)) { return "Safari" }
			// 是否为 Chrome
			if ((ua.indexOf("Chrome") > -1) && (ua.indexOf("Safari") > -1) && (ua.indexOf("Edge") == -1)) { return 'Chrome' }
			// 是否为 UC
			if (ua.indexOf("UBrowser") > -1) { return 'UC' }
			// 是否为 QQ
			if (ua.indexOf("QQBrowser") > -1) { return 'QQ' }
			// 都不是
			return "未知设备";
		},
		// 封装信息体
		packMsg(id,name,type,time,icon,msg,header=null,isRead=0){
			return {id:id,name:name,type:type,time:time,icon:icon ==null?this.defaultImg:icon,msg:msg,header:header,isRead:isRead};
		},
		// 心跳包检测
		hartCheck(friends){
			// 如果与服务器的连接断开了
			if(this.$ws.ws.readyState === this.$ws.ws.CLOSED){
				this.$message.warning("聊天服务器已断开")
				clearInterval(this.hart.timeObj);
				// 将所有用户设为离线
				for(let i in this.chatInfo){
					this.chatInfo[i]["online"] = false
				}
				return
			}
	
			let friends_list = ""
			for (const iterator in friends) {
				if (parseInt(iterator) >0){
					if(!this.hart.check[iterator]){
						this.$set(friends[iterator],"online",false)
					}
					friends_list += iterator+"|"
				}
			}
			this.$ws.ws.send(JSON.stringify({type:this.hart.type,friends_list}))
		}
	},
	async mounted() {
		// this.$message.closeAll();
		// this.hartCheck(this.chatInfo);
		this.me = store.getters.user;
		this.token_msg = {
			id:this.me.id,
			name:this.me.name,
			icon:this.me.acatar,
			msg:[],
			header:"null",
			isRead:1,
			type:"contact",
			time:new Date().toLocaleString()
		}
		// 默认有2个消息
		this.chatInfo["-1"] = this.packMsg("-1","校企直聘智能机","sys",new Date().toLocaleString(),require("@/assets/image/user/Cat.png")
			,[{"type":"sys","text":"\
				<div class='sys-msg'>\
					<h2>登录操作通知</h2>\
					<div class='describe'>["+this.me.nickname+"]欢迎回来校企招聘系统</div>\
					<div class='info'>\
						<div>\
							<span>设备/平台</span>\
							<span>"+this.getBrowserType()+"浏览器</span>\
						</div>\
						<div>\
							<span>登录方式</span>\
							<span>普通登录</span>\
						</div>\
						<div>\
							<span>当前时间</span>\
							<span>"+new Date().toLocaleString()+"</span>\
						</div>\
						<div>\
							<span></span>\
							<span>如有疑问,可以对我说噢!</span>\
						</div>\
					</div>\
				</div>\
			",time:new Date().toLocaleString()}],"登录操作通知",1)

		this.chatInfo["1"] = this.packMsg("1","系统管理员","alone",new Date().toLocaleString(),require("@/assets/image/user/Cat.png"),[{"type":"target","text":"反馈请留言",time:new Date().toLocaleString()}],"",1)
		this.selectInfo = this.chatInfo["-1"];
		if(this.$ws.ws.readyState!=1)return;
	 	await this.recvMsg();
	},
	beforeDestroy() {
		clearTimeout(this.wsCtl.timer);
		clearInterval(this.hart.timeObj);
	},
}
</script>

<style lang="scss" scoped>

	.ws-msg-form {
		width: 800px;
		height: 700px;
		img {
			user-select: none;
			pointer-events: none;
			border: 1px solid #ffffff;
		}
	}
	.msg-content {
		margin-left: 10px;
		display: inline-block;
		width: 100%;
		height: 80%;
		border: 1px solid rgb(143, 141, 141);
		background-color: transparent !important;
		border-radius: 5px;
		overflow: hidden;
		position: relative;
	}
	.msg-title {
		position: absolute;
		top: 0;
		text-align: center;
		width: 100%;
		background-color: rgba(39, 39, 39, 0.219);
		height: 30px;
		line-height: 30px;
	}
	.msg-content .left {
		margin-top: 30px;
		width: 200px;
		height: 95%;
		border-right: 1px solid rgb(143, 141, 141);
		overflow: auto;
		overflow-x: hidden;
		display: inline-block;
		&::-webkit-scrollbar {
			width: 5px;
		}

		&::-webkit-scrollbar-button {
			display: none;
		}
		&::-webkit-scrollbar-thumb{
			background-color: rgba(124, 124, 124, 0.438);
			border-radius: 5px;
		}

		.item {
			position: relative;
			height: 78px;
			padding-left: 20px;
			display: flex;
			align-items: center;
			cursor: pointer;
			user-select: none;

			&:hover {
				background-color: rgba(146, 146, 146, 0.3);
			}

			.icon {
				width: 40px !important;
				height: 40px !important;
				border-radius: 40px;
			}
			div {
				position: absolute;
				top:20px;
				left: 65px;
				font-size: 14px;
			}
			.msg {
				top: 45px;
				font-size: 12px;
				color: rgb(114, 114, 114);
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
				max-width: 130px;
			}
			.newTip,
			.online {
				display: inline-block;
				width:  10px;
				height: 10px;
				background: red;
				border-radius: 10px;
				position: absolute;
				left: 10px;
				top: 20px;
			}
			.online {
				background-color: greenyellow;
				top: 50px;
				left: 20px;
			}
			.chat-time {
				display: inline-block;
				font-size: 13px;
				position: absolute;
				right: 5px;
				top: 5px;
				opacity: .7;
			}
		}
	}
	.msg-content .right {
		display: inline-block !important;
		height: 94% !important;
		width: 600px !important;
		position: absolute !important;
		margin-top: 30px;
		.form {
			position: relative;
			height: 100%;
			width: 100%;
			.content {
				height: 385px;
				overflow: auto;
				padding: 0 10px;
				background-color: rgba(0, 0, 0, 0.03) !important;

				&::-webkit-scrollbar{
					overflow-y: hidden;
				}
				.msg-item {
					width: 100%;
					margin: 10px 0;
					position: relative;
					transition: all .5s;
					>div img {
						display: inline-block;
						width:  35px;
						height: 35px;
					}
					span {
						display: inline-block;
						background: white;
						padding: 10px 15px;
						font-size: 15px;
						max-width: 350px;
						margin: 10px 0;
						word-break: break-word;
					}

					.tip {
						width: 400px;
						height: 260px;
						border-radius: 10px;
						background-color: white;
						margin-left: 60px;
					}
					.sys,
					.target {
						float: left;
						margin-left: 10px;
						width: 100%;
						span {
							border-radius: 20px;
							border-top-left-radius: 0;
							margin-left: 35px;
						}
						img {
							position: absolute;
							left: 0;
						}
					}
					.this {
						position: relative;
						float: right;
						width: 100%;
						span {
							float: right;
							background-color: rgb(128,185,242);
							margin-right: 45px;
							color: white;
							border-radius: 20px;
							border-top-right-radius: 0;
						}
						img {
							position: absolute;
							right: 0;
						}

					}

					.birth-anim {
						animation-name: birth;
						animation-duration: .5s;
						animation-iteration-count:1
					}
					// 样式穿透
					::v-deep .sys-msg {
						>* {
							margin: 15px 0;
							color: #505050;
							font-size: 15px;
						}
						h2 {
							font-weight: 700;
							font-size: 18px;
						}
						.info {
							width: 400px;
							span {
								display: inline-block;
								margin-bottom: 10px;
							}
							span:nth-child(1){
								width: 100px !important;
								opacity: .7;
							}

						}
					}
					
					@keyframes birth {
						0%   {transform: translatey(50px);}
						100% {transform: translatey(0px);}
					}
				}
			}
		}
		.msg-footer {
			position: relative;
			border-top: 1px solid rgb(143, 141, 141);
			textarea {
				resize: none;
				outline: none;
				width: 100%;
				height: 100px;
				border: none;
			}
			.send {
				position: absolute;
				right: 10px;
			}
		}
	}

	.select-style {
		background-color: rgba(146, 146, 146, 0.3);
	}

	
.rou-btn {
	margin-top: 5px;
    display: inline-block;
    border: 1px solid cornflowerblue;
    color: cornflowerblue;
    border-radius: 5px;
    padding: 3px 5px;

	&:hover{
		border: 1px solid teal;
		color: teal;
	}
}



</style>