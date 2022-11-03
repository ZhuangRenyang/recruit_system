<template>
  <div class="container" v-if="!showDetail">
    <div class="header">
      <div class="title">校企招聘网系统——公司大全</div>
    </div>
    <!-- 搜索框 -->
    <div class="box">
      <div class="left">
        <lin-search @query="onQueryChange" placeholder="请输入公司名称" ref="searchKeyword" />
      </div>
    </div>
    <transition name="fade">
      <div class="search" v-if="keyword">
        <p class="search-tip">
          搜索“
          <span class="search-keyword">{{ keyword }}</span>”, 找到
          <span class="search-num">{{ totalNums }}</span> 条公司信息
        </p>
        <button class="search-back" @click="backInit">返回全部公司</button>
      </div>
    </transition>
    <!-- 公司列表 -->
    <el-table stripe v-loading="loading" :data="tableData">
      <el-table-column prop="name" label="公司名称" width="200"></el-table-column>
      <el-table-column prop="logo" label="公司logo" width="250">
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
          <el-button @click.prevent="handleFollow(scope.row)" v-permission="{ permission: '新增关注' }" type="success" plain
            size="mini">关注公司</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination">
      <el-pagination @current-change="handleCurrentChange" :background="true" :page-size="pageCount"
        :current-page="currentPage" v-if="refreshPagination" layout="prev, pager, next, jumper" :total="totalNums">
      </el-pagination>
    </div>
  </div>
  <!-- 公司详情 -->
  <company-detail v-else @detailClose="detailClose" :detailCompanyID="detailCompanyID" :temp="1"></company-detail>
</template>

<script>
import LinSearch from '@/component/base/search/lin-search'
import { Company } from '@/model/company'
import { Follow } from '@/model/follow'
import CompanyDetail from '@/view/company/company-detail'

export default {
  components: {
    LinSearch,
    CompanyDetail,
  },
  data() {
    return {
      showDetail: false, // 是否显示公司详情页
      tableData: [], // 表格数据
      totalNums: 0, // 数据总数
      currentPage: 1, // 当前页数
      pageCount: 10, // 每页的数据量
      refreshPagination: true, // 页数增加的时候，因为缓存的缘故，需要刷新 Pagination 组件
      detailCompanyID: 0, // 公司id
      searchKeyword: '', // 搜索时输入的关键字
      keyword: null, // 查询关键字,用于显示搜索提示
      list: {}, //关注公司时传入的列表数据
    }
  },
  async created() {
    this.loading = true
    this.getByState()
    this.loading = false
  },
  watch: {
    /**
     * 关键字搜索
     */
    searchKeyword(newVal) {
      if (newVal) {
        this.keyword = newVal
        if (this.searchUser) {
          this.keyword = `${newVal}`
        }
      } else {
        this.keyword = ''
        this.$refs.searchKeyword.clear()
      }
      this.searchCompanyList()
    },
  },
  methods: {
    async getByState() {
      const page = this.currentPage - 1
      const count = this.pageCount
      // 展示所有审核通过的公司
      const companys = await Company.getByState(1, page, count)
      this.tableData = companys.items
      this.totalNums = companys.total
    },
    // 通过查询关键字分页搜索公司列表 
    async searchCompanyList() {
      const page = this.currentPage - 1
      const count = this.pageCount
      const companys = await Company.getByKeyword(page, count, this.searchKeyword)
      this.tableData = companys.items
      this.totalNums = companys.total
    },
    // 清空检索
    async backInit() {
      this.searchKeyword = ''
      this.keyword = ''
      this.tableData = []
      this.loading = true
      this.getByState()
      this.loading = false
    },
    /**
     * 监听输入查询关键字
     */
    async onQueryChange(query) {
      this.searchKeyword = query.trim()
    },
    // 切换table页
    async handleCurrentChange(val) {
      this.currentPage = val
      this.loading = true
      this.getByState()
      this.loading = false
    },
    handleDetail(val) {
      this.showDetail = true
      this.detailCompanyID = val.id
    },
    // 关注公司
    async handleFollow(val) {
      // 获取当前登录求职者的用户id
      this.list.user_id = this.$store.getters.user.id
      // 获取当前关注的公司id
      this.list.company_id = val.id
      // 调用添加关注的方法
      const res = await Follow.create(this.list)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
      }
    },
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
      font-size: 25px;
      font-weight: 500;
      margin-left: 450px;
    }
  }

  .search {
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
    margin-bottom: 15px;

    .left {
      margin-left: 320px;
    }
  }

  .pagination {
    display: flex;
    justify-content: flex-end;
    margin: 30px;
  }
}
</style>

