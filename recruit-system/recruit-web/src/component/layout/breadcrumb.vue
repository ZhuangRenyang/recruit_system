<template>
  <div class="nav-title">
    <a class="item" v-for="(item, index) in titleArr" style="cursor: default;" :key="index">
      <!-- <i v-if="index===0"
         :class="item.meta.icon"></i> -->
      <div class="position">
        <span v-if="index==0">当前位置:</span>
        <span v-else>--></span>
        <span>{{ item }}</span>
      </div>
    </a>
  </div>
</template>

<script>
export default {
  data() {
    return {}
  },
  computed: {
    stageInfo() {
      return this.$store.getters.getStageInfo(this.$route.name)
    },
    titleArr() {
      return this.stageInfo.map(item => item.title).filter(item => !!item)
    },
  },
}
</script>

<style lang="scss">
.nav-title {
  display: flex;
  align-items: center;
  font-size: 14px;

  .item {
    i {
      margin-right: 4px;
    }

    display: flex;
    align-items: center;
    padding-right: 18px;
    position: relative;
    color: $right-side-font-color;

    &:after {
      content: '/';
      position: absolute;
      top: 0;
      right: 6px;
    }
  }

  .item:last-child {
    color: $theme;
    padding-right: 0;

    &:after {
      content: '';
    }
  }
}

.position {
  color: black;

  
}
.position span:nth-child(2){
  color: rgb(55 179 156);
  text-decoration: underline;
}
</style>
