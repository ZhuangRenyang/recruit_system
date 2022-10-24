<template>
	<div class="container" v-if="!showDetail">
		<div class="header">
			<div class="title" style=" text-align: left;">未审核企业</div>
		</div>
		<el-table stripe v-loading="loading" :data="tableData">
			<el-table-column prop="name" label="公司名称" width="180"></el-table-column>
			<el-table-column prop="logo" label="公司logo" width="220">
				<template v-if="scope.row.logo" slot-scope="scope">
					<el-image :src="scope.row.logo" :preview-src-list="imgSrcList" style="max-height: 50px; max-width: 100px;">
					</el-image>
				</template>
			</el-table-column>
			<el-table-column prop="foreign_name" label="公司外文名" width="200"></el-table-column>
			<el-table-column prop="city" label="总部地点" width="200"></el-table-column>
			<el-table-column prop="mission" label="公司使命" width="200" :show-overflow-tooltip="true"></el-table-column>
			<el-table-column fixed="right" label="操作">
			<template slot-scope="scope">
				<el-button @click.prevent="handleDetail(scope.row)" type="primary" plain size="mini">查看</el-button>
				<el-button @click.prevent="handlePass(scope.row)" type="success" plain size="mini">通过</el-button>
				<el-button @click.prevent="handleFail(scope.row)" type="warning" plain size="mini">不通过</el-button>
			</template>
			</el-table-column>
		</el-table>
		<div class="pagination">
			<el-pagination @current-change="handleCurrentChange" :background="true" :page-size="pageCount"
			:current-page="currentPage" v-if="refreshPagination" layout="prev, pager, next, jumper" :total="totalNums">
			</el-pagination>
		</div>
	</div>
	<!-- 详情页 -->
	<company-detail v-else @detailClose="detailClose" :detailCompanyID="detailCompanyID"></company-detail>
</template>

<script>
import { Company } from '@/model/company'
import CompanyDetail from '@/view/company/company-detail'

export default {
  components: {
	CompanyDetail,
  },
  data() {
	return {
	  showDetail: false,
	  tableData: [],
	  imgSrcList: [], // 用于大图预览
	  totalNums: 0,
	  currentPage: 1,
	  pageCount: 10,
	  refreshPagination: true,
	  detailCompanyID: 0,
	}
  },
  async created() {
	this.loading = true
	this.getByState()
	this.loading = false
  },
  methods: {
	async getByState() {
	  const page = this.currentPage - 1
	  const count = this.pageCount
	  // 未审核：state=0
	  const companys = await Company.getByState(0, page, count)
	  this.tableData = companys.items
	  this.totalNums = companys.total
	  this.initImgSrcList()
	},
	// 切换table页
	async handleCurrentChange(val) {
	  this.imgSrcList = []
	  this.currentPage = val
	  this.loading = true
	  this.getByState()
	  this.loading = false
	},
	initImgSrcList() {
	  this.tableData.forEach(item => {
		if (!item.logo) {
		  return
		}
		this.imgSrcList.push(item.logo)
	  })
	},
	handleDetail(val) {
	  this.showDetail = true
	  this.detailCompanyID = val.id
	},
	async handlePass(val) {
	  const res = await Company.updateState(val.id, 1)
	  if (res.code < window.MAX_SUCCESS_CODE) {
		this.$message.success(`${res.message}`)
		// 刷新页面
		this.getByState()
	  }
	},
	async handleFail(val) {
	  const res = await Company.updateState(val.id, 2)
	  if (res.code < window.MAX_SUCCESS_CODE) {
		this.$message.success(`${res.message}`)
		// 刷新页面
		this.getByState()
	  }
	},
	rowClick() { },
	detailClose() {
	  this.showDetail = false
	  this.getByState()
	},
  },
}
</script>

<style lang="scss" scoped>
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
	  font-size: 16px;
	  font-weight: 500;
	}
  }

  .pagination {
	display: flex;
	justify-content: flex-end;
	margin: 20px;
  }
}
</style>

