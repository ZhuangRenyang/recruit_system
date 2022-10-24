<template>
  <div>
    <!-- 列表页面 -->
    <div class="container" v-if="!showEdit">
      <div class="header">
        <div class="title" style=" text-align: left;">已发布的职位</div>
      </div>
      <!-- 表格 -->
      <el-table :data="tableData" style="width: 100%" :default-sort="{ prop: 'release_date', order: 'descending' }">
        <el-table-column prop="release_date" label="发布时间" sortable :formatter="dateFormat"></el-table-column>
        <el-table-column prop="title" label="职位名称"></el-table-column>
        <el-table-column prop="city" label="工作地点"></el-table-column>
        <el-table-column prop="quantity" label="招聘人数"></el-table-column>
        <el-table-column prop="state" label="是否审核" :formatter="stateFormat"></el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button @click.prevent="handleEdit(scope.row)" type="primary" plain size="mini">编辑</el-button>
            <el-button @click.prevent="handleDelete(scope.row)" type="danger" plain size="mini">下架职位</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination @current-change="handleCurrentChange" :background="true" :page-size="pageCount"
          :current-page="currentPage" v-if="refreshPagination" layout="prev, pager, next, jumper" :total="totalNums">
        </el-pagination>
      </div>
    </div>
    <!-- 编辑职位 -->
    <position-modify v-else @editClose="editClose" :editPositionID="editPositionID"></position-modify>
  </div>
</template>

<script>
import { Position } from '@/model/position'
import PositionModify from '@/view/position/position-modify'

export default {
  components: {
    PositionModify,
  },
  data() {
    return {
      loading: false,
      tableData: [],
      totalNums: 0,
      currentPage: 1,
      pageCount: 10,
      refreshPagination: true,
      showEdit: false,
      editPositionID: 0,
    }
  },
  async created() {
    this.loading = true
    await this.getByHrId()
    this.loading = false
  },
  methods: {
    async getByHrId() {
      try {
        const page = this.currentPage - 1
        const count = this.pageCount
        const res = await Position.getByHrId(this.$store.getters.user.id, page, count)
        this.tableData = res.items
        this.totalNums = res.total
      } catch (error) {
        this.tableData = []
      }
    },
    // 对发布时间列进行格式化
    dateFormat(row, column) {
      return row['release_date'].substring(0, 10)
    },
    // 对职位状态列进行格式化
    stateFormat(row, column) {
      if (row['state'] === 0) {
        return "未审核";
      } else if (row['state'] === 1) {
        return "审核通过";
      } else {
        return "审核不通过";
      }
    },
    // 切换table页
    async handleCurrentChange(val) {
      this.currentPage = val
      this.loading = true
      this.getByHrId()
      this.loading = false
    },
    handleEdit(val) {
      this.showEdit = true
      this.editPositionID = val.id
    },
    handleDelete(val) {
      this.$confirm('是否下架该职位?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }).then(async () => {
        const res = await Position.delete(val.id)
        if (res.code < window.MAX_SUCCESS_CODE) {
          this.getByHrId()
          this.$message({
            type: 'success',
            message: `${res.message}`,
          })
        }
      })
    },
    rowClick() { },
    editClose() {
      this.showEdit = false
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
      text-align: left;
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
