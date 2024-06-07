---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/encode-uri-and-encode-uri-component/","created":"2024-05-30T22:52:49.344+08:00","updated":"2024-05-30T17:41:19.000+08:00"}
---

#### ANKI-encodeURI&encodeURIComponent的区别
==区别==
- `encodeURI` 保留 URI 结构中的特殊字符，只编码那些在 URI 中没有特殊意义的字符。
- `encodeURIComponent` 编码所有非字母数字字符，包括那些在 URI 中有特殊意义的字符。
==用途==
1. **`encodeURI`**:
    - 用于编码整个 URI，当你需要处理完整的 URL 时使用。
    - 例如，在将完整的 URL 传递给服务器之前进行编码。
2. **`encodeURIComponent`**:
    - 用于编码 URI 的组成部分，特别是查询参数或路径片段。
    - 例如，在拼接 URL 查询字符串时对每个参数进行编码。
ID: 1716996349484



