---
{"dg-publish":true,"permalink":"/01-frontend/network/cdn-what-is-caching/","title":"什么是cdn？","created":"2024-09-18T14:20:18.291+08:00","updated":"2024-06-04T11:20:59.000+08:00"}
---

https://www.cloudflare-cn.com/learning/cdn/what-is-caching/

#### ANKI-什么是CDN
![Pasted image 20240604103443.png](/img/user/Pasted%20image%2020240604103443.png)
CDN（内容交付网络）将图像、视频或网页等内容缓存在比[源站服务器](https://www.cloudflare-cn.com/learning/cdn/glossary/origin-server/)更靠近最终用户的代理服务器中。（代理服务器是一种从[客户端](https://www.cloudflare-cn.com/learning/serverless/glossary/client-side-vs-server-side/)接收请求并将其传递给其他服务器的服务器。）由于这些服务器距离发出请求的用户较近，因此 CDN 能够更快地交付内容。
//
CDN 可以比作连锁杂货店：购物者不必前往可能数百英里远种植有粮食的农场，而是去当地的杂货店，尽管仍然需要走些路，但距离要近得多。由于杂货店储藏来自远方农场的食品，因此去杂货店购买只需花费几分钟而不是几天。同样，CDN 缓存可以“储藏”Internet 上显示的内容，让网页加载速度变得更快。
//
当用户向使用 CDN 的网站请求内容时，CDN 从源站服务器获取该内容，然后保存该内容的副本以便为将来的请求服务。只要有用户继续请求，缓存的内容就会保留在 CDN 缓存中。
ID: 1717469946243


#### ANKI-什么是 CDN 缓存命中？什么是缓存未命中？
[缓存命中](https://www.cloudflare-cn.com/learning/cdn/what-is-a-cache-hit-ratio/)是指当客户端设备向缓存发出内容请求时缓存中正好保存有该内容。当缓冲中没有所请求的内容时，就会发生缓存未命中。
//
缓存命中意味着内容将能够更快地加载，因为 CDN 可以立即将其交付给最终用户。在缓存未命中的情况下，CDN 服务器会将请求传递给源服务器，然后在源服务器响应后缓存内容，以便后续请求时产生缓存命中。
ID: 1717469946245


#### ANKI-CDN 缓存服务器位于何处？
CDN 缓存服务器位于全球各地的[数据中心](https://www.cloudflare-cn.com/learning/cdn/glossary/data-center/)中。Cloudflare 的 CDN 服务器遍布全球320 个城市，以尽可能缩短与访问内容的最终用户的距离。CDN 服务器所在的位置也称为数据中心。
ID: 1717469946248


#### ANKI-缓存的数据在 CDN 服务器中保留多久时间？
当网站用请求的内容响应 CDN 服务器时，它们也会附加内容的 TTL，让服务器知道要存储多长时间。TTL 存储在响应的 [HTTP](https://www.cloudflare-cn.com/learning/ddos/glossary/hypertext-transfer-protocol-http/) 标头中，它指定缓存内容的秒数、分钟数或小时数。当 TTL 到期时，缓存会删除内容。如果有一段时间没有请求内容，或者如果 CDN 客户手动清除某些内容，某些 CDN 也会提前从缓存中清除文件。
ID: 1717469946251


