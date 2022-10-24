<template>
  <div class="app-nav-bar">
    <div class="nav-content">
      <breadcrumb />
      <div class="right-info">
        <router-link to="/index">返回首页&nbsp;&nbsp;&nbsp;</router-link>
        <lin-notify
          height="370"
          @readMessages="readMessages"
          :trigger="'click'"
          :messages="messages"
          @readAll="readAll"
          @viewAll="viewAll"
          class="lin-notify"
          :value="value"
          :hidden="hidden"
        ></lin-notify>
        <clear-tab></clear-tab>
        <screenfull />
        <user></user>
      </div>
    </div>
  </div>
</template>

<script>
import Breadcrumb from './breadcrumb'
import Screenfull from './screen-full'
import User from './user'
import ClearTab from './clear-tab'
import { Notify } from '@/model/notify'
import moment from 'moment'

export default {
  name: 'NavBar',
  created() {
    this.readMessages()
  },
  // watch: {
  //   messages: {
  //     handler() {
  //       this.value = this.messages.filter(msg => msg.is_read === false).length
  //       if (this.value === 0) {
  //         this.hidden = true
  //       } else {
  //         this.hidden = false
  //       }
  //     },
  //     immediate: true,
  //   },
  // },
  data() {
    return {
      value: 0,
      hidden: true,
      item: {
        content: "",
        id: '',
        is_read: "",
        time: "",
        user_name: ""
      },
      messages: [],
    }
  },
  methods: {
    // 查看全部已读信息
    async readAll() {
      // 查看全部已读消息之前，会把全部未读消息状态修改为已读
      await Notify.update(this.$store.getters.user.nickame)
      const res = await Notify.get(this.$store.getters.user.nickname, "true")
      this.messages = res
      this.formateDate(this.messages)
    },
    // 查看全部信息
    async viewAll() {
      const res = await Notify.getAll(this.$store.getters.user.nickname)
      this.messages = res
      this.formateDate(this.messages)
    },
    // 查看未读信息
    async readMessages() {
      const res = await Notify.get(this.$store.getters.user.nickname, "false")
      if (res==null) return;
      this.messages = res
      this.formateDate(this.messages)
    },
    formateDate(item) {
      for (var i = 0; i < item.length; i++) {
        item[i].time = moment(item[i].time).format("YYYY-MM-DD hh:mm:ss")
      }
    },
    
  },
  components: {
    Breadcrumb,
    User,
    Screenfull,
    ClearTab,
  },
}
</script>

<style lang="scss" scoped>
.lin-notify {
  margin-right: 20px;
}
.app-nav-bar {
  width: 100%;
  height: $navbar-height;
  display: flex;
  align-items: center;
  .logo.js-min-logo {
    width: 64px;
    font-size: 16px;
    color: #fff;
  }
  .nav-content {
    flex: 1;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-left: 10px;
    padding-right: $navbar-padding;
    .right-info {
      display: flex;
      align-items: center;
    }
  }
}

</style>
