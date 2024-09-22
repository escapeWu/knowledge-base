---
{"dg-publish":true,"permalink":"/04-algo/238-product-of-array-except-self/","title":"除自身以外数组的乘积","tags":["algo","array","prefix-sum"],"created":"2024-09-21T23:37:39.104+08:00","updated":"2024-09-21T23:57:51.130+08:00"}
---

#### ANKI-除自身以外数组的乘积
[leetcode-238](https://leetcode.cn/problems/product-of-array-except-self/description/?envType=study-plan-v2&envId=leetcode-75)
Given an integer array `nums`, return _an array_ `answer` _such that_ `answer[i]` _is equal to the product of all the elements of_ `nums` _except_ `nums[i]`.
The product of any prefix or suffix of `nums` is **guaranteed** to fit in a **32-bit** integer.
You must write an algorithm that runs in `O(n)` time and without using the division operation.
**Example 1:**
**Input:** nums = [1,2,3,4]
**Output:** [24,12,8,6]
**Example 2:**
**Input:** nums = [-1,1,0,-3,3]
**Output:** [0,0,9,0,0]
// 
[prefix-sum](https://leetcode.cn/problem-list/prefix-sum/)的题目，如果使用暴力破解，复杂度一般为 $O(n^2)$，此类题目，需要提前计算结果，来降低时间复杂度。
解题要点：
+ `nums[i]` = 左侧的乘积和 + 右侧的乘积和
+ 构建左侧乘积和数组，构建右侧乘积和数组
ID: 1726934271071
