<template>
  <div class="container" v-if="!showDetail">
    <div class="header">
      <div class="title" style=" text-align: left;">审核通过职位</div>
    </div>
    <el-table stripe v-loading="loading" :data="tableData">
      <el-table-column prop="title" label="职位名称" width="250"></el-table-column>
      <el-table-column prop="city" label="工作地点" width="250"></el-table-column>
      <el-table-column prop="salary_down,salary_up" label="薪资" width="250">
        <template slot-scope="scope">
          {{ scope.row.salary_down }}-{{ scope.row.salary_up }}
        </template>
      </el-table-column>
      <el-table-column prop="quantity" label="招聘人数" width="250"></el-table-column>
      <el-table-column fixed="right" label="操作">
        <template slot-scope="scope">
          <el-button @click.prevent="handleDetail(scope.row)" type="primary" plain size="mini">查看</el-button>
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
  <position-detail v-else @detailClose="detailClose" :detailPositionID="detailPositionID"></position-detail>
</template>

<script>
import { Position } from '@/model/position'
import PositionDetail from '@/view/position/position-detail'

export default {
  components: {
    PositionDetail,
  },
  data() {
    return {
      showDetail: false,
      tableData: [],
      totalNums: 0,
      currentPage: 1,
      pageCount: 10,
      refreshPagination: true,
      detailPositionID: 0,
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
      // 审核通过：state=1
      const positions = await Position.getByState(1, page, count)
      this.tableData = positions.items
      this.totalNums = positions.total
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
      this.detailPositionID = val.id
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

