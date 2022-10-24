<template>
  <div>
    <!-- 列表页面 -->
    <div class="container" v-if="!showEdit">
      <div class="header">
        <div class="title" style=" text-align: left;">我的收藏</div>
      </div>
      <!-- 表格 -->
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
            <el-button @click.prevent="handleDetail(scope.row)" type="primary" plain size="small" round>查看</el-button>
            <el-button @click.prevent="handleDelete(scope.row)" type="danger" size="small" round plain>取消收藏</el-button>
          </template>
        </el-table-column>
      </el-table>

    </div>

    <!-- 详情页 -->
    <position-detail v-else @detailClose="detailClose" :detailPositionID="detailPositionID" :flag="false">
    </position-detail>
  </div>
</template>

<script>
import { Favor } from '@/model/favor'
import PositionDetail from '@/view/position/position-detail'

export default {
  components: {
    PositionDetail,
  },
  data() {
    return {
      loading: false,
      tableData: [],
      showEdit: false,
      detailPositionID: 0,
    }
  },
  async created() {
    this.loading = true
    await this.getFavorByUserId()
    this.loading = false
  },
  methods: {
    async getFavorByUserId() {
      try {
        const favors = await Favor.getFavorByUserId(this.$store.getters.user.id)
        this.tableData = favors
      } catch (error) {
        if (error.code === 40000) {
          this.tableData = []
        }
      }
    },
    handleDetail(val) {
      this.showEdit = true
      this.detailPositionID = val.id
    },
    handleDelete(val) {
      this.$confirm('是否取消收藏该职位?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }).then(async () => {
        const res = await Favor.cancel(this.$store.getters.user.id, val.id)
        if (res.code < window.MAX_SUCCESS_CODE) {
          this.getFavorByUserId()
          this.$message({
            type: 'success',
            message: `${res.message}`,
          })
        }
      })
    },
    rowClick() { },
    detailClose() {
      this.showEdit = false
      this.getFavorByUserId()
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
