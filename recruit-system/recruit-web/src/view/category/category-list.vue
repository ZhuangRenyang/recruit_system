<template>
  <div>
    <!-- 列表页面 -->
    <div class="container" v-if="!showEdit">
      <div class="header">
        <div class="title" style=" text-align: left;">职位分类列表</div>
      </div>
      <el-table :data="tableData" border style="width: 120%">
        <el-table-column prop="id" label="分类id" width="100">
        </el-table-column>
        <el-table-column prop="name" label="分类名称" width="300">
        </el-table-column>
        <el-table-column prop="description" label="分类描述" :show-overflow-tooltip="true" width="450">
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button @click.prevent="handleEdit(scope.row)" type="primary" plain size="mini">编辑</el-button>
            <el-button @click.prevent="handleDelete(scope.row)" type="danger" plain size="mini">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination @current-change="handleCurrentChange" :background="true" :page-size="pageCount"
          :current-page="currentPage" v-if="refreshPagination" layout="prev, pager, next, jumper" :total="totalNums">
        </el-pagination>
      </div>
    </div>
    <!-- 编辑页面 -->
    <category-edit v-else @editClose="editClose" :editCategoryID="editCategoryID"></category-edit>
  </div>
</template>

<script>
import {
  Category
} from '@/model/category'
import CategoryEdit from '@/view/category/category-edit'

export default {
  components: {
    CategoryEdit,
  },
  data() {
    return {
      showEdit: false,
      tableData: [],
      totalNums: 0,
      currentPage: 1,
      pageCount: 10,
      refreshPagination: true,
      editCategoryID: 0,
    }
  },
  async created() {
    this.loading = true
    this.getAll()
    this.loading = false
  },
  methods: {
    async getAll() {
      const page = this.currentPage - 1
      const count = this.pageCount
      const categorys = await Category.getAll(page, count)
      this.tableData = categorys.items
      this.totalNums = categorys.total
    },
    // 切换table页
    async handleCurrentChange(val) {
      this.currentPage = val
      this.loading = true
      this.getAll()
      this.loading = false
    },
    handleEdit(val) {
      this.showEdit = true
      this.editCategoryID = val.id
    },
    handleDelete(val) {
      this.$confirm('是否删除该职位分类?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }).then(async () => {
        const res = await Category.delete(val.id)
        if (res.code < window.MAX_SUCCESS_CODE) {
          this.getAll()
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
      this.getAll()
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
