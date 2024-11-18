---
{"dg-publish":true,"permalink":"/04-algo/121best-time-to-buy-and-sell-stock/","created":"2024-05-27T15:03:25.000+08:00","updated":"2024-05-27T15:03:25.000+08:00"}
---

121
**描述**
给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。


示例 1：
```
输入：[7,1,5,3,6,4]
输出：5
解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
```
示例 2：
```
输入：prices = [7,6,4,3,1]
输出：0
解释：在这种情况下, 没有交易完成, 所以最大利润为 0。
```

提示：
+ `1 <= prices.length <= 105`
+ `0 <= prices[i] <= 104`

**思路：**
O(n²)
```python
# 最暴力方式：嵌套for循环，算出每个价格
max_profit = 0
for buy_price, day in all_day_marks:
	for sell_price in future_day_marks:
		max_profit = max(max_profit, sell_price - buy_price)

# 时间复杂度
对于每个买入日期，内部的 `for` 循环会遍历所有未来的卖出日期。在最坏的情况下（即买入日期是数组的第一个元素），这个内部循环会执行 n-1 次。随着外部循环的进行，内部循环的迭代次数会逐渐减少到 1 次。

因此，时间复杂度的计算是一个等差数列的求和问题：

T(n) = (n-1) + (n-2) + ... + 2 + 1  
= sum of the first (n-1) natural numbers  
= (n-1) * (n) / 2  
= n^2/2 - n/2

对于大的 n 值，我们通常只考虑最高次项，因为它在 n 非常大的时候起主导作用，所以我们可以忽略掉系数和低次项。因此，该算法的时间复杂度可以简化为 O(n^2)。
```

O(n)
```python
# 依次遍历价格，
# 记录遇到的最小价格，默认为0
# current_price - min_price 就是最大利润

min_price = 0
max_profit = 0
for price in price_list:
	min_price = min(price, min_price)
	profit = max(max_profit, price - min_price)
```
