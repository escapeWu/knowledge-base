---
{"dg-publish":true,"permalink":"/01-frontend/build/webpack-vite-diff/","title":"webpack 和 vite 的差异","tags":["frontend","webpack","vite","build"],"created":"2024-11-26T11:20:05.573+08:00","updated":"2024-12-02T14:52:02.872+08:00"}
---

#### ANKI-webpack 和 Vite的构建原理有什么不同？
- **Webpack**：
    - 基于打包（Bundle）的理念。在处理模块时，Webpack 会从一个入口文件开始，递归地构建整个模块依赖图。它会把所有的模块（包括 JavaScript、CSS、图片等各种资源）都打包到一个或多个 bundle 文件中。例如，对于一个简单的 JavaScript 应用，Webpack 会分析`import`和`require`语句，将所有相关的模块代码收集起来，经过一系列的转换（如 babel 编译、代码压缩等）后，生成最终的打包文件。这个过程涉及到大量的模块解析、加载和转换，在处理大型项目时，构建时间可能会较长。
    - 采用模块热替换（HMR - Hot Module Replacement）技术来提高开发体验。在开发过程中，当修改了某个模块的代码时，Webpack 可以只更新受影响的模块，而不是重新加载整个页面。不过，Webpack 的 HMR 配置相对复杂，需要针对不同类型的模块进行专门的配置。
- **Vite**：
    - 基于原生 ES 模块（ESM）的开发服务器。在开发阶段，Vite 利用浏览器对 ES 模块的原生支持，不需要打包操作。当浏览器请求一个模块时，Vite 直接将对应的文件发送给浏览器，浏览器通过`<script type="module">`标签来加载和解析这些模块。这使得 Vite 在开发阶段的启动速度非常快，因为它避免了像 Webpack 那样预先打包的过程。
    - 对于生产环境，Vite 会进行预构建（Pre - build），主要是为了将一些非 ESM 格式的依赖（如 CommonJS 模块）转换为 ESM 格式，以确保在浏览器环境中能够高效地加载和运行。预构建的过程相对简单快速，并且只会对需要转换的依赖进行处理，不会像 Webpack 那样对整个项目进行全面打包。
ID: 1732591282593
#### ANKI-webpack 和 Vite的输出产物有什么不同？
- **Webpack**：
    - 在产物中，Webpack 通常会将多个模块打包成一个或多个 bundle 文件。这些 bundle 文件的格式可以是多种形式，如 CommonJS（在 Node.js 环境下常用）或者 IIFE（立即调用函数表达式，用于浏览器环境）。对于浏览器环境，Webpack 会将所有的 JavaScript 模块打包成一个或几个大的文件，并且通过自定义的加载逻辑来加载模块。例如，在一个简单的 Webpack 打包后的 JavaScript 文件中，可能会看到类似`__webpack_require__`这样的函数来实现模块的加载和解析。
    - 这种打包方式会把所有的模块依赖关系都内建在 bundle 文件中，使得浏览器在加载时只需要加载一个或几个文件即可。但如果应用规模较大，bundle 文件可能会变得非常大，导致首次加载时间过长。为了解决这个问题，Webpack 也支持代码分割（Code Splitting），通过动态`import`等方式将代码分割成多个较小的块，在需要的时候再加载。
- **Vite**：
    - Vite 在产物中更倾向于保留原生 ES 模块（ESM）的格式。在开发阶段，Vite 利用浏览器对 ES 模块的原生支持来加载模块，而在生产阶段，它也会尽量保持这种格式。这意味着浏览器可以利用==原生的`<script type="module">`标签来加载模块==，并且可以根据模块的依赖关系自动地加载相关的模块。
    - 不过，Vite 也会对一些非 ESM 格式的依赖进行预构建，将它们转换为 ESM 格式。在最终的产物中，这些经过转换的依赖也会以符合 ES 模块规范的形式出现，使得整个应用在浏览器中的加载和运行更加高效。
ID: 1732591889388


#### ANKI-webpack external的作用？
- 当在 Webpack 配置文件中使用`externals`选项时，实际上是在告诉 Webpack 某些模块应该被视为外部依赖，而不是被打包进最终的输出文件。这意味着这些模块将在运行时由浏览器或其他运行环境提供，而不是由 Webpack 处理。
假设项目依赖于`lodash`库，并且希望在浏览器环境中通过`<script>`标签加载`lodash`的全局变量。首先在 Webpack 配置文件中这样配置`externals`：
```jsx
 module.exports = {
  //...其他配置
  externals: {
    lodash: "lodash",
  },
};
// **HTML 文件中的脚本引入**
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js">
```
ID: 1732591889392

