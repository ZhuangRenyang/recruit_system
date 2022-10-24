<template>
  <div class="container" v-if="!showDetail">
    <div class="header">
      <div class="title">查看面试名单</div>
    </div>
    <el-table stripe v-loading="loading" :data="tableData">
      <el-table-column prop="nickname" label="名字"></el-table-column>
      <el-table-column prop="tel" label="手机"></el-table-column>
      <el-table-column prop="email" label="邮箱"></el-table-column>
      <el-table-column prop="title" label="申请职位"></el-table-column>
      <el-table-column label="面试状态">
        <template slot-scope="scope">
          <!-- <p v-if="scope.row.status == 0">未开始</p>
          <p v-if="scope.row.status == 1" :style="{ color: 'green' }">通知面试</p>
          <p v-if="scope.row.status == 2" :style="{ color: 'green' }">面试通过</p>
          <p v-if="scope.row.status == 3" :style="{ color: 'red' }">面试未通过</p> -->
          <el-tag v-if="scope.row.status == 0" type="info" plain size="small" round>未开始</el-tag>
          <el-tag v-if="scope.row.status == 1" type="success" plain size="small" round>通知面试</el-tag>
          <el-tag v-if="scope.row.status == 2" type="success" plain size="small" round>面试通过</el-tag>
          <el-tag v-if="scope.row.status == 3" type="danger" plain size="small" round>面试未通过</el-tag>
        </template>
      </el-table-column>
      <el-table-column fixed="right" label="操作" width="400">
        <template slot-scope="scope">
          <el-button @click.prevent="handleDetail(scope.row)" type="success" plain size="small" round>查看简历</el-button>
          <el-button @click.prevent="onOpen(scope.row)" type="primary" plain size="small" v-if="scope.row.status < 1"
            round>
            发送面试通知</el-button>
          <el-button @click.prevent="onOpen(scope.row)" type="info" plain size="small" v-if="scope.row.status === 1"
            round>
            重新发送通知</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 发送面试通知 -->
    <el-dialog :visible.sync="dialogVisible" v-bind="$attrs" v-on="$listeners" title="发送面试通知">
      <el-row :gutter="15">
        <el-form ref="elForm" :model="formData" :rules="rules" size="small" label-width="100px">
          <el-col :span="12">
            <el-form-item label="面试日期" prop="interviewdate">
              <el-date-picker v-model="formData.interviewdate" format="yyyy-MM-dd" value-format="yyyy-MM-dd"
                :style="{ width: '100%' }" placeholder="请选择面试日期" clearable></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="面试时间" prop="interviewTime">
              <el-time-picker v-model="formData.interviewTime" format="HH:mm:ss" value-format="HH:mm:ss"
                :style="{ width: '100%' }" placeholder="请选择面试时间" clearable></el-time-picker>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="面试地点" prop="address">
              <el-input v-model="formData.address" placeholder="请输入面试地点" clearable :style="{ width: '100%' }">
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="备注" prop="memo">
              <el-input v-model="formData.memo" type="textarea" placeholder="请输入备注"
                :autosize="{ minRows: 4, maxRows: 4 }" :style="{ width: '100%' }"></el-input>
            </el-form-item>
          </el-col>
        </el-form>
      </el-row>
      <div slot="footer">
        <el-button @click="close">取消</el-button>
        <el-button type="primary" @click="handelConfirm">发送</el-button>
      </div>
    </el-dialog>
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
import {
  Interview
} from '@/model/interview'
import ResumeDetail from '@/view/resume/resume-detail'
import moment from 'moment'
export default {
  name: "ApplicationWait",
  components: {
    ResumeDetail
  },
  data() {
    return {
      resultshow: false,
      dialogVisible: false,
      showDetail: false,
      tableData: [],
      totalNums: 0,
      currentPage: 1,
      pageCount: 10,
      refreshPagination: true,
      detailResumeID: 0,
      applicationID: 0,
      applicationState: 0,
      formData: {
        id: '',
        interviewdate: '',
        interviewTime: '',
        time: '',
        address: '',
        memo: '',
      },
      rules: {
        interviewdate: [{
          required: true,
          message: '请选择面试日期',
          trigger: 'change'
        }],
        interviewTime: [{
          required: true,
          message: '请选择面试时间',
          trigger: 'change'
        }],
        address: [{
          required: true,
          message: '请输入面试地点',
          trigger: 'blur'
        }],
        memo: [{
          required: true,
          message: '请输入备注',
          trigger: 'blur'
        }],
      },
    }
  },
  async created() {
    this.loading = true
    this.getByHrId()
    this.loading = false
  },
  methods: {
    onOpen(row) {
      this.dialogVisible = true
      this.formData = row
      this.formData.interviewdate = moment(`${row.time}`, 'YYYY-MM-DD').format();
      this.formData.interviewTime = moment(`${row.time}`, 'HH:mm:ss').format();
    },
    onClose() {
      this.$refs['elForm'].resetFields()
    },
    close() {
      this.dialogVisible = false
    },
    async handelConfirm() {
      this.$refs['elForm'].validate(valid => {
        if (!valid) return
        this.close()
      })
      this.formData.time = moment(`${this.formData.interviewdate} ${this.formData.interviewTime}`, 'YYYY-MM-DD HH:mm:ss').format();
      const res = await Interview.sendInterviewNotify(this.formData)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`发送成功`)
        this.getByHrId()
        this.close()
      }
    },
    async getByHrId() {
      const page = this.currentPage - 1
      const count = this.pageCount
      // 未处理：state=0
      const applications = await Interview.getByHrId(this.$store.getters.user.id, 0)
      this.tableData = applications.items
      this.tableData = this.tableData.filter((item) => {
        return item.status < 2
      });
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
      float: left;
    }
  }

  .pagination {
    display: flex;
    justify-content: flex-end;
    margin: 20px;
  }
}
</style>
