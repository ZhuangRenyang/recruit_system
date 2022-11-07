<template>
  <div id="app"><router-view /></div>
</template>

<script>
import { mapActions } from 'vuex'
import Vue from 'vue'
import store from '@/store';

export default {
	data() {
		return {
			timer: null,
			eventBus: new Vue(),
		}
	},
	mounted() {
		document.getElementById('loader').style.display = 'none'
		if (store.getters.user){
			this.localSocket();
			this.conentWs();
			return;
		}
		// this.$message.warning("未登录账号,无法连接至聊天服务器")
		if (this.$ws.ws){this.$ws.ws.close()}
		// 如果没有成功的链接到ws, 那么每1.5秒侦听一下状态
		this.timer = setInterval(() => {
			if (store.getters.user){
				this.localSocket();
				this.conentWs();
				clearInterval(this.timer);
				this.timer = null;
			}
		}, 1500);
	},
	provide() {
		// eventBus挂载的事件： addGroup addUser
		return {
		eventBus: this.eventBus,
		}
	},
	methods: {
		...mapActions(['loginOut']),
			localSocket() {
				this.$ws.connect_sock(store.getters.user.id)
			},
		conentWs(){
			if (this.$ws.ws){
				this.$ws.ws.onmessage = (res)=>{
					let data = JSON.parse(res.data)
					let href = window.location.href;
					if (href.split("#")[1] == "/ws-msg") return;
					if (data.type=="alone"){
						this.$message({
							type: 'success',
							dangerouslyUseHTMLString: true,
							duration:2000,
							message: `收到来自:[${data.self.name}]的信息,${data.content.slice(0,10)}.....<br>
							<a class="rou-btn" href="#/ws-msg">快速跳转</a>`
						});
					}else if(data.type=="tips"){
						if(data.isTip){
							this.$message({
								type: 'success',
								dangerouslyUseHTMLString: true,
								duration:2000,
								message: `您有新的未读消息,请注意查看<br>
								<a class="rou-btn" href="#/ws-msg">快速跳转</a>`
							});
						}
					}
				}
			}
		},
  	},
}

</script>
<style lang="scss">
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;

  #nav {
    padding: 30px;

    a {
      font-weight: bold;
      color: #2c3e50;

      &.router-link-exact-active {
        color: #42b983;
      }
    }
  }

  input:-webkit-autofill,
  input:-webkit-autofill:hover,
  input:-webkit-autofill:focus,
  input:-webkit-autofill:active {
    transition-delay: 99999s;
    transition: color 99999s ease-out, background-color 99999s ease-out;
  }
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
