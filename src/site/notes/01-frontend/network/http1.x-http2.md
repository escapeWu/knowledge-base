---
{"dg-publish":true,"permalink":"/01-frontend/network/http1-x-http2/","tags":["http","network"],"created":"2024-09-30T11:07:25.000+08:00","updated":"2024-12-02T14:57:58.247+08:00"}
---

#### ANKI-HTTP/1.x 协议的性能缺陷
##### **TCP 连接导致性能瓶颈**:
![Pasted image 20240703174001.png](/img/user/attachments/Pasted%20image%2020240703174001.png)
HTTP 的传输协议主要依赖于 TCP 来提供从客户端到服务器端之间的连接。TCP 建立连接有三次握手，加上 TCP 慢启动导致的传输速度低，打开和保持 TCP 连接在很大程度上影响着网站和 Web 应用程序的性能。
TCP 连接会随着时间自我调谐，起初会限制连接的最大速度，如果数据成功传输，会随着时间的推移提高传输的速度。这种调谐则被称为 TCP 慢启动。
**在 HTTP/1.x 连个常用模型：短连接, 长连接**
![Pasted image 20240703174425.png](/img/user/attachments/Pasted%20image%2020240703174425.png)
短连接是 HTTP/1.0 的默认模型，它每发一个请求时都会创建见一个新的 TCP 连接，收到 response 的时候就立马关闭连接，每次创建一个 TCP 连接都相当耗费资源，另外 TCP 连接的性能只有在该连接使用一段时间以后（慢启动）才能得到改善，可想而知这种方式的性能很差，现在基本不用这种方式。
在 HTTP/1.1 以后就有了长连接和流水线，长连接是指创建一个 TCP 连接后，可以保持连接完成多次连续的请求，减少了打开 TCP 连接的次数，在 HTTP/1.1 以后的版本是默认的长连接的模式，长连接的缺点是，就算在空闲状态，它还是会消耗服务器资源。长连接是通过 Keep-Alive消息头来控制。
![Pasted image 20240703173827.png](/img/user/attachments/Pasted%20image%2020240703173827.png)

##### HTTP/1.x 队头阻塞（head of line blocking）
默认情况下，HTTP 请求是按顺序发出的。下一个请求只有在当前请求收到答应过后才会被发出，由于受到网络延迟和带宽的限制，如果某个请求花了很长时间，那么**队头阻塞（head of line blocking）** 会影响其他请求。
##### 无状态：头部巨大且重复
由于 HTTP 协议是无状态的，每一个请求都得携带 HTTP 头部，特别是对于有携带 cookie 的头部，而 cookie 的大小通常很大，另外还有 User Agent、Accept、Server 等，通常多达几百字节甚至上千字节，但 Body 却经常只有几十字节
##### 明文传输：不安全
HTTP/1.1 在传输数据时，所有传输的内容都是明文，客户端和服务器端都无法验证对方的身份，这在一定程度上无法保证数据的安全性。HTTPS 解决了这个安全问题，但 TLS/SSL 建立连接的时候，需要四次握手，增加了 RTT（Round Trip Time），一定程度上也会影响性能。
#### ANKI-为了优化 HTTP/1.x 的网络性能问题，前端用到的黑魔法
- **Bundling**：使用 webpack 等工具打包，打包压缩多个 js 文件到一个文件中，以一个请求替代多个请求
	- [[01-frontend/build/webpack package\|webpack package]]
- **Code Splitting**：在打包的过程中，将公用代码切割到一个文件中，这样只需要下载一份公用代码
	- [[01-frontend/build/webpack-splitchunks\|webpack-splitchunks]]
- **Minify，Uglify，Compression**：减少文件大小
	- - **Minify**：使用 `TerserPlugin` 和 `css-minimizer-webpack-plugin` 来压缩 JavaScript 和 CSS。
	- **Uglify**：推荐使用 `TerserPlugin` 代替 `uglify-js`。
	- **Compression**：使用 `compression-webpack-plugin` 生成 Gzip 或 Brotli 压缩文件。
- **Tree-shaking**：打包过程中，把没有用到的代码剔除，也是为了减少文件大小
- **Cache**：使用缓存，减少跟服务端的通信，从而提高性能
	- [[01-frontend/network/net-cache\|net-cache]]
- [**Lazy Loading 和 Preloading**](https://juejin.cn/post/7156891337004941343?from=search-suggest)：减少第一时间的 HTTP 请求次数，提高首页加载的性能
- **Service Worker**：减少跟服务端的通信，从而提高性能
- **使用多个域名**：==现在浏览器对同一个域名的 TCP 连接个数有限制，一般是 6 - 8 个，那么可以把不同的静态资源放在不同的域名下，提升并发连接上限==
- **引入雪碧图**：将多张小图合并成一张大图，通过css背景定位技术控制显示，这样可以将多个请求合并成一个请求，但是带来了新的问题，当某张小图片更新了，那么需要重新请求大图片，浪费了大量的网络带宽
- **将小图内联**：将图片的二进制数据通过 base64 编码后，把编码数据嵌入到 HTML 或 CSS 文件中，以此来减少网络请求次数
ID: 1720001581472

#### ANKI-HTTP/2 新特性
**说出高亮名称即可**
HTTP/2 专注于性能，最大的目标是在用户和网站间只用一个 TCP 连接。
1.==二进制传输==：在应用层(HTTP/2)和传输层(TCP or UDP)之间增加一个二进制分帧层。![Pasted image 20240703175510.png](/img/user/attachments/Pasted%20image%2020240703175510.png)
	+ 在二进制分帧层中， HTTP/2 会将所有传输的信息分割为更小的消息和帧（frame），并对它们采用二进制格式的编码，其中 HTTP1.x 的首部信息会被封装到 HEADERS 帧，而相应的 Request Body 则封装到 DATA 帧里面，HTTP/2 数据分帧后，“Header+Body”的报文结构就完全消失了，协议看到的只是一个个”碎片”。![Pasted image 20240930105817.png](/img/user/attachments/Pasted%20image%2020240930105817.png)
	+ 帧长度：表示的是数据帧的长度。
	+  帧类型：表示这个帧是数据帧还是控制帧。
	+ 标志位：用于携带简单的控制信息，例如通过标志位来表示流的优先级
	+ 流标识符：用来表示这个帧属于哪个流的，接收方可以根据这个信息从乱序的帧里面找到相同流id的帧，从而有序的组装信息。
	+ 数据帧：存放的时经过HPACK算法压缩后的HTTP头部和数据体
2. ==Header 压缩（HPACK）==
	+ HTTP 协议不带有状态，每次请求都必须附上所有信息。所以，请求的很多字段都是重复的，比如Cookie和User Agent，一模一样的内容，每次请求都必须附带，这会浪费很多带宽，也影响速度。HTTP/2 对这一点做了优化，引入了头信息压缩机制（header compression）。一方面，==头信息使用 gzip 或 compress 压缩后再发送==；另一方面，客户端和服务器同时维护一张头信息表，所有字段都会存入这个表，生成一个==索引号==，以后就不发送同样字段了，只发送索引号，这样就提高速度了。![Pasted image 20240930110053.png](/img/user/attachments/Pasted%20image%2020240930110053.png)
3. ==多路复用（Multiplexing）==
	1. 多路复用，就是在一个 TCP 连接中可以存在多条流。换句话说，也就是可以发送多个请求，对端可以通过帧中的标识知道属于哪个请求，这样就不需要等到前一个请求返回以后，才能发送下一个请求。
	2. HTTP/2 中，同域名下所有通信都在单个连接上完成，该连接可以承载任意数量的双向数据流。每个数据流都以消息的形式发送，而消息又由一个或多个帧组成。多个帧之间可以乱序发送，根据帧首部的流标识可以重新组装![Pasted image 20240703175650.png](/img/user/attachments/Pasted%20image%2020240703175650.png)
4. ==服务端推送==：HTTP/2 允许服务器未经请求，主动向客户端发送资源
	1. 常见场景是客户端请求一个网页，这个网页里面包含很多静态资源。正常情况下，客户端必须收到网页后，解析 HTML 源码，发现有静态资源，再发出静态资源请求。其实，服务器可以预期到客户端请求网页后，很可能会再请求静态资源，所以就主动把这些静态资源随着网页一起发给客户端了。
ID: 1720001581477
