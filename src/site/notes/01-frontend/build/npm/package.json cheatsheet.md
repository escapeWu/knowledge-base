---
{"dg-publish":true,"permalink":"/01-frontend/build/npm/package-json-cheatsheet/","title":"package.json 具体属性介绍","tags":["js","dev-tool"],"created":"2024-12-06T10:30:12.805+08:00","updated":"2024-12-06T15:39:53.766+08:00"}
---

#### ANKI-package.json 将包注册为全局指令
假设有需求：[[01-frontend/nodejs/commander.js usage\|我们使用 commander.js 实现了命令行交互]]，如何在linux 上全局使用，比如`my-docker-run -p 8080 -d`
首先，在项目的`package.json`文件中，添加一个`bin`字段，指定命令行工具的入口文件：
```json
{
  "name": "my-cli-tool",
  "version": "1.0.0",
  "description": "My awesome CLI tool",
  "main": "index.js",
  "bin": {
    "my-tool": "./index.js"
  },
  "dependencies": {
    "commander": "^9.4.0"
  }
}
```
然后，使用`npm link`或`yarn link`命令将项目链接到全局node_moudles环境中。这将使你的命令行工具在系统中可用。
- 使用 npm：`npm link`
- 使用 yarn：`yarn link`
ID: 1733467252189

#### ANKI-package.json 有哪些hooks可以调用
```json
{
  "scripts": {
    "preinstall": "echo 'Before installation'",
    "install": "echo 'During installation'",
    "postinstall": "echo 'After installation'",
    "pretest": "echo 'Before testing'",
    "test": "jest",
    "posttest": "echo 'After testing'",
    "prebuild": "echo 'Before building'",
    "build": "webpack",
    "postbuild": "echo 'After building'"
  }
}
```
ID: 1733470793676
