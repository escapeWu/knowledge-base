---
{"dg-publish":true,"permalink":"/01-frontend/react/electronjs-kylin-build-hello-world/","title":"electron 麒麟系统打包运行","tags":["react","frontend"],"created":"2024-12-10T17:54:03.985+08:00","updated":"2024-12-10T18:00:21.653+08:00"}
---

首先按照[此处](https://www.electronjs.org/zh/docs/latest/tutorial/quick-start#%E5%9B%9E%E9%A1%BE)的官方文档，构建好项目，此处不做赘述，要求npm start 能正常运行

#### 使用 electron-builder 构建linux appImage安装包
+ npm install --save-dev electron-builder
+ package.json 增加构建配置：
```json
"build": {
  "appId": "com.example.myapp",
  "linux": {
    "target": ["AppImage"]
  }
}
```
+ npx electorn-builder 执行构建
+ 运行查看：./dist/your-electorn-app.AppImage
![img_v3_02he_39d216c8-61db-4451-9eb0-771a2c50458g.jpg](/img/user/attachments/img_v3_02he_39d216c8-61db-4451-9eb0-771a2c50458g.jpg)