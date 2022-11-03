<template>
  <!-- 我的简历页面 -->
  <div class="container" v-if="!showCreate">
    <div class="title">
      <span>我的简历</span>
    </div>
    <el-divider></el-divider>
    <div class="wrap">
      <el-tabs :tab-position="tabPosition" style="height: auto;">
        
        <el-tab-pane label="简历预览">
          <div>
            <Detail :id="resumeId" v-if="isRouterAlive"></Detail>
          </div>
        </el-tab-pane>
        <!-- 基本信息模块 -->
        <el-tab-pane label="基本信息">
          <el-row>
            <el-col :lg="16" :md="20" :sm="24" :xs="24">
              <el-form :model="form" status-icon ref="form" label-width="100px" v-loading="loading"
                @submit.native.prevent>
                <el-form-item label="求职意向" prop="job_intention">
                  <el-input size="medium" v-model="form.job_intention" placeholder="请填写求职意向"></el-input>
                </el-form-item>
                <el-form-item label="居住地" prop="home">
                  <el-input size="medium" v-model="form.home" placeholder="请填写居住地"></el-input>
                </el-form-item>
                <el-form-item label="英语等级" prop="english">
                  <el-input size="medium" v-model="form.english" placeholder="请填写英语等级"></el-input>
                </el-form-item>
                <el-form-item label="年龄" prop="age">
                  <el-input size="medium" v-model="form.age" placeholder="请填写年龄"></el-input>
                </el-form-item>
                <el-form-item label="性别" prop="sex">
                  <el-radio v-model="form.sex" :label="0">男</el-radio>
                  <el-radio v-model="form.sex" :label="1">女</el-radio>
                </el-form-item>
                <el-form-item label="专业技能" prop="ability">
                  <el-input type="textarea" :rows="3" size="medium" v-model="form.ability" placeholder="请填写专业技能">
                  </el-input>
                </el-form-item>
                <el-form-item label="个人总结" prop="personal_summary">
                  <el-input type="textarea" :rows="3" size="medium" v-model="form.personal_summary"
                    placeholder="请填写个人总结"></el-input>
                </el-form-item>
                <el-form-item class="submit">
                  <el-button type="primary" @click="submitForm('form')">保 存</el-button>
                  <el-button @click="resetForm('form')">重 置</el-button>
                </el-form-item>
              </el-form>
            </el-col>
          </el-row>
        </el-tab-pane>
        <!-- 教育经历模块 -->
        <el-tab-pane label="教育经历">
          <div>
            <el-table :data="educations" stripe :style="{ width: '100%' }">
              <el-table-column label="教育经历" width="auto">
                <template slot-scope="scope">
                  <el-row :gutter="15">
                    <el-form ref="elForm" :model="scope.row" size="medium" label-width="100px">
                      <el-col :span="12">
                        <el-form-item label="学校">
                          <el-input v-model="scope.row.name" :style="{ width: '100%' }"></el-input>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="专业">
                          <el-input v-model="scope.row.major" :style="{ width: '100%' }"></el-input>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="开始日期">
                          <el-date-picker type="date" v-model="scope.row.start_time" format="yyyy-MM-dd"
                            value-format="yyyy-MM-dd" :style="{ width: '100%' }" placeholder="请选择开始日期" clearable>
                          </el-date-picker>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="结束日期">
                          <el-date-picker type="date" v-model="scope.row.end_time" format="yyyy-MM-dd"
                            value-format="yyyy-MM-dd" :style="{ width: '100%' }" placeholder="请选择结束日期" clearable>
                          </el-date-picker>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="学历">
                          <el-select v-model="scope.row.diploma" placeholder="请选择学历">
                            <el-option v-for="item in eduoptions" :key="item.value" :label="item.label"
                              :value="item.value" clearable :style="{ width: '100%' }"></el-option>
                          </el-select>
                        </el-form-item>
                      </el-col>
                      <el-col :span="24">
                        <el-form-item label="描述">
                          <el-input v-model="scope.row.descriptions" type="textarea"
                            :autosize="{ minRows: 4, maxRows: 4 }" :style="{ width: '100%' }"></el-input>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item>
                          <el-button @click="updateEducation(scope.row)" style="font:center" round type="primary">保存
                          </el-button>
                          <el-button @click="delEducation(scope.row)" style="font:center" round type="danger">删除
                          </el-button>
                        </el-form-item>
                      </el-col>
                    </el-form>
                  </el-row>
                </template>
              </el-table-column>
            </el-table>
            <el-button @click="addEducation()" style="font:center" round>新增学习经历</el-button>
          </div>
        </el-tab-pane>
        <el-tab-pane label="实习经历">
          <div>
            <el-table :data="experiences" stripe :style="{ width: '100%' }">
              <el-table-column label="实习经历" width="auto">
                <template slot-scope="scope">
                  <el-row :gutter="15">
                    <el-form ref="elForm" :model="scope.row" size="medium" label-width="100px">
                      <el-col :span="12">
                        <el-form-item label="公司名称">
                          <el-input v-model="scope.row.name" :style="{ width: '100%' }"></el-input>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="职位">
                          <el-input v-model="scope.row.position" :style="{ width: '100%' }"></el-input>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="开始日期">
                          <el-date-picker type="date" v-model="scope.row.start_time" format="yyyy-MM-dd"
                            value-format="yyyy-MM-dd" :style="{ width: '100%' }" placeholder="请选择开始日期" clearable>
                          </el-date-picker>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item label="结束日期">
                          <el-date-picker type="date" v-model="scope.row.end_time" format="yyyy-MM-dd"
                            value-format="yyyy-MM-dd" :style="{ width: '100%' }" placeholder="请选择结束日期" clearable>
                          </el-date-picker>
                        </el-form-item>
                      </el-col>

                      <el-col :span="24">
                        <el-form-item label="工作描述">
                          <el-input v-model="scope.row.performance" type="textarea"
                            :autosize="{ minRows: 4, maxRows: 4 }" :style="{ width: '100%' }"></el-input>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item>
                          <el-button @click="updateExperience(scope.row)" style="font:center" round type="primary">保存
                          </el-button>
                          <el-button @click="delExperience(scope.row)" style="font:center" round type="danger">删除
                          </el-button>
                        </el-form-item>
                      </el-col>
                    </el-form>
                  </el-row>
                </template>
              </el-table-column>
            </el-table>
            <el-button @click="addExperience()" style="font:center" round>新增实习经历</el-button>
          </div>
        </el-tab-pane>
        <el-tab-pane label="项目经历">
          <div>
            <el-table :data="projects" stripe :style="{ width: '100%' }">
              <el-table-column label="项目经历" width="auto">
                <template slot-scope="scope">
                  <el-row :gutter="15">
                    <el-form ref="elForm" :model="scope.row" size="medium" label-width="100px">
                      <el-row>
                        <el-col :span="12">
                          <el-form-item label="项目名称">
                            <el-input v-model="scope.row.name" :style="{ width: '100%' }"></el-input>
                          </el-form-item>
                        </el-col>
                      </el-row>
                      <el-row>
                        <el-col :span="12">
                          <el-form-item label="开始日期">
                            <el-date-picker type="date" v-model="scope.row.start_time" format="yyyy-MM-dd"
                              value-format="yyyy-MM-dd" :style="{ width: '100%' }" placeholder="请选择开始日期" clearable>
                            </el-date-picker>
                          </el-form-item>
                        </el-col>
                        <el-col :span="12">
                          <el-form-item label="结束日期">
                            <el-date-picker type="date" v-model="scope.row.end_time" format="yyyy-MM-dd"
                              value-format="yyyy-MM-dd" :style="{ width: '100%' }" placeholder="请选择结束日期" clearable>
                            </el-date-picker>
                          </el-form-item>
                        </el-col>
                      </el-row>
                      <el-col :span="24">
                        <el-form-item label="项目背景">
                          <el-input v-model="scope.row.background" type="textarea"
                            :autosize="{ minRows: 3, maxRows: 3 }" :style="{ width: '100%' }"></el-input>
                        </el-form-item>
                      </el-col>
                      <el-col :span="24">
                        <el-form-item label="项目描述">
                          <el-input v-model="scope.row.performance" type="textarea"
                            :autosize="{ minRows: 4, maxRows: 4 }" :style="{ width: '100%' }"></el-input>
                        </el-form-item>
                      </el-col>
                      <el-col :span="12">
                        <el-form-item>
                          <el-button @click="updateProject(scope.row)" style="font:center" round type="primary">保存
                          </el-button>
                          <el-button @click="delProject(scope.row)" style="font:center" round type="danger">删除
                          </el-button>
                        </el-form-item>
                      </el-col>
                    </el-form>
                  </el-row>
                </template>
              </el-table-column>
            </el-table>
            <el-button @click="addProject()" style="font:center" round>新增项目经历</el-button>
          </div>
        </el-tab-pane>
        <!-- <el-tab-pane label="简历预览">
          <div>
            <Detail :id="resumeId" v-if="isRouterAlive"></Detail>
          </div>
        </el-tab-pane> -->
      </el-tabs>
    </div>
  </div>

  <!-- 创建简历 -->
  <resume-create v-else @createClose="createClose"></resume-create>
</template>

<script>
import {
  Resume
} from '@/model/resume'
import ResumeCreate from '@/view/resume/resume-create'
import Detail from './detail.vue'

export default {
  components: {
    ResumeCreate,
    Detail
  },
  data() {
    return {
      isRouterAlive: true,
      tabPosition: 'right',
      resumeId: "",
      loading: false,
      form: {},
      showCreate: false,
      educations: [{
        id: "",
        name: "",
        start_time: "",
        end_time: "",
        major: "",
        diploma: "",
        descriptions: "",
      },],
      experiences: [{
        id: "",
        name: "",
        start_time: "",
        end_time: "",
        position: "",
        performance: "",
      },],
      projects: [{
        id: "",
        name: "",
        start_time: "",
        end_time: "",
        position: "",
        background: "",
        performance: "",
      },],
      eduoptions: [{
        value: 0,
        label: '高中'
      }, {
        value: 1,
        label: '大学专科'
      }, {
        value: 2,
        label: '大学本科'
      }, {
        value: 3,
        label: '硕士研究生'
      }, {
        value: 4,
        label: '博士研究生'
      }],
    }
  },
  async mounted() {
    try {
      this.loading = true
      const res = await Resume.getByUserId(this.$store.getters.user.id)
      if(!res.resume_id){
        this.$message.warning("还未创建简历，即将为您进入简历创建页面")
        setTimeout(() => {
          // 还未创建简历，会来到简历创建页面
          this.showCreate = true;
          }, 2000);
        return
      }
      this.resumeId = res.resume_id + ""
      this.form = res
      this.educations = res.educations
      this.experiences = res.experiences
      this.projects = res.projects
      this.loading = false
    } catch (error) {
      this.loading = false
      console.log(error)
      // 还未创建简历，会来到简历创建页面
      this.showCreate = true
    }
  },
  methods: {
    reload() {
      this.isRouterAlive = true
      this.$nextTick(() => (this.isRouterAlive = true))
    },
    // 教育经历操作
    async updateEducation(row) {
      //更新操作
      if (row.id !== "") {
        const res = await Resume.updateEducation(row)
        if (res.code === 1010) {
          this.$message.success("更新成功");
          this.reload()
        } else {
          this.$message.error("更新失败")
        }
      } else {
        const res = await Resume.createEducation(row)
        if (res.code === 1000) {
          this.$message.success("保存成功");
          this.reload()
        } else {
          this.$message.error("保存失败")
        }
      }
    },
    async delEducation(row) {
      if (row.id !== "") {
        const res = await Resume.delEducation(row.id)
        if (res.code === 2000) {
          this.$message.success("删除成功")
          this.reload()
        } else {
          this.$message.error("删除失败")
        }
      }
      this.educations.pop(row)
    },
    addEducation() {
      this.educations.push({
        resume_id: this.resumeId,
        id: "",
        name: "",
        start_time: "",
        end_time: "",
        major: "",
        diploma: "",
        descriptions: "",
      });
    },

    // 项目经历操作
    async updateProject(row) {
      //更新操作
      if (row.id !== "") {
        const res = await Resume.updateProject(row)
        if (res.code === 1010) {
          this.$message.success("更新成功");
          this.reload()
        } else {
          this.$message.error("更新失败")
        }
      } else {
        const res = await Resume.createProject(row)
        if (res.code === 1000) {
          this.$message.success("保存成功");
          this.reload()
        } else {
          this.$message.error("保存失败")
        }
      }
    },
    async delProject(row) {
      if (row.id !== "") {
        const res = await Resume.delProject(row.id)
        if (res.code === 2000) {
          this.reload()
          this.$message.success("删除成功")
        } else {
          this.$message.error("删除失败")
        }
      }
      this.projects.pop(row)
    },
    addProject() {
      this.projects.push({
        resume_id: this.resumeId,
        id: "",
        name: "",
        start_time: "",
        end_time: "",
        position: "",
        background: '',
        performance: "",
      });
    },

    // 工作经历操作
    async updateExperience(row) {
      //更新操作
      if (row.id !== "") {
        const res = await Resume.updateExperience(row)
        if (res.code === 1010) {
          this.$message.success("更新成功");
          this.reload()
        } else {
          this.$message.error("更新失败")
        }
      } else {
        const res = await Resume.createExperience(row)
        if (res.code === 1000) {
          this.$message.success("保存成功");
          this.reload()
        } else {
          this.$message.error("保存失败")
        }
      }
    },
    async delExperience(row) {
      if (row.id !== "") {
        const res = await Resume.delExperience(row.id)
        if (res.code === 2000) {
          this.$message.success("删除成功")
          this.reload()
        } else {
          this.$message.error("删除失败")
        }
      }
      this.experiences.pop(row)
    },
    addExperience() {
      this.experiences.push({
        resume_id: this.resumeId,
        id: "",
        name: "",
        start_time: "",
        end_time: "",
        position: "",
        performance: "",
      });
    },

    async submitForm() {
      // 获取到当前登录求职者的用户id
      this.form.user_id = this.$store.getters.user.id
      const res = await Resume.update(this.form.user_id, this.form)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
      }
      // 刷新页面，获取修改后的最新信息
      this.loading = true
      const result = await Resume.getByUserId(this.$store.getters.user.id)
      this.form = result
      this.loading = false
    },
    // 重置表单
    resetForm(formName) {
      this.$refs[formName].resetFields()
    },
    async createClose() {
      this.showCreate = false
      // 再次访问接口填充表单数据
      this.loading = true
      const res = await Resume.getByUserId(this.$store.getters.user.id)
      this.form = res
      this.loading = false
    },
    async getResumeInfo() {
      try {
        this.loading = true
        const res = await Resume.getByUserId(this.$store.getters.user.id)
        this.resumeId = res.resume_id + ""
        console.log(this.resumeId)
        this.form = res
        this.educations = res.educations
        this.experiences = res.experiences
        this.projects = res.projects
        this.$forceUpdate()
        this.loading = false
      } catch (error) {
        this.loading = false
        console.log(error)
        // 还未创建简历，会来到简历创建页面
        this.showCreate = true
      }
    }
  },
}
</script>

<style lang="scss" scoped>
.el-divider--horizontal {
  margin: 0;
}

.container {
  .title {
    height: 59px;
    line-height: 59px;
    color: $parent-title-color;
    font-size: 16px;
    font-weight: 500;
    text-indent: 40px;

    .back {
      float: right;
      margin-right: 40px;
      cursor: pointer;
    }
  }

  .wrap {
    padding: 20px;
  }

  .submit {
    float: left;
  }
}
</style>
