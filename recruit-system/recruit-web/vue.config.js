const path = require('path')

function resolve(dir) {
  return path.join(__dirname, dir)
}

module.exports = {
  lintOnSave: true,
  productionSourceMap: false,
  publicPath:"./",
  // assetsDir: 'static',
  chainWebpack: config => {
    config.resolve.alias
      .set('@', resolve('src'))
      .set('lin', resolve('src/lin'))
      .set('assets', resolve('src/asset'))
    config.module
      .rule('md')
      .test(/\.md$/)
      .use('vue-loader')
      .loader('vue-loader')
      .end()
      .use('vue-markdown-loader')
      .loader('vue-markdown-loader/lib/markdown-compiler')
  },
  configureWebpack: {
    resolve: {
      extensions: ['.js', '.json', '.vue', '.scss', '.html'],
    },
  },
  css: {
    loaderOptions: {
      sass: {
        data: '@import "@/assets/style/share.scss";',
      },
    },
  },
  // node_modules依赖项es6语法未转换问题
  transpileDependencies: ['vuex-persist'],
  devServer: {
    // 本地服务器端口号
    port: 8080,
    // 代理服务器 '
    proxy:{
      "/eval-api":{
        target:"http://43.143.149.16:5000",
        changeOrigin : true,   //允许跨域
        pathRewrite:{"^/eval-api":""}
      },
      "/msg-api":{
        target:"https://v.api.aa1.cn",
        changeOrigin : true,   //允许跨域
        pathRewrite:{"^/msg-api":""}
      },
      "/ES-api":{
        target:"http://iwenwiki.com",
        changeOrigin : true,
        pathRewrite:{"^/ES-api":""}
      }
    }
}
}
