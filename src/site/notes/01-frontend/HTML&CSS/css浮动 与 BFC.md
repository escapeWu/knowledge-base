---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/css-bfc/","created":"2024-10-23T13:19:52.000+08:00","updated":"2024-10-23T13:19:52.000+08:00"}
---

#### ANKI-浮动问题与BFC
一个没有形成 BFC 的例子：
```html
<div>	<!-- 没有设置 height -->  
    <p></p>  
    <p></p>  
</div>
```
如果一个父元素（例子中的 `div` 标签）不设置 `height`，==而内部的子元素都为 `float` 时，就无法撑起自身：==
![Pasted image 20240919144534.png](/img/user/attachments/Pasted%20image%2020240919144534.png)
由于BFC内部的float 元素也参与高度计算，所以，我们将父元素设置为BFC即可解决上述问题：
![Pasted image 20240919144519.png](/img/user/attachments/Pasted%20image%2020240919144519.png)
ID: 1726728494057



#### ANKI-清除浮动与BFC
```html
<div>
    <p></p>
    <p></p>
</div>
<div>	
    <p></p>
    <p></p>
</div>
p 标签设置了 float
```
原因就在于 `div` 没有形成 BFC，导致子元素无法形成两行：![Pasted image 20240919152614.png](/img/user/attachments/Pasted%20image%2020240919152614.png)
将父元素 div 设置为 BFC 即可解决问题
![Pasted image 20240919152649.png](/img/user/attachments/Pasted%20image%2020240919152649.png)
ID: 1726730893809
