export default {
    ws: null,
    code_200:"连接成功",
    code_402:"聊天服务器已断开",
    code_404:"连接聊天服务器失败.请稍后重新刷新页面",
    code_403:"您的浏览器不支持 WebSocket",
    res:null,
    connect_sock :function(id){
        // 浏览器不支持 WebSocket
        if (!("WebSocket" in window)) {return this.res =  this.code_403;} 
        try{
            this.ws = new WebSocket(`${process.env.VUE_APP_WS_URL}${id}`);
            this.ws.onopen = () =>{this.res = this.code_200;};
            // 连接断开
            this.ws.onclose = () =>{this.res = this.code_402;};
        }catch(e){this.res = this.code_404;}
    }
}