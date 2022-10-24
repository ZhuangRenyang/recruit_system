<template>
  <div class="container" v-if="!showDetail">
    <div class="header">
      <div class="title" style=" text-align: left;">人才库简历</div>
    </div>
    <el-table stripe v-loading="loading" :data="tableData">
      <el-table-column prop="nickname" label="人才名称"></el-table-column>
      <el-table-column prop="email" label="邮箱"></el-table-column>
      <el-table-column prop="tel" label="联系电话"></el-table-column>
      <el-table-column prop="title" label="曾应聘职位"></el-table-column>
      <el-table-column fixed="right" label="操作">
        <template slot-scope="scope">
          <el-button @click.prevent="handleDetail(scope.row)" type="primary" plain size="small" round>查看简历</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination">
      <el-pagination @current-change="handleCurrentChange" :background="true" :page-size="pageCount"
        :current-page="currentPage" v-if="refreshPagination" layout="prev, pager, next, jumper" :total="totalNums">
      </el-pagination>
    </div>
  </div>
  <!-- 简历详情页 -->
  <resume-detail v-else @detailClose="detailClose" :detailResumeID="detailResumeID" :applicationID="applicationID"
    :applicationState="applicationState"></resume-detail>
</template>

<script>
import { Application } from '@/model/application'
import ResumeDetail from '@/view/resume/resume-detail'

export default {
  components: {
    ResumeDetail,
  },
  data() {
    return {
      showDetail: false,
      tableData: [],
      totalNums: 0,
      currentPage: 1,
      pageCount: 10,
      refreshPagination: true,
      detailResumeID: 0,
      applicationID: 0,
      applicationState: 0,
    }
  },
  async created() {
    this.loading = true
    this.getByHrId()
    this.loading = false
  },
  methods: {
    async getByHrId() {
      const page = this.currentPage - 1
      const count = this.pageCount
      // 已筛掉：state=2
      const applications = await Application.getByHrId(this.$store.getters.user.id, 2)
      this.tableData = applications.items
      this.totalNums = applications.total
    },
    // 切换table页
    async handleCurrentChange(val) {
      this.currentPage = val
      this.loading = true
      this.getByHrId()
      this.loading = false
    },
    handleDetail(val) {
      this.showDetail = true
      this.detailResumeID = val.resume_id
      this.applicationID = val.id
      this.applicationState = val.state
    },
    rowClick() { },
    detailClose() {
      this.showDetail = false
      this.getByHrId()
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

