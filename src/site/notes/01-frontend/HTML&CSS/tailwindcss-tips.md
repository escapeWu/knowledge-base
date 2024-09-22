---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/tailwindcss-tips/","created":"2024-06-17T10:25:14.421+08:00","updated":"2024-06-17T10:24:15.000+08:00"}
---


#### ANKI-tailwindcss中class：hidden + md:flex 作用解释
```
<span className="hidden ml-2 md:flex">GitHub</span>
```
1. 在小屏幕(视口宽度小于 768px)下,`<span>GitHub</span>` 会被隐藏。
2. 在中等和大屏幕(视口宽度大于等于 768px)下,`<span>GitHub</span>` 会显示为 flex 布局,并且左边距为 `ml-2` 设置的值。
ID: 1717234530440

#### ANKI-如何控制在大屏下显示 `deploy to vercel`，窄屏显示 `deploy`
```html
<IconVercel className="mr-2" />
<span className="hidden sm:block">Deploy to Vercel</span>
<span className="sm:hidden">Deploy</span>
```
解释：
+ hidden sm:block ：默认隐藏，当屏幕尺寸大于等于窄屏，显示为block（显示 Deploy to Vercel）
+ sm:hidden：当屏幕大于等于窄屏，隐藏 （当为窄屏，不工作，显示Deploy）
ID: 1717234862007

