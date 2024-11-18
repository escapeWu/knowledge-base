---
{"dg-publish":true,"permalink":"/01-frontend/build/webpack-package/","title":"webpack 多js压缩成一个bundle.js","created":"2024-09-16T21:52:27.000+08:00","updated":"2024-09-16T21:52:27.000+08:00"}
---

```js
const path = require('path');
module.exports = {
  entry: './src/index.js', // 入口文件
  output: {
    filename: 'bundle.js', // 输出文件
    path: path.resolve(__dirname, 'dist'), // 输出目录
  },
  mode: 'production', // 生产模式下会自动压缩
};

// usage
<script src="dist/bundle.js"></script>
```