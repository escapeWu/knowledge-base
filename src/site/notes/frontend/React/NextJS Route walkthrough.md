---
{"dg-publish":true,"permalink":"/frontend/react/next-js-route-walkthrough/","created":"2024-04-28T10:56:06.305+08:00","updated":"2024-05-08T17:15:05.311+08:00"}
---

## 路由结构

![Pasted image 20240428105839.png](/img/user/attachments/Pasted%20image%2020240428105839.png)


+ Each folder represents a [**route** segment](https://nextjs.org/docs/app/building-your-application/routing#route-segments) that maps to a **URL** segment
+ A special [`page.js` file](https://nextjs.org/docs/app/building-your-application/routing/pages) is used to make route segments publicly accessible.
+ In this example, the `/dashboard/analytics` URL path is _not_ publicly accessible because ==it does not have a corresponding `page.js` file==.

## Layout
+ You can define a layout by default exporting a React component from a `layout.js` file
+  The component should accept a `children` prop that will be populated with a child layout (if it exists) or a page during rendering.
+ nesting layouts
	+ ![Pasted image 20240428110150.png](/img/user/attachments/Pasted%20image%2020240428110150.png)
+ - Only the root layout can contain `<html>` and `<body>` tags.
+ - When a `layout.js` and `page.js` file are defined in the same folder, the layout will wrap the page.
+ Layouts can fetch data.
+ Passing data between a parent layout and its children is not possible.
+ Layouts do not have access to `pathname` ([learn more](https://nextjs.org/docs/app/api-reference/file-conventions/layout))
## 导航&路由跳转
- Using the [`<Link>` Component](https://nextjs.org/docs/app/building-your-application/routing/linking-and-navigating#link-component)
- Using the [`useRouter` hook](https://nextjs.org/docs/app/building-your-application/routing/linking-and-navigating#userouter-hook) ([Client Components](https://nextjs.org/docs/app/building-your-application/rendering/client-components))
- Using the [`redirect` function](https://nextjs.org/docs/app/building-your-application/routing/linking-and-navigating#redirect-function) ([Server Components](https://nextjs.org/docs/app/building-your-application/rendering/server-components))
- Using the native [History API](https://nextjs.org/docs/app/building-your-application/routing/linking-and-navigating#using-the-native-history-api)

路由与导航的工作原理

+ On the server, your application code is automatically [code-split](https://nextjs.org/docs/app/building-your-application/routing/linking-and-navigating#1-code-splitting) by route segments
+ And on the client, Next.js [prefetches](https://nextjs.org/docs/app/building-your-application/routing/linking-and-navigating#2-prefetching) and [caches](https://nextjs.org/docs/app/building-your-application/routing/linking-and-navigating#3-caching) the route segments.
	+ Prefetching： preload a route in the background before the user visits it
		+ **`<Link>` component**: Routes are automatically prefetched as they become visible in the user's viewport.Prefetching happens when the ==page first loads== or when it ==comes into view through scrolling==.
		+ - **`router.prefetch()`**: The `useRouter` hook can be used to prefetch routes programmatically.
		+ - Prefetching is not enabled in development, ==only in production==.
	+ Caching:  **in-memory client-side cache**
		+ as users navigate around the app, the React Server Component Payload of [prefetched](https://nextjs.org/docs/app/building-your-application/routing/linking-and-navigating#2-prefetching) route segments and visited routes are==stored in the cache==
+ [Partial Rendering](https://nextjs.org/docs/app/building-your-application/routing/linking-and-navigating#4-partial-rendering)
	+ ![Pasted image 20240428132001.png](/img/user/attachments/Pasted%20image%2020240428132001.png)
	+ the shared `dashboard` layout will be preserved. when navigating between two sibling routes
## 错误处理(TODO)
![Pasted image 20240428132453.png](/img/user/attachments/Pasted%20image%2020240428132453.png)

```ts
'use client' // Error components must be Client Components
 
import { useEffect } from 'react'
 
export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  useEffect(() => {
    // Log the error to an error reporting service
    console.error(error)
  }, [error])
 
  return (
    <div>
      <h2>Something went wrong!</h2>
      <button
        onClick={
          // Attempt to recover by trying to re-render the segment
          () => reset()
        }
      >
        Try again
      </button>
    </div>
  )
}
```

## Loading 状态展示
+ The special file `loading.js` helps you create meaningful Loading UI with [React Suspense](https://react.dev/reference/react/Suspense).
 + With this convention, you can show an [instant loading state](https://nextjs.org/docs/app/building-your-application/routing/loading-ui-and-streaming#instant-loading-states) from the server while the content of a route segment loads.
 + ![Pasted image 20240428133130.png](/img/user/attachments/Pasted%20image%2020240428133130.png)
 + ![Pasted image 20240428133155.png](/img/user/attachments/Pasted%20image%2020240428133155.png)
+ `loading.js` will be nested inside `layout.js`
+ ![Pasted image 20240428133242.png](/img/user/attachments/Pasted%20image%2020240428133242.png)
## [What is Streaming?](https://nextjs.org/docs/app/building-your-application/routing/loading-ui-and-streaming#what-is-streaming)
To learn how Streaming works in React and Next.js, it's helpful to understand **Server-Side Rendering (SSR)** and its limitations.
With SSR, there's a series of steps that need to be completed before a user can see and interact with a page:
1. First, ==all data== for a given page is ==fetched on the server==.
2. The ==server then renders== the HTML for the page
3. The HTML, CSS, and JavaScript for the page are sent to the client
4. ==A non-interactive== user interface is shown using the generated ==HTML, and CSS==.
5. Finally, React [hydrates](https://react.dev/reference/react-dom/client/hydrateRoot#hydrating-server-rendered-html) the user interface to ==make it interactive.==
![Pasted image 20240428133728.png](/img/user/attachments/Pasted%20image%2020240428133728.png)
SSR with React and Next.js helps i==mprove the perceived loading performance== by showing a non-interactive page to the user as soon as possible.

However, it can still be ==slow as all data fetching on server== needs to be ==completed before the page== can be shown to the user.
![Pasted image 20240428134447.png](/img/user/attachments/Pasted%20image%2020240428134447.png)
==**Streaming** allows you to break down the page's HTML into smaller chunks== and progressively send those chunks from the server to the client.
![Pasted image 20240428134441.png](/img/user/attachments/Pasted%20image%2020240428134441.png)

![Pasted image 20240428134636.png](/img/user/attachments/Pasted%20image%2020240428134636.png)Streaming is particularly beneficial when you want to prevent long data requests from blocking the page from rendering as it can reduce the [Time To First Byte (TTFB)](https://web.dev/ttfb/) and [First Contentful Paint (FCP)](https://web.dev/first-contentful-paint/). It also helps improve [Time to Interactive (TTI)](https://developer.chrome.com/en/docs/lighthouse/performance/interactive/), especially on slower devices.

### [Example](https://nextjs.org/docs/app/building-your-application/routing/loading-ui-and-streaming#example)

`<Suspense>` works by wrapping a component that performs an asynchronous action (e.g. fetch data), showing fallback UI (e.g. skeleton, spinner) while it's happening, and then swapping in your component once the action completes.

```ts
import { Suspense } from 'react'
import { PostFeed, Weather } from './Components'
 
export default function Posts() {
  return (
    <section>
      <Suspense fallback={<p>Loading feed...</p>}>
        <PostFeed />
      </Suspense>
      <Suspense fallback={<p>Loading weather...</p>}>
        <Weather />
      </Suspense>
    </section>
  )
}
```
By using Suspense, you get the benefits of:

1. **Streaming Server Rendering** - Progressively rendering HTML from the server to the client.
2. **Selective Hydration** - React prioritizes what components to make interactive first based on user interaction.

## Route Groups

A route group can be created by wrapping a folder's name in parenthesis: `(folderName)`

![Pasted image 20240428135348.png](/img/user/attachments/Pasted%20image%2020240428135348.png)you can create a different layout for each group by adding a `layout.js` file inside their folders.
![Pasted image 20240428135434.png](/img/user/attachments/Pasted%20image%2020240428135434.png)

## 文件管理
a route is **not publicly accessible** until a `page.js` or `route.js` file is added to a route segment.
This means that **project files** can be **safely colocated** inside route segments in the `app` directory without accidentally being routable.
![Pasted image 20240428135543.png](/img/user/attachments/Pasted%20image%2020240428135543.png)### [Private Folders](https://nextjs.org/docs/app/building-your-application/routing/colocation#private-folders)
Private folders can be created by prefixing a folder with an underscore: `_folderName`
![Pasted image 20240428135719.png](/img/user/attachments/Pasted%20image%2020240428135719.png)### [Module Path Aliases](https://nextjs.org/docs/app/building-your-application/routing/colocation#module-path-aliases)
```ts
// before
import { Button } from '../../../components/button'
 
// after
import { Button } from '@/components/button'
```

###  文件组织
+ [Store project files in top-level folders inside of `app`](https://nextjs.org/docs/app/building-your-application/routing/colocation#store-project-files-in-top-level-folders-inside-of-app)
	+ ![Pasted image 20240428135956.png](/img/user/attachments/Pasted%20image%2020240428135956.png)
+ [Split project files by feature or route](https://nextjs.org/docs/app/building-your-application/routing/colocation#split-project-files-by-feature-or-route)
	+ ![Pasted image 20240428135934.png](/img/user/attachments/Pasted%20image%2020240428135934.png)

### 动态路由
`app/blog/[slug]/page.js`

#### [Catch-all Segments](https://nextjs.org/docs/app/building-your-application/routing/dynamic-routes#catch-all-segments)
Dynamic Segments can be extended to **catch-all** subsequent segments by adding an ellipsis inside the brackets `[...folderName]`.

|Route|Example URL|`params`|
|---|---|---|
|`app/shop/[...slug]/page.js`|`/shop/a`|`{ slug: ['a'] }`|
|`app/shop/[...slug]/page.js`|`/shop/a/b`|`{ slug: ['a', 'b'] }`|
|`app/shop/[...slug]/page.js`|`/shop/a/b/c`|`{ slug: ['a', 'b', 'c'] }`|
#### [Optional Catch-all Segments](https://nextjs.org/docs/app/building-your-application/routing/dynamic-routes#optional-catch-all-segments)
Catch-all Segments can be made **optional** by including the parameter in double square brackets: `[[...folderName]]`.

==For example, `app/shop/[[...slug]]/page.js` will **also** match `/shop`==, in addition to `/shop/clothes`, `/shop/clothes/tops`, `/shop/clothes/tops/t-shirts`.

The difference between **catch-all** and **optional catch-all** segments is that with optional, the route without the parameter is also matched (`/shop` in the example above).