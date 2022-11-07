<!-- 首页搜素框模块 -->
<template>
	<div>
		<div style="margin-left:20% ; text-align: center">
			<position-detail v-if="showDetail" @detailClose="detailClose" :detailPositionID="detailPositionID" :temp="1">
			</position-detail>
		</div>
		<div class="searchIndex" v-if="!showDetail">
			<div class="contains" :width="nxw">
				<div class="search">
					<div style="width: 70%;margin: 0 auto; text-align: center">
						<!-- <div>
							<img :src='require("@/assets/image/logo.png")' alt="">
						</div> -->
						<el-row span="10">
							<el-col>
								<!-- <linSearch @query="onQueryChange" placeholder="请输入职位名称" ref="searchKeyword" /> -->
								<el-input v-model="searchKeyword" @change="onQueryChange" placeholder="请输入职位名称" size="large" clearable>
									<el-button @click="onQueryChange" slot="append" icon="el-icon-search">查询</el-button>
								</el-input>
							</el-col>
						</el-row>
					</div>
					
					<!-- 展示热门职位搜索列表 -->
					<div class="s_hot">
						<div>
							热门职位搜索：
							<span class="s_hot_like" v-if="recommendList.length">
								<span @click="searchPositionList()">
									全部<span class="hot_before"></span>
								</span>
								<span @click="searchPositionList(item.key_word)" v-for="(item,index) in recommendList" :key="index" :title="item.description">
									{{item.name}}
									<span class="hot_before"></span>
								</span>
							</span>
							<span class="s_hot_like" v-else>
								<span>无法获取职位数据<span class="hot_before"></span></span>
							</span>
						</div>
					</div>

					
					<div class="nav-box">
						<!-- 轮播图 -->
						<Nav></Nav>
					</div>
				</div>
				<template v-if="!showDetail">
					<div class="workList">
						<ul class="work_list">
							<Work :work="tableData"/>
						</ul>
					</div>
				</template>
			</div>
		</div>
		<div class="pagination" v-if="!showDetail">
			<el-pagination @current-change="handleCurrentChange" :background="true" :page-size="pageCount"
				:current-page="currentPage" v-if="refreshPagination" layout="prev, pager, next, jumper" :total="totalNums">
			</el-pagination>
		</div>
	</div>
	<!-- 职位详情 -->
</template>

<script>
// import WorkListVue from "./WorkList.vue";
import Work from "./Work.vue";
import {
	Position
} from '@/model/position'
import Button from "../../plugin/lin-cms-ui/view/basic/button/button.vue";
import LinSearch from '@/component/base/search/lin-search'
import PositionDetail from '@/view/position/position-detail'

import {  Category } from '@/model/category'
import Nav from '@/component/index/Nav.vue'
export default {
	components: {
		// WorkListVue,
		Button,
		LinSearch,
		PositionDetail,
		Work,
		Nav,
	},
	data() {
		return {
			worklist: [],
			recommendList:[],
			// sWidth:this.nxw,
			list: this.slist,
			showDetail: false, // 是否显示职位详情页
			showHot: false, // 是否显示热招职位列表
			tableData: [], // 表格数据
			totalNums: 0, // 数据总数
			currentPage: 1, // 当前页数
			pageCount: 12, // 每页的数据量
			refreshPagination: true, // 页数增加的时候，因为缓存的缘故，需要刷新 Pagination 组件
			detailPositionID: 0, // 职位id
			searchKeyword: '', // 搜索时输入的关键字
			keyword: null, // 查询关键字,用于显示搜索提示
			form: {}, //投递简历时传入的列表数据
			list: {} //收藏职位时传入的列表数据
		}
	},
	props: ['nxw', 'slist', 'searchValue'],
 	async mounted() {
		if (this.keywordValue) {
			this.keyword = this.keywordValue;
		}
		this.searchPositionList(this.keyword)
		
		var res = await Category.getList()
		this.recommendList = this.getShufflePos(res).splice(0,6);
	},
	// watch: {
	// 	/**
	// 	 * 关键字搜索
	// 	 */
	// 	searchKeyword(newVal) {
	// 		if (newVal) {
	// 			this.keyword = newVal
	// 			if (this.searchUser) {
	// 				this.keyword = `${newVal}`
	// 			}
	// 		} else {
	// 			this.keyword = ''
	// 			this.$refs.searchKeyword.clear()
	// 		}
	// 		this.searchPositionList()
	// 	},
	// },
	methods: {
		// 使用shuffle算法获取随机的职位推荐顺序
		getShufflePos(array){
			let res = [],random;
			while(array.length>0){
				random = Math.floor(Math.random() * array.length);
				res.push(array[random]);
				array.splice(random,1);
			}
			return res;
		},
		async getByState() {
			const page = this.currentPage - 1;
			const count = this.pageCount;
			// 首页展示所有审核通过的职位
			const positions = await Position.getByState(1, page, count);
			this.tableData = positions.items;
			this.totalNums = positions.total;
		},
		// 通过查询关键字分页搜索职位列表 
		async searchPositionList(searchKeyword=null) {
			searchKeyword = searchKeyword == null ? "" : searchKeyword; // 避免参数为null
			// this.searchKeyword = searchKeyword;
			const page = this.currentPage - 1;
			const count = this.pageCount;
			const positions = await Position.getByKeyword(page, count, searchKeyword);
			// 获取职位数据,(顺序随机)
			// 存储
			this.tableData =  this.getShufflePos(positions.items)
			this.totalNums = positions.total;
			// 清空检索
			this.searchKeyword = '';
			if(this.totalNums==0){
				this.$message.warning("当前职位没有新的招聘.");
				this.searchPositionList();
				return;
			}
			// this.$message.success("查询职位成功")
		},
		// 清空检索
		async backInit() {
			this.searchKeyword = '';
			this.keyword = '';
			this.tableData = [];
			this.loading = true;
			this.searchPositionList();
			this.loading = false;
		},
		/**
		 * 监听输入查询关键字
		 */
		async onQueryChange() {
			this.searchKeyword = this.searchKeyword.trim();
			this.searchPositionList(this.searchKeyword);
		},
		// 切换table页
		async handleCurrentChange(val) {
			this.currentPage = val;
			this.loading = true;
			this.searchPositionList();
			this.loading = false;
		},
		handleDetail(val) {
			this.showDetail = true;
			this.detailPositionID = val.id;
		},
		handleHot() {
			this.showHot = true;
		},
		rowClick() { },
		detailClose() {
			this.showDetail = false;
			this.searchPositionList();
		},
		hotClose() {
			this.showHot = false
			this.showDetail = false
			this.searchPositionList()
		},
		// 投递简历
		async handleDelivery(val) {
			// 根据用户id和职位id判断用户是否已经投递过该职位，避免重复投递
			const flag = await Application.getByPositionIdAndUserId(val.id, this.$store.getters.user.id)
			if (flag === false) {
				// 不能重复投递
				this.$message.error("你已投递过该职位，不可重复投递")
			} else {
				if (!this.$store.getters.user.id) return;
				// 获取当前登录求职者的用户id
				this.form.user_id = this.$store.getters.user.id
				// 获取当前投递简历的职位id
				this.form.position_id = val.id
				// 根据用户id查询绑定的简历id
				const temp = await Resume.getByUserId(this.$store.getters.user.id)
				this.form.resume_id = temp.resume_id
				console.log(temp)
				// 根据职位id查询该职位所对应的hr_id
				const result = await Position.getById(val.id)
				this.form.hr_id = result.hr_id
				this.form.company_id = val.company_id
				// 调用创建申请的方法
				const res = await Application.create(this.form)
				if (res.code < window.MAX_SUCCESS_CODE) {
					this.$message.success(`${res.message}`)
				}
			}
		},
		// 收藏职位
		async handleCollect(val) {
			// 获取当前登录求职者的用户id
			this.list.user_id = this.$store.getters.user.id
			// 获取当前收藏的职位id
			this.list.position_id = val.id
			// 调用添加收藏的方法
			const res = await Favor.create(this.list)
			if (res.code < window.MAX_SUCCESS_CODE) {
				this.$message.success(`${res.message}`)
			}
		},
	}
}
</script>

<style lang="scss">
.searchIndex {
	width: 100%;
	background: #fff;
	margin-top: 20px;
	.contains {
		width: 100%;
		margin: 0 auto;

		.search {
			// width: 50rem;
			// height: 10rem;
			// margin: 0 auto;
			text-align: center;
			position: relative;

			.nav-box {
				width: 1200px;
				margin: 0 auto; 
				text-align: center
			}
			// img {
			// 	display: inline-block;
			// 	width: 150px;
			// }
			.search1 {
				width: initial;
				margin: center;
				text-align: center;
				position: relative;
			}

			.s_box {
				height: 5rem;
				padding-top: 2rem;

				.search_input,
				.search_button {
					float: left;
					box-sizing: content-box;
					width: 39.5rem;
					border: 1px solid #ddd;

					// margin-top: 20px;
					&:focus {
						outline: 0px;
						outline-offset: 0px;
					}
				}

				.search_input {
					height: 19px;
					padding: 16px;
					font-size: 16px;
					border-right: none;

					&:focus {
						border: 1px solid #3CBEF9;
						border-right: 0px;
					}
				}

				.search_button {
					width: 8rem;
					height: 51px;
					font-size: 20px;
					line-height: 51px;
					text-align: center;
					cursor: pointer;
					color: #fff;
					border: 1px solid #3CBEF9;
					background: #3CBEF9;
				}
			}

			.s_hot {
				clear: both;
				text-align: center;
				margin-top: 20px;
				color: #666;
				font-size: 18px;
				div {
					height: 25px;
				}

				.s_hot_like {
					margin-right: 16px;
					cursor: pointer;
					display: inline-block;
					height: 100%;
					display: inline-block;

					>span {
						margin: 0 5px;
						display: inline-block;
						font-family: cursive;
						position: relative;
						overflow: hidden;
						transition: all .5s !important;
						padding: 2px;
						height: 100%;
						line-height: 25px;
    					transform: translateY(5px);
						// text-shadow: 0px 1px 3px #000000 !important;
						color: #6c6c6c !important;
						&:hover {
    						transform: translateY(0px);

							.hot_before {
								background: #3636361f;
								left: 0% !important;
							}
						}
					}
					.hot_before {
						position: absolute;
						left: -100% !important;
						width: 100%;
						height: 80%;
						display: inline-block;
						transition: all .8s;
						padding-bottom: 2px;
						border-top: 1px solid #3affad;
						border-bottom: 1px solid #3CBEF9;
						color: #3CBEF9 !important;
					}
					// >span:hover  .hot_before{
					// }
				}
			}

			.nosee {
				display: none;
			}

		}
	}

}

.container {
	padding: 0 30px;

	.header {
		display: flex;
		justify-content: space-between;
		align-items: center;

		.title {
			height: 59px;
			line-height: 59px;
			color: $parent-title-color;
			font-size: 25px;
			font-weight: 500;
			margin-left: 450px;
		}
	}

	.search3 {
		height: 52px;
		width: 100%;
		background: rgba(57, 99, 188, 0.1);
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		margin-top: 24px;
		margin-bottom: 24px;

		.search-tip {
			margin-left: 40px;
			height: 52px;
			line-height: 52px;
			color: #354058;
			font-size: 14px;

			.search-keyword {
				color: $theme;
			}

			.search-num {
				color: #f4516c;
			}
		}

		.search-back {
			margin: 8px 20px;
			height: 32px;
			background: #f4516c;
			border: none;
			border-radius: 2px;
			color: #fff;
			padding: 0 13px;
			font-size: 14px;
			cursor: pointer;
		}
	}

	.box {
		display: flex;
		justify-content: flex-start;
		align-items: center;

		.left {
			margin-left: 280px;
		}

		.right {
			height: 59px;
			line-height: 59px;
			color: $right-side-font-color;
			font-size: 18px;
			font-weight: 400;
			margin-left: 50px;
			cursor: pointer;
		}
	}

	.pagination {
		display: flex;
		justify-content: flex-end;
		margin: 30px;
	}
}

$nx-color2:#0470B8;
$nx-width:76rem;

.workList {
	width: 100%;
	cursor: pointer;

	.work_list {
		width: $nx-width;
		margin: 1rem auto;
		zoom: 1;

		&:after {
			display: block;
			content: '.';
			clear: both;
			line-height: 0;
			visibility: hidden;
		}

		.cardWork {
			float: left;
			width: 17.6rem;
			height: 16.75rem;
			border: 1px solid #eee;
			margin: 1rem 1rem 0 0;

			>div {
				width: 100%;
				height: 100%;
				padding: 1rem;
				overflow: hidden;
				text-align: center;

				.cardWork_Up {
					color: #999;

					.card_workNT {
						display: inline-block;
						font-weight: 400;

						.card_workName {
							float: left;
							max-width: 12rem;
							font-size: 1rem;
							text-overflow: ellipsis;
							overflow: hidden;
							white-space: nowrap;

							&:hover {
								color: $nx-color2;
							}
						}

						.card_workTime {
							font-size: 0.8rem;
						}
					}

					.card_workMoney {
						float: right;
						color: #FA606B;
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
				}

				.cardWork_Down {
					float: left;
					width: 100%;
					height: 2.5rem;
					margin-top: 0.5rem;

					.card_workImg img {
						width: 6rem;
						margin-right: 1rem;
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
			}
		}
	}
}

</style>
