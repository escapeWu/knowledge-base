---
{"dg-publish":true,"permalink":"/01-frontend/build/webpack-splitchunks/","title":"webpack splitChunk","tags":["webpack","frontend","build"],"created":"2024-09-16T22:06:09.000+08:00","updated":"2024-12-02T14:51:40.390+08:00"}
---

**代码分块的作用**
1、将构建出来的一个代码块，分解成多个小块，方便加载。
2、将业务代码和第三方库的代码分离，这样增加新的业务的时候就不会影响到第三方库代码的内容，也不会影响到浏览器的缓存了。
**代码分块的方式**
1、分离业务代码和第三方库（vendor）
2、按需加载（使用import()的语法）
```js
splitChunks: {
      chunks: "all", //指定打包同步加载还是异步加载
      minSize: 30000, //构建出来的chunk大于30000才会被分割 
      minRemainingSize: 0,
      maxSize: 0, //会尝试根据这个大小进行代码分割
      minChunks: 1, //制定用了几次才进行代码分割
      maxAsyncRequests: 6,
      maxInitialRequests: 4,
      automaticNameDelimiter: "~", //文件生成的连接符
      cacheGroups: {
        defaultVendors: {
          test: /[\\/]node_modules[\\/]/, //符合组的要求就给构建venders
          priority: -10, //优先级用来判断打包到哪个里面去
          filename: "vendors", //指定chunks名称
        },
        default: {
          minChunks: 2, //被引用两次就提取出来
          priority: -20,
          reuseExistingChunk: true, //检查之前是否被引用过, 有的话就不被打包了
        },
      },
    }
```
https://juejin.cn/post/6844904195737255943