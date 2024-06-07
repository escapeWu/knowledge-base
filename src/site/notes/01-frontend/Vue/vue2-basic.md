---
{"dg-publish":true,"permalink":"/01-frontend/vue/vue2-basic/","created":"2024-06-04T23:27:38.546+08:00","updated":"2024-06-04T10:17:25.000+08:00"}
---


#### ANKI-vue2 生命周期有哪些？
+ beforCreate
+ created
+ beforMount
+ mounted
+ beforUpdate
+ updated
+ beforDestory
+ destoryed
+ ==activated: keep-alive 缓存的组件激活时==
+ ==deactivated: keep-alive 缓存的组件停用时调用==
<!--ID: 1710296155862-->


#### ANKI-vue2 父子组件生命周期hook调用顺序
子组件先挂载，然后到父组件
父 beforeCreate->父 created->父 beforeMount->子 beforeCreate->子 created->子 beforeMount->子 mounted->父 mounted
Vue创建过程是一个递归过程，先创建父组件，有子组件就会创建子组件，因此创建时先有父组件再有子组件；
<!--ID: 1710296155867-->

#### ANKI-为什么不推荐v-if v-for 同时使用？
==vue2==
优先级：v-for > v-if。 
每次渲染都会先循环再进行条件判断, 带来性能方面的浪费
==vue3==
优先级： v-if > v-for。 
```html
<li 
	v-for="user in users" 
	v-if="user.isActive" 
	:key="user.id" > {{ user.name }} </li>
```
v-if 比 v-for 有更高的优先级，对于上述代码，==会抛出错误，因为v-if执行时候，user还不存在==，正确用法
```java
<template v-for="todo in todos">
  <li v-if="!todo.isComplete">
    {{ todo.name }}
  </li>
</template>
```
ID: 1717062426802


#### ANKI-为什么组件中的data属性是一个函数而不是对象
因为组件是vue实例。也就是说他是一个对象实例。如果直接写
```vue
Vue.component('component1',{
    template:`<div>组件</div>`,
    data:{
        foo:"foo"
    }
})
```
等价于在函数原型链上增加一个data属性
```js
function Component(){
 
}
Component.prototype.data = {
	count : 0
}
```
ID: 1717062426805


#### ANKI-vue3父子组件传参$attrs
[[01-frontend/Vue/vue2-basic\|vue2-basic]]
一个包含了组件所有透传 attributes 的对象。
- **详细信息**
    [透传 Attributes](https://cn.vuejs.org/guide/components/attrs.html) 是指由父组件传入，且没有被子组件声明为 props 或是组件自定义事件的 attributes 和事件处理函数。
    默认情况下，若是单一根节点组件，`$attrs` 中的所有属性都是直接自动继承自组件的根元素。而多根节点组件则不会如此，同时你也可以通过配置 [`inheritAttrs`](https://cn.vuejs.org/api/options-misc.html#inheritattrs) 选项来显式地关闭该行为。
ID: 1717062426807

