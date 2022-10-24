<template>
  <div>
    <!-- 列表页面 -->
    <div class="container" v-if="!showDetail">
      <div class="header"><div class="title">简历排序</div></div>
      <!-- 表格 -->
      <el-table :data="tableData" style="width: 100%" :default-sort = "{prop: 'grade', order: 'descending'}">
        <el-table-column prop="grade" label="简历分数" sortable></el-table-column>
        <el-table-column prop="nickname" label="名字"></el-table-column>
        <el-table-column prop="email" label="邮箱"></el-table-column>
        <el-table-column prop="title" label="职位名称"></el-table-column>
        <el-table-column prop="state" label="是否处理" :formatter="stateFormat"></el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button @click.prevent="handleDetail(scope.row)" type="primary" plain size="mini">查看简历</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination">
      <el-pagination
        @current-change="handleCurrentChange"
        :background="true"
        :page-size="pageCount"
        :current-page="currentPage"
        v-if="refreshPagination"
        layout="prev, pager, next, jumper"
        :total="totalNums"
      ></el-pagination>
    </div>
    </div>
    <!-- 简历详情页 -->
    <resume-detail v-else @detailClose="detailClose" :detailResumeID="detailResumeID" :applicationID="applicationID" :applicationState="applicationState"></resume-detail>
  </div>
</template>

<script>
import {Application} from '@/model/application'
import ResumeDetail from '@/view/resume/resume-detail'

export default {
  components: {
    ResumeDetail,
  },
  data() {
    return {
      loading: false,
      tableData: [],
      totalNums: 0,
      currentPage: 1,
      pageCount: 10,
      refreshPagination: true,
      showDetail: false,
      detailResumeID: 0,
      applicationID: 0,
      applicationState: 0,
    }
  },
  async created() {
    this.loading = true
    await this.sortByGrade()
    this.loading = false
  },
  methods: {
    async sortByGrade() {
      try {
        const page = this.currentPage - 1
        const count = this.pageCount
        const res = await Application.sortByGrade(this.$store.getters.user.id)
        this.tableData = res.items
        this.totalNums = res.total
      } catch (error) {
        this.tableData = []
      }
    },
    // 对职位状态列进行格式化
    stateFormat(row, column) {
      if (row['state'] === 0) {
        return "未处理";
      } else if (row['state'] === 1){
        return "待沟通";
      } else {
        return "已筛掉";
      }
    },
    // 切换table页
    async handleCurrentChange(val) {
      this.currentPage = val
      this.loading = true
      this.sortByGrade()
      this.loading = false
    },
    handleDetail(val) {
      this.showDetail = true
      this.detailResumeID = val.resume_id
      this.applicationID = val.id
      this.applicationState = val.state
    },
    rowClick() {},
    detailClose() {
      this.showDetail = false
      this.sortByGrade()
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
