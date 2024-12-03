---
{"dg-publish":true,"permalink":"/01-frontend/react/next-js-docs/data-fetching/get-static-props/","title":"使用getStaticProps 和 getStaticPaths 优化页面访问","tags":["nextjs","react"],"created":"2024-11-22T11:20:52.983+08:00","updated":"2024-11-25T13:55:37.315+08:00"}
---

#### ANKI-介绍下getStaticProps 
+ getStaticProps 是一个异步函数， 只能用于Page 页面，返回值会自动传递到Page 的props中。
+ 如果Page 页面使用了它，那么nextjs 会在 构建阶段（npm run build）调用getStaticProps 预渲染这个页面。
getStaticProps 的触发时机
+ next build 执行构建
+ 设置了 `fallback: true`，会在后台自动执行
+ 设置了 fallback: blocking，会在初次渲染前触发
+ 设置了 revalidate,会在后台自动执行
+ 执行了 revalidate（）立即触发
一个设置了fallback: true ，并且每隔1s强制更新页面的例子：
```js
import { useRouter } from 'next/router'
 
function Post({ post }) {
  const router = useRouter()
  // 如果这个页面没有被预渲染过，会渲染下面loading...代码
  if (router.isFallback) {
    return <div>Loading...</div>
  }
  // Render post...
}
// 这个函数在构建时候调用，生成需要预渲染的path
export async function getStaticPaths() {
  return {
    // Only `/posts/1` and `/posts/2` are generated at build time
    paths: [{ params: { id: '1' } }, { params: { id: '2' } }],
    // Enable statically generating additional pages
    // For example: `/posts/3`
    fallback: true,
  }
}
// 生成预渲染页面需要调用的props
export async function getStaticProps({ params }) {
  // params contains the post `id`.
  // If the route is like /posts/1, then params.id is 1
  const res = await fetch(`https://.../posts/${params.id}`)
  const post = await res.json()
  // 
  return {
    props: { post },
    // 如果客户端请求了，最多每秒渲染一次
    revalidate: 1,
  }
}
export default Post
```
ID: 1732514137274



#### ANKI-getStaticProps fallback 的不同选项的区别？
首先了解下paths 关键字：
paths 关键字决定了哪些路径应该被预渲染。假设你有动态路由 `pages/posts/[id].js`，设置规则如下：
```js
return {
  paths: [
    { params: { id: '1' }},
    {
      params: { id: '2' },
      // with i18n configured the locale for the path can be returned as well
      locale: "en",
    },
  ],
  fallback: ...
}
```
Nextjs 将会在build 阶段预渲染出 /posts/1 和 /posts/2 。
fallback 控制当访问的路径未在 paths 中时的行为，具体如下：
+ fallback: false
	+ 只预渲染 paths 中指定的路径。
	- 访问未在 paths 中的路径将返回 404 页面。
- fallback: blocking
	- 对于未预渲染的路径，首次访问时请求会被阻塞，直到页面生成完毕后再返回完整的页面。
- fallback: true
	- 对于未预渲染的路径，首次请求，如果访问的主体是
		- 爬虫：进入 fallback: blocking 模式
		- 普通用户：展示为loading（加载同fallback: blocking 模式），加载完成后，渲染具体页面。
ID: 1732514137279



