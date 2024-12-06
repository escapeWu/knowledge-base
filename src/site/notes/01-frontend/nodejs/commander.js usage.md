---
{"dg-publish":true,"permalink":"/01-frontend/nodejs/commander-js-usage/","title":"nodejs commander.js 简单用法","tags":["js","dev-tool"],"created":"2024-12-06T10:23:19.909+08:00","updated":"2024-12-06T14:40:52.201+08:00"}
---

#### ANKI-commander.js 可以实现命令行交互
一个简单的使用例子，基础参数传入：
+ `node options-common.js -p`
+ `node options-common.js -d -s -p vegetarian`
+ `node options-common.js --pizza-type=cheese`
```js
const commander = require('commander');
const program = new commander.Command();
//
program
  .option('-d, --debug', 'output extra debugging')
  .option('-s, --small', 'small pizza size')
  .option('-p, --pizza-type <type>', 'flavour of pizza');
//
program.parse(process.argv);
//
const options = program.opts();
if (options.debug) console.log(options);
console.log('pizza details:');
if (options.small) console.log('- small pizza size');
if (options.pizzaType) console.log(`- ${options.pizzaType}`);
```
设置全局安装
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
ID: 1733467252176
