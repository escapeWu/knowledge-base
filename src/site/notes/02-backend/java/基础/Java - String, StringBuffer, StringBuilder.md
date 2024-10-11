---
{"dg-publish":true,"permalink":"/02-backend/java//java-string-string-buffer-string-builder/","title":"java中 String, StringBuffer, StringBuilder 的区别？","created":"2024-09-21T23:58:36.973+08:00","updated":"2024-09-21T23:57:51.000+08:00"}
---

#### ANKI-java中 String, StringBuffer, StringBuilder 的区别？
都是处理字符串的类，区别主要体现在可变性，线程安全性和性能上。
+ String
	+ 不可变，每次对String 进行修改操作（拼接，截取），都会创建新的String 对象
	+ 适合场景：少量的拼接操作或字符串常量
+ StringBuffer：
	+ 可变：可对字符串追加，删除，插入
	+ 线程安全： StringBuffer 内部使用synchroized 关键字来保证多线程环境下的安全性
	+ 适合场景：多线程频繁修改字符串
+ StringBuilder
	+ 可变
	+ 非线程安全
	+ 使用场景：单线程下大量修改字符串
在Java8及以后,编译器会对==字符串的常量==拼接做优化,将字符将串拼==接转换为StringBuilder==操作。这种优化提高了代码性能
ID: 1726934271075

