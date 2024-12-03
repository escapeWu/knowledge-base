---
{"dg-publish":true,"permalink":"/01-frontend/vue/vue-router/","title":"vueRouter 相关知识","tags":["vue","frontend"],"created":"2024-11-13T14:23:36.998+08:00","updated":"2024-12-02T15:05:04.383+08:00"}
---

#### ANKI-说下VueRouter 的核心概念？
1. 路由配置: VueRouter通过声明式的路由配置,将路径映射到组件
2. 导航守卫: 包括全局守卫、独享守卫、组件内守卫,提供了一系系列的生命周期钩子(activated/deactivated),可以在路由跳转前或后做一些逻辑处理。
3. 路由视图和路由链接: `<router-view>`组件用于显示与当前路经匹配的组件,`<router-link>`组件用于创建导航链接。
4. 动态路由匹配: 支持路径参数、动态路径匹配和嵌套路由。
5. 两种工作模式: history和hash
==在 Vue Router 中，全局守卫、独享守卫 和 组件内守卫 的区别主要体现在 应用范围 和 定义位置 上。==
**全局守卫**
定义：
全局守卫是作用于整个路由系统的导航守卫，它会在任意路由切换时触发。
类型：
	•	beforeEach：在每次导航前触发。
	•	beforeResolve：在所有组件内守卫和异步路由组件解析后触发（Vue Router 3.1+）。
	•	afterEach：导航完成后触发（无 next 参数）。
定义位置：
通常在路由实例化时定义。例如：
```js
const router = new VueRouter({ /* 路由配置 */ });
router.beforeEach((to, from, next) => {
  console.log('全局前置守卫');
  next(); // 允许导航
});
router.afterEach((to, from) => {
  console.log('全局后置守卫');
});
```
适用场景：
	•	权限控制：如验证用户登录状态或权限。
	•	全局加载动画：如在路由跳转时显示加载状态。
**独享守卫**
定义：
独享守卫是作用于某个特定路由的守卫，它仅对该路由的导航生效。
类型：
	•	beforeEnter：在路由配置中定义的导航守卫。
定义位置：
在路由配置中定义。例如：
```js
const routes = [
  {
    path: '/profile',
    component: Profile,
    beforeEnter: (to, from, next) => {
      console.log('独享守卫');
      if (to.meta.requiresAuth) {
        // 检查是否登录
        next(); // 放行
      } else {
        next('/login'); // 重定向
      }
    }
  }
];
```
适用场景：
	•	需要针对单个路由做特定处理，例如某些路由需要额外的权限验证。
**组件内守卫**
定义：
组件内守卫是直接定义在路由组件中的守卫，适用于和组件强相关的逻辑。
类型：
	•	beforeRouteEnter：组件实例还未创建时调用（不能直接访问 this，可通过回调访问）。
	•	beforeRouteUpdate：当前路由改变时（路由参数或查询变动，但仍渲染同一组件）。
	•	beforeRouteLeave：离开当前路由时调用。
定义位置：
在组件内定义。例如：
```js
export default {
  beforeRouteEnter(to, from, next) {
    console.log('组件内 beforeRouteEnter');
    next(vm => {
      // vm 是组件实例
      vm.initData();
    });
  },
  beforeRouteUpdate(to, from, next) {
    console.log('组件内 beforeRouteUpdate');
    next();
  },
  beforeRouteLeave(to, from, next) {
    console.log('组件内 beforeRouteLeave');
    next();
  }
};
```
适用场景：
	•	初始化数据：在组件加载前获取数据。
	•	防止未保存的数据丢失：在离开组件前提示用户保存数据。
ID: 1732514349571



#### ANKI-vue-router 如何添加 删除动态路由
使用addRoute，removeRoute方法。
```js
const router = new VueRouter({routes: [], ...});
router.addRoute({
	path: '/new-route',
	component: () => import('./components/NewComponents')
})
router.removeRoute('newRoute');
```
通常用来实现不同用户权限，动态菜单的功能。在beforEach hook中 具体操作如下：
+ 使用beforEach hook
	+ https://github.com/lyt-Top/vue-next-admin/blob/master/src/router/index.ts#L94
+ 调用后端加载路由
	+ https://github.com/lyt-Top/vue-next-admin/blob/master/src/router/index.ts#L115
+ 后端加载路由逻辑实现：
	+ https://github.com/lyt-Top/vue-next-admin/blob/master/src/router/backEnd.ts#L36
ID: 1731984080914

