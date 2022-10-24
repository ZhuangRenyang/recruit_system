<template>
  <div class="container">
    <div class="header">
      <div class="title">待沟通的申请</div>
    </div>
    <el-table stripe v-loading="loading" :data="tableData">
      <el-table-column prop="title" label="职位名称" width="300"></el-table-column>
      <el-table-column prop="position_city" label="工作地点" width="280"></el-table-column>
      <el-table-column prop="salary_down,salary_up" label="薪资" width="300">
        <template slot-scope="scope">
          {{ scope.row.salary_down }}-{{ scope.row.salary_up }}
        </template>
      </el-table-column>
      <el-table-column prop="name" label="所属公司" width="300"></el-table-column>
      <el-table-column>
      </el-table-column>
    </el-table>
    <div class="pagination">
      <el-pagination @current-change="handleCurrentChange" :background="true" :page-size="pageCount"
        :current-page="currentPage" v-if="refreshPagination" layout="prev, pager, next, jumper" :total="totalNums">
      </el-pagination>
    </div>
  </div>
</template>

<script>
import { Application } from '@/model/application'

export default {
  data() {
    return {
      tableData: [],
      totalNums: 0,
      currentPage: 1,
      pageCount: 10,
      refreshPagination: true,
    }
  },
  async created() {
    this.loading = true
    this.getByUserId()
    this.loading = false
  },
  methods: {
    async getByUserId() {
      const page = this.currentPage - 1
      const count = this.pageCount
      // 待沟通：state=1
      const applications = await Application.getByUserId(this.$store.getters.user.id, 1, this.currentPage, this.pageCount)
      this.tableData = applications.items
      this.totalNums = applications.total
    },
    // 切换table页
    async handleCurrentChange(val) {
      this.currentPage = val
      this.loading = true
      this.getByUserId()
      this.loading = false
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

