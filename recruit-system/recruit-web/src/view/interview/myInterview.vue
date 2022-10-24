<template>
  <div class="container" v-if="!showPositionDetail">
    <div class="header">
      <div class="title" :style="{ 'text-align': 'left' }">我的面试</div>
    </div>
    <el-table stripe v-loading="loading" :data="tableData" :header-cell-style="{ 'text-align': 'center' }"
      :cell-style="{ 'text-align': 'center' }">
      <el-table-column label="职位名称">
        <template slot-scope="scope">
          <p @click.prevent="handleShow(scope.row)">{{ scope.row.title }}</p>
        </template>
      </el-table-column>
      <el-table-column prop="name" label="所属公司" width="250"></el-table-column>
      <el-table-column prop="city" label="工作地点" width="250"></el-table-column>
      <el-table-column label="面试状态">
        <template slot-scope="scope">
          <!-- <p v-if="scope.row.status == 0">未开始</p>
          <p v-if="scope.row.status == 1" :style="{ color: 'green' }">通知面试</p>
          <p v-if="scope.row.status == 2" :style="{ color: 'green' }">面试通过</p>
          <p v-if="scope.row.status == 3" :style="{ color: 'red' }">面试未通过</p> -->
          <el-tag v-if="scope.row.status == 0" type="info">未开始</el-tag>
          <el-tag v-if="scope.row.status == 1" type="success">通知面试</el-tag>
          <el-tag v-if="scope.row.status == 2" type="success">面试通过</el-tag>
          <el-tag v-if="scope.row.status == 3" type="danger">面试未通过</el-tag>
        </template>
      </el-table-column>
      <el-table-column fixed="right" label="查看面试信息">
        <template slot-scope="scope">
          <el-button type="primary" plain size="mini" @click.prevent="showMessage(scope.row)" round>查看面试信息</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination">
      <el-pagination @current-change="handleCurrentChange" :background="true" :page-size="pageCount"
        :current-page="currentPage" v-if="refreshPagination" layout="prev, pager, next, jumper" :total="totalNums">
      </el-pagination>
    </div>
    <!-- 查看面试信息 -->
    <div>
      <el-dialog :visible.sync="resultshow" v-bind="$attrs" v-on="$listeners" @close="onClose" title="面试进度">
        <div style="margin:40px">
          <el-steps :space="200" :active="resultData.status + 1" finish-status="success" process-status="process"
            align-center>
            <el-step title="进入面试"></el-step>
            <el-step title="面试中"></el-step>
            <el-step title="等待面试结果" v-if="resultData.status < 2"></el-step>
            <el-step title="面试通过" v-if="resultData.status === 2"></el-step>
            <el-step title="面试未通过" v-if="resultData.status === 3" status="error"></el-step>
          </el-steps>
        </div>
        <el-row :gutter="15">
          <el-form ref="resultForm" :model="resultData" size="medium" label-width="100px">
            <el-col :span="24">
              <el-form-item label="面试时间：">
                <span>{{ time ? time : "待定" }}</span>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="面试地点：">
                <span>{{ resultData.address ? resultData.address : "待定" }}</span>
              </el-form-item>
            </el-col>
            <el-col :span="24">
              <el-form-item label="面试说明：">
                <span>{{ resultData.memo ? resultData.memo : "无" }}</span>
              </el-form-item>
            </el-col>
          </el-form>
        </el-row>
      </el-dialog>
    </div>
  </div>
  <position-detail v-else @editClose="editClose" :detailPositionID="showPositionID"></position-detail>
</template>

<script>
import {
  Interview
} from '@/model/interview'
import PositionDetail from '@/view/position/position-detail'
import moment from 'moment'
export default {
  components: {
    PositionDetail,
  },
  data() {
    return {
      resultshow: false,
      time: '',
      flag: true,
      showPositionDetail: false,
      tableData: [],
      totalNums: 0,
      currentPage: 1,
      pageCount: 10,
      refreshPagination: true,
      showPositionID: 0,
      resultData: {
        time: undefined,
        address: '',
        memo: '',
        status: 0,
      },
    }
  },
  async created() {
    this.loading = true
    this.getByUserId()
    this.loading = false
  },
  methods: {
    getstatus() {
      return (this.resultData.status == 3) ? "error" : "success"
    },
    onClose() {
      this.resultData = {
        time: undefined,
        address: '',
        memo: '',
        status: 0,
      }
      this.time = ''
    },
    showMessage(row) {
      this.resultshow = true
      this.resultData = row
      this.time = this.resultData.time ? moment(this.resultData.time).format('北京时间 YYYY年MM月DD日 HH:mm:ss') : '';
    },
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
      const applications = await Interview.getByUserId(this.$store.getters.user.id, 0)
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
