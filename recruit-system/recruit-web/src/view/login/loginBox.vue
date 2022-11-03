<template>
  <div>
    <!-- <div class="team-name hidden-sm-and-down"><img src="@/assets/image/login/team-name.png" alt="logo" /></div> -->
    <el-drawer
      title="校企招聘网"
      :visible.sync="show"
      :direction="direction"
      :before-close="handleClose"
    >
      <div>
        <!-- <div class="title" style="margin-left: 350px">
        <h1 title="Lin">校企招聘网</h1>
        </div>-->
        <form autocomplete="off" @submit.prevent="throttleLogin()">
          <div class="form-item nickname">
            <span class="icon account-icon"></span>
            <input type="text" v-model="form.username" autocomplete="off" placeholder="请填写用户名" />
          </div>
          <div class="form-item password">
            <span class="icon secret-icon"></span>
            <input
              type="password"
              v-model="form.password"
              autocomplete="off"
              placeholder="请填写用户登录密码"
            />
          </div>
          <button class="submit-btn" type="submit">登录</button>
        </form>
      </div>
    </el-drawer>
  </div>
</template>

<script>
import {
  mapActions,
  mapMutations
} from 'vuex'
import User from '@/lin/model/user'
import Utils from '@/lin/util/util'

export default {
  name: 'login',
  props: {
    show: Boolean
  },
  data() {
    return {
      direction: "rtl",
      loading: false, // 加载动画
      wait: 2000, // 2000ms之内不能重复发起请求
      throttleLogin: null, // 节流登录
      form: {
        username: '',
        password: '',
      },
    }
  },
  methods: {
    onClose() {
      this.form = {
        username: '',
        password: '',
      }
    },
    close() {
      this.show = false
    },
    handleClose(done) {
      this.$confirm('确认关闭？')
        .then(_ => {
          done();
          this.form = {
            username: '',
            password: '',
          }
          this.show = false
        })
        .catch(_ => { });
    },
    async login() {
      const {
        username,
        password
      } = this.form
      try {
        this.loading = true
        await User.getToken(username, password)
        await this.getInformation()
        this.loading = false
        this.$router.push('/about')
        this.$message.success('登录成功')
      } catch (e) {
        this.loading = false
        console.log(e)
      }
    },
    async getInformation() {
      try {
        // 尝试获取当前用户信息
        const user = await User.getPermissions()
        this.setUserAndState(user)
        this.setUserPermissions(user.permissions)
      } catch (e) {
        console.log(e)
      }
    },
    ...mapActions(['setUserAndState']),
    ...mapMutations({
      setUserPermissions: 'SET_USER_PERMISSIONS',
    }),
  },
  created() {
    // 节流登录
    this.throttleLogin = Utils.throttle(this.login, this.wait)
  },
  components: {},
}
</script>

<style lang="scss">
</style>
