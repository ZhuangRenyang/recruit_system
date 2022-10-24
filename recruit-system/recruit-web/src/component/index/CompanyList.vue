<!-- 首页热门公司的公司卡片模块 -->
<template>
	<div class="hotCompany">
		<ul class="companyContain">
			<li v-for="(company,index) in companys" :key="index" class="companylist">
				<div class="logo-img">
					<span v-if="company.poster" class="none_poster">
						<img :src="company.poster" >
					</span>
					<span v-else class="none_poster">
						<div>
							<p>该公司没有上传招聘海报</p>
						</div>
						<img :src="defeult_poster">
					</span>
				</div>
				<div class="hotCompany_list">
					<div class="hotCompany_Up " >
						<img :src="company.logo" alt="">
						<div class="companyName" >
							{{company.name}}
							<span class="ref" :title="company.foreign_name">({{company.foreign_name}})</span>
						</div>
					</div>
					<div class="hotCompany_Down">
						<div>	
							<p><i class="el-icon-map-location"></i> <span >{{company.city}}</span></p>
						</div>
						<div class="work-mission">
							<!-- <span>使命愿景：</span> -->
							<span style="line-height: 20px">{{company.mission}}</span>
						</div>
					</div>					
				</div>
			</li>
		</ul>	
	</div>
</template>

<script>
	export default{
		data(){
			return {
				defeult_poster:require("@/assets/image/company/none.png")
			}
		},
		props:['companys']
	}
</script>

<style lang="scss">
$nx-width:76.25rem;
$nx-color2:#0470B8;
.word{
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
.hotCompany	{
	width: 100%;
	.companyContain{
		width: 76rem;
		margin:1rem auto;
		zoom:1;
		&:after{
            display: block;
            content: '.';
            clear: both;
            line-height: 0;
            visibility: hidden;
        }
		.companylist{
			float: left;
			width: 17.8rem;
			height: 16.75rem;
			border:1px solid #eee;
			margin: 1rem 1rem 0 0;
			overflow: hidden;
			position: relative;
			
			&:hover > .logo-img {
				left: -17.8rem;
				opacity: .5;
				background-color: #f5f5f536;
				border-radius: 5px;
			}
			>.hotCompany_list{
				width: 100%;
				height:100%;
				// padding:  1rem;
				overflow: hidden;
				text-align: center;
				.hotCompany_Up{
					padding-bottom: 1rem;
					img{
						display: block;
						width: 7rem;
						margin: 0 auto;
					}
					.companyName{
						display: block;
						margin-top: 1rem;
						line-height: 1rem;
						&:hover{
							color:$nx-color2; 
						}
					}
					.ref{
						width: 100%;
						line-height: 1rem;
						font-size: 0.8rem;
						color: #444;
						@extend .word;
					}
				}
				.hotCompany_Down{
					// margin-top: 1rem;
					.work-mission {
						display: inline-block;
						margin-top: 10px !important;
						width: 100%;
						span:nth-child(1){
							font-weight: bolder;
							border-bottom: 1px solid rgba(0, 0, 0, 0.267);
							padding-bottom: 5px;
							line-height: 25px !important;
						}
					}
				}
			}
		}

		.logo-img {
			position:absolute;
			width: 100%;
			height: 100%;
			padding: 0;
			margin: 0;
			pointer-events: none;
			transition: all .5s;
			left: 0;
			top: 0;
			background-color: #f5f5f5d9;
			img {
				width: 100%;
				height: 100%;
				opacity: 1;
			}
			.none_poster div {
				width: 100%;
				height: 100%;
				font-size: 18px;
				position: absolute;
				font-weight: bolder;
				display: flex;
				align-items: center;
				justify-content: center;
				background: #1c1c1c24;

				p {
					background-color: #ffffffbd;
					padding: 10px;
					width: 100%;
					font-weight: bolder;
				}
			}
			
		}
		
	}
}
</style>