<!-- 首页 -->
<template>
	<div id="app">
		<Top :isnow="1" />
		<!-- <Nav /> -->
		<Search />
		<!-- <Work /> -->
		<Company />
		<div class="friend">
			<el-tabs class="friendList">
				<el-tab-pane>
					<span slot="label" :class="{ 'fontSize': true, 'cur': true }">友情链接</span>
					<!-- <router-link to="/index" v-for="(list, index) in friend" :key="index" class="f_list">{{ list }}</router-link> -->
					<a :href="item.url" v-for="(item, index) in friend" :key="index" class="f_list" target="__blank">{{ item.name }}</a>
				</el-tab-pane>
			</el-tabs>
		</div>
		<ScrollTop />
		<Footer />
		
		<div class=".page-component__scroll">
			<el-backtop>
				<div class="up-button el-icon-caret-top" title='回到顶部'></div>
			</el-backtop>
			<div class="scroll-list" v-show="showMenu">
				<div class="scroll-list-item">
					<div class="item"><svg t="1662636999178" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2693"><path d="M178.3 540.9v-60.3H118v60.3h60.3z m20 284.1h121.3V702.4H198.3V825z m343.1-545.2h-60.7v60.1h60.7v-60.1z m-221.7-81.1H198.3v122.6h121.3V198.7z m362.4 423.4h-60.2v60.1h181v-60.1h-60v-60.9h-60.7v60.9zM541.4 117.8h-60.7V239h60.7V117.8z m-0.3 463.9h60.7v-59.8h60.4v-61.4h-60.7v60.4h-60.4v60.8z m201.8 201.5V723h-60.7v60.1h60.7z m60.4-282.4h-60.7v60.1h60.7v-60.1zM420.1 98.2H97.7V420h322.4V98.2zM380.2 380H138.3V138.8h241.9V380z m463.1 160.8H904v-58.9h-60.7v58.9z m0 302.5h-40v-59.8h-60.7v59.8h-60.5v61.4H904v-59.2h0.1V722.4h-60.7v120.9z m0-161.5H904v-60.1h-60.7v60.1z m-19.9-483.1H702v122.6h121.3V198.7zM601.7 98.2V420h322.4V98.2H601.7zM883.6 380H641.7V138.8h241.9V380zM541.4 722.1h60.4v-58.9h-60.4v-81.4h-60.7v321.4h60.4v0.8h60.7v-60.1h-60.4V722.1zM238.9 541.6h201.7v-61H238.9v61z m302.5-161.3h-61v60.1h61v-60.1zM601.5 843h60.7v-60.1h-60.7V843zM97.6 924.1H420V602.3H97.6v321.8z m40.7-281.2h241.9v241.2H138.3V642.9z" p-id="2694"></path></svg></div>
					<div class="content">
						<p>扫码关注公众号</p>
						<div class="user-qr">
							<img :src="qrcode_for_gh">
							<!-- <vue-qr :text="qr.url" :margin="5" colorDark="#000" colorLight="#fff" :dotScale="1" :logoSrc="qr.icon" :logoScale="0.2" :size="200"></vue-qr> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</template>

<script>
import ScrollTop from '@/component/index/scrollTop.vue'
import Search from '@/component/index/Search.vue'
// import Nav from '@/component/index/Nav.vue'
import Top from '@/component/index/index.vue'
import Work from '@/component/index/Work.vue'
import Company from '@/component/index/Company.vue'
import Footer from '@/component/index/footer.vue'
import vueQr from 'vue-qr'

export default {
	components: {
		Search,
		// Nav,
		Work,
		Company,
		Top,
		ScrollTop,
		Footer,
		vueQr
	},
	data() {
		return {
			activeName: 'first',
			friend:[
				{name:"拉勾网",url:"https://www.lagou.com/beijing/"},
				{name:"boss直聘",url:"https://www.zhipin.com/"},
				{name:"智联招聘",url:"https://www.zhaopin.com/"},
				{name:"前程无忧",url:"https://jobs.51job.com/all/co4283267.html"},
				{name:"实习僧",url:"https://www.shixiseng.com/comv/com_mqcbon0a2nej"},
				{name:"牛客网",url:"https://www.nowcoder.com/?fromPut=ad_baidu_sem_wushuang_niukexiangguan_shouye&bd_vid=10838939285191190558"},
				{name:"教师招聘",url:"https://www.jiaoshi.com.cn/"},
				{name:"研究报告",url:"https://www.djyanbao.com/index?channel=SougouHangyebaogaoYanjiubaogao"},
				{name:"互联网的一些事",url:"https://www.yixieshi.com/"},
			],
			qr: {
                url: 'https://www.bilibili.com/',  //需要转化成二维码的网址
                // icon: ""  //二维码中间的图片
            },
			showMenu:true,
			qrcode_for_gh:require("@/assets/image/qrcode_for_gh.jpg")
		}
	},
	methods: {
		handleScroll() {
			// var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
			// this.showMenu = scrollY > 200 ? true : false;
    	},
	},
	mounted(){
		// 监听滚动事件，用handleScroll这个方法进行相应的处理
		window.addEventListener("scroll", this.handleScroll);
		
	},
	beforeDestroy() {
		// 在组件生命周期结束的时候要销毁监听事件，否则其他页面也会使用这个监听事件
		window.removeEventListener("scroll", this.handleScroll);
	}
	
}

</script>

<style lang="scss">
@import url("//at.alicdn.com/t/font_631781_4v61w1yz6y74x6r.css");
$nx-color: #0470b8;
$all-padding: 0;
$nx-width: 76.25rem;

#app {
	min-width: $nx-width;

	.friend {
		width: 100%;

		.friendList {
			width: 76rem;
			margin: 0 auto;

			.f_list {
				display: inline-block;
				font-size: 0.8rem;
				color: #777;
				padding: 1rem 1rem 4rem 0;

				&:hover {
					color: $nx-color;
					text-decoration: underline;
				}
			}
		}
	}
}

.up-button {
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 25px;
    color: black;
    font-weight: bold;
}

.scroll-list {
    position: fixed;
    right: 0;
    bottom: 100px;
    display: inline-block;
    width: 80px;
    font-weight: bolder;
    font-size: 14px;
	z-index: 99;

	.scroll-list-item {
		position: relative;
		user-select: none;
		cursor: pointer;
		width: 60px;
		border: 1px solid #0000002b;
		border-radius: 5px;
		height: 60px;
		padding: 0 !important;
		background: aliceblue;

		.item {
			
			width: 100% !important;
			height: 100% !important;
			position: absolute;
			top: 0 !important;
			left: 0 !important;
			background-color: white !important;
		}

		.content {
			opacity: 0;
			transition: opacity .5s;
			position: absolute;
			width: 150px;
			height: 150px;
			left: -160px;
			top: -20px;
			border: 1px solid rgba(0, 0, 0, 0.38);
			margin-bottom: 10px;

			p {
				position: absolute;
				top: -20px;
				color: black;
				background: white;
				width: 100%;
				height: 20px;
				z-index: -1;
				line-height: 20px;
				padding: 2px;
				font-size: 13px;
				font-weight: bold;
				border-bottom: 1px solid black;
			}
		}
		.item:hover + .content{
			opacity: 1;
		}
	}
}

@media screen and (max-with: 76.25rem) {}
</style>
