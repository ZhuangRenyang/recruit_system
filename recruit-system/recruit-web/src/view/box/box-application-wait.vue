<template>
  <div class="container" v-if="!showPositionDetail">
    <div class="header">
      <div class="title" style=" text-align: left;">我的申请</div>
    </div>
    <el-table stripe v-loading="loading" :data="tableData" :header-cell-style="{ 'text-align': 'center' }"
      :cell-style="{ 'text-align': 'center' }">
      <el-table-column label="职位名称">
        <template slot-scope="scope">
          <p >{{ scope.row.title }}</p>
          <!-- <p @click.prevent="handleShow(scope.row)">{{ scope.row.title }}</p> -->
        </template>
      </el-table-column>
      <el-table-column prop="position_city" label="工作地点" width="250"></el-table-column>
      <el-table-column prop="salary_down,salary_up" label="薪资" width="250">
        <template slot-scope="scope">{{ scope.row.salary_down }}-{{ scope.row.salary_up }}</template>
      </el-table-column>
      <el-table-column prop="name" label="所属公司" width="250"></el-table-column>
      <el-table-column label="投递状态">
        <template slot-scope="scope">
          <!-- <p v-if="scope.row.state == 0">待查看</p>
          <p v-if="scope.row.state == 1" :style="{ color: 'green' }">已通过初筛</p>
          <p v-if="scope.row.state == 2" :style="{ color: 'red' }">简历未通过</p> -->
          <!-- 申请状态,0:待查看,1:已查看,2:通过初筛,3:邀面试,4:未通过 -->
          <el-tag  size="small" :type="stateList[scope.row.state].type" round plain>{{stateList[scope.row.state].state}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column fixed="right" label="操作">
        <template slot-scope="scope">
          <el-button v-if="checkState(scope.row.state)" @click.prevent="handleCancel(scope.row)" type="danger" plain
            size="small" round>撤销申请</el-button>
          <el-button v-else type="primary" plain size="small" :disabled="flag" round>不可撤销</el-button>
        </template>
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
import {
  Application
} from '@/model/application'
import PositionDetail from '@/view/position/position-detail'
export default {
  components: {
    PositionDetail,
  },
  data() {
    return {
      flag: true,
      showPositionDetail: false,
      tableData: [],
      totalNums: 0,
      currentPage: 1,
      pageCount: 12,
      refreshPagination: true,
      showPositionID: 0,
      stateList: {
        "0":{"state":"待查看"  ,"type":"info"},
        "1":{"state":"已查看"  ,"type":""},
        "2":{"state":"通过初筛","type":"success"},
        "3":{"state":"邀面试"  ,"type":"warning"},
        "4":{"state":"未通过"  ,"type":"danger"},
      }
    }
  },
  async created() {
    this.loading = true
    this.getByUserId()
    this.loading = false
  },
  methods: {
    editClose() {
      this.showPositionDetail = false
      this.$router.push("/box/wait")
    },
    handleShow(val) {
      this.showPositionDetail = true
      this.showPositionID = val.id
    },
    async getByUserId() {
      const page = this.currentPage - 1
      const count = this.pageCount
      // 待处理：state=0
      const applications = await Application.getByUserId(this.$store.getters.user.id, count, page)
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
    checkState(state){
      if (state >= 2){
        return false;
      }
      return true;
    },
    // 撤销申请
    handleCancel(val) {
      this.$confirm('是否撤销申请?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }).then(async () => {
        const res = await Application.delete(val.id)
        if (res.code < window.MAX_SUCCESS_CODE) {
          this.getByUserId()
          this.$message({
            type: 'success',
            message: `${res.message}`,
          })
        }
      })
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
