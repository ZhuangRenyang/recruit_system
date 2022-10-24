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
          <el-tag v-if="scope.row.status == 0" type="info">未开始</el-tag>
          <el-tag v-if="scope.row.status == 1" type="success">通知面试</el-tag>
          <el-tag v-if="scope.row.status == 2" type="success">面试通过</el-tag>
          <el-tag v-if="scope.row.status == 3" type="danger">面试未通过</el-tag>
        </template>
      </el-table-column>
      <el-table-column fixed="right" label="操作" width="400">
        <template slot-scope="scope">
          <el-button @click.prevent="handleDetail(scope.row)" plain round size="small">查看简历</el-button>
          <el-button @click.prevent="onOpen(scope.row)" type="success" round plain size="small"
            v-if="scope.row.status < 2">
            录入面试结果</el-button>
          <el-button @click.prevent="onOpen(scope.row)" type="info" round plain size="small" v-else>重新录入结果</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 录入面试结果 -->
    <div>
      <el-dialog :visible.sync="resultshow" v-on="$listeners" title="录入面试结果">
        <el-form ref="resultForm" :model="resultData" :rules="rules" size="small" label-width="100px"
          label-position="left">
          <el-form-item label="面试结果" prop="status">
            <el-radio-group v-model="resultData.status" size="small">
              <el-radio v-for="(item, index) in statusOptions" :key="index" :label="item.value"
                :disabled="item.disabled">{{ item.label }}</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="面试评价" prop="comments">
            <el-input v-model="resultData.comments" type="textarea" placeholder="请输入面试评价"
              :autosize="{ minRows: 4, maxRows: 4 }" :style="{ width: '100%' }"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer">
          <el-button @click="close">取消</el-button>
          <el-button type="primary" @click="handelConfirm">确定</el-button>
        </div>
      </el-dialog>
    </div>
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
      resultData: {
        id: '',
        status: '',
        comments: '',
      },
      rules: {
        status: [{
          required: true,
          message: '面试结果不能为空',
          trigger: 'change'
        }],
        comments: [{
          required: true,
          message: '请输入面试评价',
          trigger: 'blur'
        }],
      },
      statusOptions: [{
        "label": "通过",
        "value": 2
      }, {
        "label": "未通过",
        "value": 3
      }],
    }
  },
  async created() {
    this.loading = true
    this.getByHrId()
    this.loading = false
  },
  methods: {
    onOpen(row) {
      this.resultshow = true
      this.resultData = row
    },
    onClose() {
      this.$refs['resultForm'].resetFields()
    },
    close() {
      this.resultshow = false
    },
    async handelConfirm() {
      this.$refs['resultForm'].validate(valid => {
        if (!valid) return
        this.close()
      })
      const res = await Interview.updateInterviewResult(this.resultData)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`录入成功`)
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
        return item.status !== 0
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
    async handlePass(val) {
      const res = await Interview.updateState(val.id, 1)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
        // 刷新页面
        this.getByHrId()
      }
    },
    async handleFail(val) {
      const res = await Application.updateState(val.id, 2)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
        // 刷新页面
        this.getByHrId()
      }
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
    }
  }

  .pagination {
    display: flex;
    justify-content: flex-end;
    margin: 20px;
  }
}
</style>
