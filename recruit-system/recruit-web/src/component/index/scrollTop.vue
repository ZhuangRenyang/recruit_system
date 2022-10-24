<!-- 回到顶部模块 -->
<template>
	<div class="scrollTop" @click="scrollTop(10)" :class="{ show: isshow }">
		<i class="iconfont icon-top"></i>
	</div>
</template>

<script>
export default {
	data() {
		return {
			isshow: false
		}
	},
	methods: {
		scrollTop(i) {
			let gotoTop = function () {
				let currentPosition = document.documentElement.scrollTop || document.body.scrollTop;
				currentPosition -= i;
				if (currentPosition > 0) {
					window.scrollTo(0, currentPosition);
				} else {
					window.scrollTo(0, 0);
					clearInterval(timer);
					timer = null;
				}
			}
			let timer = setInterval(gotoTop, 1);

		},
		isTop() {
			if (document.documentElement.scrollTop || document.body.scrollTop > 10) {
				this.isshow = true;
			} else {
				this.isshow = false;
			}
		},
		mounted() {
			window.addEventListener('scroll', this.isTop)
		}
	}
};
</script>

<style lang="scss">
@import url("//at.alicdn.com/t/font_631781_uzwcwz6vcmcxr.css");
$nx-color: #449efe;

.scrollTop {
	display: none;
	position: fixed;
	width: 4rem;
	height: 4rem;
	right: 1rem;
	bottom: 5rem;
	border: 1px solid #ddd;
	border-radius: 2rem;
	background-color: #fff;
	z-index: 9999999;

	.iconfont {
		display: inline-block;
		width: 100%;
		height: 100%;
		text-align: center;
		line-height: 4rem;
		font-size: 3rem;
		color: #999;
	}

	&:hover .iconfont {
		color: $nx-color;
	}
}

.show {
	display: block;
}
</style>
