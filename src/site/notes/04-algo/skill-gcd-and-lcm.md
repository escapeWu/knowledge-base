---
{"dg-publish":true,"permalink":"/04-algo/skill-gcd-and-lcm/","title":"最小公倍数，最大公约数","tags":["algo","gcd","lcm"],"created":"2024-09-23T00:03:29.000+08:00","updated":"2024-09-23T00:03:29.000+08:00"}
---

#### ANKI-最大公约数
[最大公约数](https://zh.wikipedia.org/wiki/%E6%9C%80%E5%A4%A7%E5%85%AC%E7%BA%A6%E6%95%B0)（**GCD**）是指两个或多个整数中能够整除每个整数的最大正整数。
```js
const GCD = (a, b) => b ? GCD(b, a % b) : a;;
gcd(12, 8); // 4
```
辗转相除法![Pasted image 20240923000136.png](/img/user/attachments/Pasted%20image%2020240923000136.png)
相关题目:
+ [[04-algo/1071.Greatest-common Divisor of Strings\|1071.Greatest-common Divisor of Strings]]
ID: 1726571632700
