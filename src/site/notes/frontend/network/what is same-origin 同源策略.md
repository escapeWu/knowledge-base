---
{"dg-publish":true,"permalink":"/frontend/network/what-is-same-origin/","created":"2024-04-03T10:25:54.000+08:00","updated":"2024-04-03T10:25:54.000+08:00"}
---

**同源策略**：协议相同，域名相同，端口相同
> 阮一峰：[浏览器同源政策及其规避方法](https://www.ruanyifeng.com/blog/2016/04/same-origin-policy.html)

- `http://www.example.com/dir2/other.html`：同源
- `http://example.com/dir/other.html`：不同源（域名不同）
- `http://v2.www.example.com/dir/other.html`：不同源（域名不同）
- `http://www.example.com:81/dir/other.html`：不同源（端口不同）

