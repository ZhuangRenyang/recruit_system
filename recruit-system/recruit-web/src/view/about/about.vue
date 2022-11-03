<template>
  <div class="container" v-if="!showDetail && !showHot">
    <!-- <div class="header">
      <div class="title">
        欢迎使用校企招聘网系统
        <img :src="logo" alt="">
      </div>
    </div> -->
    <!-- 搜索框 -->
    <div class="box">
      <div class="left">
        <img :src="logo" alt="">
        <lin-search @query="onQueryChange" placeholder="请输入职位名称" ref="searchKeyword" />
      </div>
      <div class="right" @click.prevent="handleHot()">热门职位推荐</div>
    </div>
    <transition name="fade">
      <div class="search" v-if="keyword">
        <p class="search-tip"> 
          搜索“
          <span class="search-keyword">{{ keyword }}</span>”, 找到
          <span class="search-num">{{ totalNums }}</span> 条职位信息
        </p>
        <button class="search-back" @click="backInit">返回全部职位</button>
      </div>
    </transition>
    <!-- 职位列表 -->
    <el-table stripe v-loading="loading" :data="tableData">
      <el-table-column prop="title" label="职位名称" width="250"></el-table-column>
      <el-table-column prop="city" label="工作地点" width="250"></el-table-column>
      <el-table-column prop="salary_down,salary_up" label="薪资" width="250">
        <template slot-scope="scope">{{ scope.row.salary_down }}-{{ scope.row.salary_up }}</template>
      </el-table-column>
      <el-table-column prop="quantity" label="招聘人数" width="250"></el-table-column>
      <el-table-column fixed="right" label="操作">
        <template slot-scope="scope">
          <el-button @click.prevent="handleDetail(scope.row)" type="primary" plain size="mini">查看</el-button>
          <el-button @click.prevent="handleDelivery(scope.row)" v-permission="{ permission: '投递简历' }" type="success"
            plain size="mini">投递简历</el-button>
          <el-button @click.prevent="handleCollect(scope.row)" v-permission="{ permission: '添加收藏' }" type="info" plain
            size="mini">收藏职位</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination">
      <el-pagination @current-change="handleCurrentChange" :background="true" :page-size="pageCount"
        :current-page="currentPage" v-if="refreshPagination" layout="prev, pager, next, jumper" :total="totalNums">
      </el-pagination>
    </div>
  </div>
  <!-- 职位详情 -->
  <position-detail v-else-if="showDetail && !showHot" @detailClose="detailClose" :detailPositionID="detailPositionID"
    :temp="1"></position-detail>
  <!-- 热招职位 -->
  <hot-position v-else @hotClose="hotClose"></hot-position>
</template>

<script>
import LinSearch from '@/component/base/search/lin-search'
import { Position } from '@/model/position'
import { Application } from '@/model/application'
import { Resume } from '@/model/resume'
import { Favor } from '@/model/favor'
import PositionDetail from '@/view/position/position-detail'
import HotPosition from '@/view/position/hot-position'

export default {
  components: {
    LinSearch,
    PositionDetail,
    HotPosition,
  },
  data() {
    return {
      showDetail: false, // 是否显示职位详情页
      showHot: false, // 是否显示热招职位列表
      tableData: [], // 表格数据
      totalNums: 0, // 数据总数
      currentPage: 1, // 当前页数
      pageCount: 10, // 每页的数据量
      refreshPagination: true, // 页数增加的时候，因为缓存的缘故，需要刷新 Pagination 组件
      detailPositionID: 0, // 职位id
      searchKeyword: '', // 搜索时输入的关键字
      keyword: null, // 查询关键字,用于显示搜索提示
      form: {}, //投递简历时传入的列表数据
      list: {}, //收藏职位时传入的列表数据
      logo: require("@/assets/image/logo.png")
    }
  },
  async created() {
    this.loading = true
    this.getByState()
    this.loading = false
  },
  watch: {
    /**
     * 关键字搜索
     */
    searchKeyword(newVal) {
      if (newVal) {
        this.keyword = newVal
        if (this.searchUser) {
          this.keyword = `${newVal}`
        }
      } else {
        this.keyword = ''
        this.$refs.searchKeyword.clear()
      }
      this.searchPositionList()
    },
  },
  methods: {
    async getByState() {
      const page = this.currentPage - 1
      const count = this.pageCount
      // 首页展示所有审核通过的职位
      const positions = await Position.getByState(1, page, count)
      this.tableData = positions.items
      this.totalNums = positions.total
    },
    // 通过查询关键字分页搜索职位列表 
    async searchPositionList() {
      const page = this.currentPage - 1
      const count = this.pageCount
      const positions = await Position.getByKeyword(page, count, this.searchKeyword)
      this.tableData = positions.items
      this.totalNums = positions.total
    },
    // 清空检索
    async backInit() {
      this.searchKeyword = ''
      this.keyword = ''
      this.tableData = []
      this.loading = true
      this.getByState()
      this.loading = false
    },
    /**
     * 监听输入查询关键字
     */
    async onQueryChange(query) {
      this.searchKeyword = query.trim()
    },
    // 切换table页
    async handleCurrentChange(val) {
      this.currentPage = val
      this.loading = true
      this.getByState()
      this.loading = false
    },
    handleDetail(val) {
      this.showDetail = true
      this.detailPositionID = val.id
    },
    handleHot() {
      this.showHot = true
    },
    rowClick() { },
    detailClose() {
      this.showDetail = false
      this.getByState()
    },
    hotClose() {
      this.showHot = false
      this.showDetail = false
      this.getByState()
    },
    // 投递简历
    async handleDelivery(val) {
      // 根据用户id和职位id判断用户是否已经投递过该职位，避免重复投递
      const flag = await Application.getByPositionIdAndUserId(val.id, this.$store.getters.user.id)
      if (flag === false) {
        // 不能重复投递
        this.$message.error("你已投递过该职位，不可重复投递")
      } else {
        // 获取当前登录求职者的用户id
        this.form.user_id = this.$store.getters.user.id
        // 获取当前投递简历的职位id
        this.form.position_id = val.id
        // 根据用户id查询绑定的简历id
        const temp = await Resume.getByUserId(this.$store.getters.user.id)
        this.form.resume_id = temp.resume_id
        console.log(temp)
        // 根据职位id查询该职位所对应的hr_id
        const result = await Position.getById(val.id)
        this.form.hr_id = result.hr_id
        this.form.company_id = val.company_id
        // 调用创建申请的方法
        const res = await Application.create(this.form)
        if (res.code < window.MAX_SUCCESS_CODE) {
          this.$message.success(`${res.message}`)
        }
      }
    },
    // 收藏职位
    async handleCollect(val) {
      // 获取当前登录求职者的用户id
      this.list.user_id = this.$store.getters.user.id
      // 获取当前收藏的职位id
      this.list.position_id = val.id
      // 调用添加收藏的方法
      const res = await Favor.create(this.list)
      if (res.code < window.MAX_SUCCESS_CODE) {
        this.$message.success(`${res.message}`)
      }
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
      font-size: 25px;
      font-weight: 500;
      margin-left: 450px;
    }
  }

  .search {
    height: 52px;
    width: 100%;
    background: rgba(57, 99, 188, 0.1);
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    margin-top: 24px;
    margin-bottom: 24px;

    .search-tip {
      margin-left: 40px;
      height: 52px;
      line-height: 52px;
      color: #354058;
      font-size: 14px;

      .search-keyword {
        color: $theme;
      }

      .search-num {
        color: #f4516c;
      }
    }

    .search-back {
      margin: 8px 20px;
      height: 32px;
      background: #f4516c;
      border: none;
      border-radius: 2px;
      color: #fff;
      padding: 0 13px;
      font-size: 14px;
      cursor: pointer;
    }
  }

  .box {
    display: flex;
    justify-content: flex-start;
    align-items: center;

    .left {
      margin-left: 280px;
      position: relative;
      height: 50px;
      margin-top: 20px !important;
      margin-bottom: 10px !important;

      img {
        display: inline-block;
        width: 150px;
        position: absolute;
        left: -160px;
        top: 0;
        height: 100%;
      }
    }

    .right {
      height: 59px;
      line-height: 59px;
      color: $right-side-font-color;
      font-size: 18px;
      font-weight: 400;
      margin-left: 50px;
      cursor: pointer;
    }
  }

  .pagination {
    display: flex;
    justify-content: flex-end;
    margin: 30px;
  }
}
</style>

