<template>
  <div>
    <!-- 列表页面 -->
    <div class="container" v-if="!showEdit">
      <div class="header">
        <div class="title" style=" text-align: left;">我的关注</div>
      </div>
      <!-- 表格 -->
      <lin-table :tableColumn="tableColumn" :tableData="tableData" :operate="operate" @handleEdit="handleEdit"
        @handleDelete="handleDelete" @row-click="rowClick" v-loading="loading"></lin-table>
    </div>
    <!-- 详情页 -->
    <company-detail v-else @detailClose="detailClose" :detailCompanyID="detailCompanyID" :flag="false"></company-detail>
  </div>
</template>

<script>
import { Follow } from '@/model/follow'
import LinTable from '@/component/base/table/lin-table'
import CompanyDetail from '@/view/company/company-detail'

export default {
  components: {
    LinTable,
    CompanyDetail,
  },
  data() {
    return {
      tableColumn: [{ prop: 'name', label: '公司名称' }, { prop: 'foreign_name', label: '公司外文名' }, { prop: 'city', label: '总部地点' }, { prop: 'mission', label: '公司使命' }],
      tableData: [],
      operate: [],
      showEdit: false,
      detailCompanyID: 0,
    }
  },
  async created() {
    this.loading = true
    await this.getFollowByUserId()
    this.operate = [
      { name: '查看', func: 'handleEdit', type: 'primary' },
      {
        name: '取关',
        func: 'handleDelete',
        type: 'danger',
        permission: '取消关注',
      },
    ]
    this.loading = false
  },
  methods: {
    async getFollowByUserId() {
      try {
        const follows = await Follow.getFollowByUserId(this.$store.getters.user.id)
        this.tableData = follows
      } catch (error) {
        if (error.code === 22000) {
          this.tableData = []
        }
      }
    },
    handleEdit(val) {
      console.log('val', val)
      this.showEdit = true
      this.detailCompanyID = val.row.id
    },
    handleDelete(val) {
      this.$confirm('是否不再关注该公司?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }).then(async () => {
        const res = await Follow.cancel(this.$store.getters.user.id, val.row.id)
        if (res.code < window.MAX_SUCCESS_CODE) {
          this.getFollowByUserId()
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
      this.getFollowByUserId()
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
