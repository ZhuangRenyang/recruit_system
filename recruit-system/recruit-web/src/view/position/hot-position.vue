<template>
  <div class="container" v-if="!showDetail">
    <div class="title">
      <span>热门职位推荐</span> <span class="back" @click="back"> <i class="iconfont icon-fanhui"></i> 返回 </span>
    </div>

    <el-table stripe v-loading="loading" :data="tableData">
      <el-table-column prop="title" label="职位名称" width="250"></el-table-column>
      <el-table-column prop="hits" label="职位浏览量" width="250"></el-table-column>
      <el-table-column prop="company_name" label="所属公司" width="250"></el-table-column>
      <el-table-column prop="logo" label="公司logo" width="250">
        <template v-if="scope.row.logo" slot-scope="scope">
          <el-image :src="scope.row.logo" :preview-src-list="imgSrcList" style="max-height: 50px; max-width: 100px;">
          </el-image>
        </template>
      </el-table-column>
      <el-table-column fixed="right" label="操作">
        <template slot-scope="scope">
          <el-button @click.prevent="handleDetail(scope.row)" type="primary" plain size="mini">查看</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
  <!-- 详情页 -->
  <position-detail v-else @detailClose="detailClose" :detailPositionID="detailPositionID"></position-detail>
</template>

<script>
import {Position} from '@/model/position'
import PositionDetail from '@/view/position/position-detail'

export default {
  components: {
    PositionDetail,
  },
  data() {
    return {
      showDetail: false,
      tableData: [],
      imgSrcList: [], // 用于大图预览
      detailPositionID: 0,
    }
  },
  async created() {
    this.loading = true
    this.getPositionList()
    this.loading = false
  },
  methods: {
    async getPositionList() {
      const positions = await Position.sortByHits()
      this.tableData = positions
      this.initImgSrcList()
    },
    initImgSrcList() {
      this.tableData.forEach(item => {
        if (!item.logo) {
          return
        }
        this.imgSrcList.push(item.logo)
      })
    },
    handleDetail(val) {
      this.showDetail = true
      this.detailPositionID = val.id
    },
    detailClose() {
      this.showDetail = false
      this.getPositionList()
    },
    back() {
      this.$emit('hotClose')
    },
  },
}
</script>

<style lang="scss" scoped>
.container {
  padding: 0 30px;

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
}
</style>