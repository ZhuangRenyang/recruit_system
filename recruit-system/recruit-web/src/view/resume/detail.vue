<template>
  <div>
    <el-button round style="float:right" type="success" @click="exportPDF()" v-loading="downloading">导出简历</el-button>
    <div class="index" id="downResume">
      <div class="resume">
        <!-- 基本信息 -->
        <div class="info">
          <div class="info_left_img">
            <el-avatar :size="120"><img :src="avatar ? avatar : defaultImg" size="120" class="aa"></el-avatar>
<!--             <el-avatar :size="120" :src="avatar"></el-avatar>-->

          </div>
          <div class="info-right">
            <div class="info_name">
              <h1>{{ name }}</h1>
              <span>{{ jobIntention }}</span>
            </div>
            <div class="info_other">
              <el-row :gutter="15">
                <el-form ref="resultForm" size="medium" label-width="100px" label-position="left">
                  <el-col :span="8">
                    <el-form-item label-width="0">
                      <i class="el-icon-s-custom"></i>
                      {{ sex }} | {{ age }}
                    </el-form-item>
                  </el-col>
                  <el-col :span="8">
                    <el-form-item label-width="0" title="英语等级">
                      <i class="el-icon-star-off"></i>
                      {{ english }}
                    </el-form-item>
                  </el-col>
                  <el-col :span="8">
                    <el-form-item label-width="0" title="联系电话">
                      <i class="el-icon-phone"></i>
                      {{ tel }}
                    </el-form-item>
                  </el-col>
                  <el-col :span="9">
                    <el-form-item label-width="0" title="邮箱">
                      <i class="el-icon-message"></i>
                      {{ email }}
                    </el-form-item>
                  </el-col>
                  <el-col :span="8">
                    <el-form-item label-width="0"  title="居住地">
                      <i class="el-icon-s-home"></i>
                      {{ home }}
                    </el-form-item>
                  </el-col>
                </el-form>
              </el-row>
            </div>
          </div>
        </div>

        <!-- 教育经历 -->
        <div class="education">
          <Title title="教育背景" />
          <div class="main">
            <div v-for="(item, index) in educations" :key="index">
              <el-row :gutter="20">
                <el-col :span="6">
                  <span>{{ item.name }}</span>
                </el-col>
                <el-col :span="6">
                  <span>{{ item.major }}</span>
                </el-col>
                <el-col :span="5">
                  <span>{{ changeDiploma(item.diploma) }}</span>
                </el-col>
                <el-col :span="5" :offset="2" class="time">
                  <span>{{ monthformat(item.start_time) }}-{{ monthformat(item.end_time) }}</span>
                </el-col>
              </el-row>
              <Content :data="item.descriptions" />
            </div>
          </div>
        </div>

        <!-- 专业技能 -->
        <div class="skill">
          <Title title="专业技能" />
          <div class="main">
            <Content :data="ability.descriptions" :mode="model" />
          </div>
        </div>

        <!-- 实习经历 -->
        <div class="internship" v-if="experiences">
          <Title title="实习经历" />
          <div class="main">
            <div v-for="(experience, index) in experiences" :key="index">
              <el-row :gutter="20">
                <el-col :span="10">
                  <span class="weight">{{ experience.name }}</span>
                </el-col>
                <el-col :span="5">
                  <span>{{ experience.position }}</span>
                </el-col>
                <el-col :span="5" :offset="4" class="time">
                  <span>{{ monthformat(experience.start_time) }}-{{ monthformat(experience.end_time) }}</span>
                </el-col>
              </el-row>
              <Content :data="experience.performance" />
            </div>
          </div>
        </div>

        <!-- 项目经历 -->
        <div class="projects" v-if="projects">
          <Title title="项目经历" />
          <div class="main">
            <div v-for="(project, index) in projects" :key="index">
              <el-row :gutter="20">
                <el-col :span="10">
                  <span class="project_name weight">
                    {{
                        project.name
                    }}
                  </span>
                </el-col>
                <el-col :span="5">
                  <span>{{ project.position }}</span>
                </el-col>
                <el-col :span="5" :offset="9" class="time">
                  <span>{{ monthformat(project.start_time) }}-{{ monthformat(project.end_time) }}</span>
                </el-col>
                <!-- <el-col :span="24">
                <span class="weight">项目地址：</span>
                <span>{{ project.address }}</span>
              </el-col>-->
              </el-row>
              <div class="weight">项目背景：</div>
              <Content :data="project.background" :mode="project.backgroundMode" />
              <div class="weight">项目描述：</div>
              <Content :data="project.performance" />
            </div>
          </div>
        </div>

        <!-- 个人评价 -->
        <div class="evaluate" v-if="evaluate">
          <Title title="个人评价" />
          <div class="main">
            <Content :data="evaluate.word" :mode="evaluate.wordMode" />
            <Content :data="evaluate.descriptions" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Title from "../../component/Title/index.vue";
import Content from "../../component/Content/index.vue";
import moment from 'moment';
import exportPDF from './export-pdf'
import {
  Resume
} from '@/model/resume'
export default {
  name: "Detail",
  components: {
    Title,
    Content,
  },
  props: {
    id: String,
  },
  watch: {
    id(now, old) {
      this.updataInfo(now)
    }
  },
  data() {
    return {
      downloading: false,
      model: "p",
      // 基本信息
      // 头像照片
      avatar: "",
      jobIntention: "",
      name: "",
      sex: "",
      age: "",
      english: "",
      tel: "1",
      email: "",
      home: "",
      // 教育经历
      educations: [{
        name: "",
        start_time: "",
        end_time: "",
        major: "",
        diploma: "",
        descriptions: "",
      },],
      // 专业技能
      ability: {
        // 专业技能显示模式，ol为有序列表（前面是数字），ul为无序列表（前面是圆点），p为段落
        skillsMode: 'p',
        descriptions: "",
      },
      // 项目经历
      projects: [{
        name: "",
        start_time: "",
        end_time: "",
        major: "",
        // 项目背景显示模式，ol为有序列表（前面是数字），ul为无序列表（前面是圆点），p为段落
        backgroundMode: 'ol',
        background: '',
        performance: ""
      },],
      // 实习经历
      experiences: [{
        name: "",
        start_time: "",
        end_time: "",
        position: "",
        performance: "",
      },],
      // 个人评价
      evaluate: {
        // 个人评价显示模式，ol为有序列表（前面是数字），ul为无序列表（前面是圆点），p为段落
        wordMode: 'p',
        word: ''
      },
      defaultImg: require("@/assets/image/user/user.png")
    };

  },
  async mounted() {
    try {
      if (this.id === null || this.id == '' || this.id == "null") return
      const res = await Resume.getById(this.id)
      // console.log(res)
      this.ability.descriptions = res.ability,
        this.avatar = res.avatar ? res.avatar : this.defaultImg,
        this.educations = res.educations,
        this.experiences = res.experiences,
        this.projects = res.projects,
        this.jobIntention = res.job_intention,
        this.english = res.english,
        this.name = res.name,
        this.sex = res.sex === 0 ? "男" : "女",
        this.evaluate.word = res.personal_summary,
        this.tel = res.tel.substring(0, 3)+"****"+res.tel.substr(res.tel.length-4),
        this.age = res.age,
        this.email = res.email,
        this.home = res.home

    } catch (error) {
      console.log(error)
    } finally {
      this.imageUrlToBase64()
    }
  },
  created() { },
  methods: {
    imageUrlToBase64() {
      //一定要设置为let，不然图片不显示
      let image = new Image();
      //解决跨域问题
      image.setAttribute('crossOrigin', 'anonymous');
      let imageUrl = this.avatar;
      image.src = imageUrl
      let that = this;
      //image.onload为异步加载
      image.onload = () => {
        var canvas = document.createElement("canvas");
        canvas.width = image.width;
        canvas.height = image.height;
        var context = canvas.getContext('2d');
        context.drawImage(image, 0, 0, image.width, image.height);
        var quality = 0.8;
        //这里的dataurl就是base64类型
        var dataURL = canvas.toDataURL("image/jpeg", quality);//使用toDataUrl将图片转换成jpeg的格式,不要把图片压缩成png，因为压缩成png后base64的字符串可能比不转换前的长！
        that.avatar = dataURL
      }
    },
    exportPDF() {
      try {
        this.downloading = true
        this.imageUrlToBase64()
        exportPDF.exportPdf("downResume", this.name + "-" + this.jobIntention)
      } catch (err) {
        this.$message.error("导出简历发生错误")
        this.downloading = false
      } finally {
        this.downloading = false;
        this.$message.success("导出简历成功")
      }
    },
    changeDiploma(value) {
      if (value == 0) return "高中"
      else if (value == 1) return "大学专科"
      else if (value == 2) return "大学本科"
      else if (value == 3) return "硕士研究生"
      else if (value == 4) return "博士研究生"
      else return ""
    },
    dateformat(date) {
      return moment(date).format("YYYY")
    },
    monthformat(date) {
      return moment(date).format("YYYY.MM")
    },
    async updataInfo(nowid) {
      try {
        const res = await Resume.getById(nowid)//获取当前用户信息
        // console.log(res)
        this.ability.descriptions = res.ability,
          this.avatar = 'http://localhost:5000/assets/'+res.avatar,//跨域问题用了5000端口代替
          // console.log('当前图片路径'+this.avatar)
          this.educations = res.educations,
          this.experiences = res.experiences,
          this.projects = res.projects,
          this.jobIntention = res.job_intention,
          this.english = res.english,
          this.name = res.name,
          this.sex = res.sex === 0 ? "男" : "女",
          this.evaluate.word = res.personal_summary,
          this.tel = res.tel,
          this.age = res.age,
          this.email = res.email,
          this.home = res.home
      } catch (error) {
        console.log(error)
      } finally { }
    }
  },
};
</script>

<style lang="scss" scoped>
.aa {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  overflow: hidden;
}

.aa img {
  position: relative;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  margin: 0 auto;
  height: 100%;
}

.index {
  margin: 20px auto;

  .resume {
    width: 820px;
    margin: 0 auto;
    padding: 20px 20px;
    box-shadow: 0px 3px 10px 5px #e9e9e9;
    border-radius: 10px;
    line-height: 28px;

    .weight {
      font-weight: 500;
    }

    .main {
      padding: 20px 12px 30px 12px;
    }

    .time {
      span {
        color: #a8a8a8;
      }
    }

    .info {
      margin-bottom: 0px;
    }

    .info {
      display: flex;
      align-items: center;

      .info_left_img {
        ::v-deep img {
          width: 100%;
        }
      }

      .info-right {
        margin-left: 50px;
      }

      &_name {
        line-height: 80px;
        display: flex;

        h1 {
          font-size: 32px;
        }

        span {
          margin-left: 15px;
          font-size: 14px;
        }
      }

      &_other {
        ::v-deep .el-descriptions__cell {
          padding-right: 35px;
        }

        i {
          color: #c0c4cc;
          font-size: 15px;
          margin-right: 10px;
        }
      }
    }

    .project {
      .project_name {
        letter-spacing: 1px;
        font-size: 16px;
      }
    }
  }
}
</style>
