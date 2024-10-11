---
{"dg-publish":true,"permalink":"/04-algo/skill-gcd-and-lcm/","title":"最小公倍数，最大公约数","tags":["algo","gcd","lcm"],"created":"2024-09-18T14:20:21.182+08:00","updated":"2024-09-17T19:14:48.000+08:00"}
---

#### ANKI-最大公约数
[最大公约数](https://zh.wikipedia.org/wiki/%E6%9C%80%E5%A4%A7%E5%85%AC%E7%BA%A6%E6%95%B0)（**GCD**）是指两个或多个整数中能够整除每个整数的最大正整数。
两个数的最大公约数可以通过使用**辗转相除法**来计算。辗转相除法是指用较大的数除以较小的数，然后用余数再去除较小的数，直到余数为0为止。最后的除数就是最大公约数。
```js
const gcd = (a, b) => (!b ? a : gcd(b, a % b));
gcd(12, 8); // 4
```
相关题目:
+ [[04-algo/1071.Greatest-common Divisor of Strings\|1071.Greatest-common Divisor of Strings]]
ID: 1726571632700
