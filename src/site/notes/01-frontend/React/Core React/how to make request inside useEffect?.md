---
{"dg-publish":true,"permalink":"/01-frontend/react/core-react/how-to-make-request-inside-use-effect/","title":"如何在useEffect中 进行异步请求","tags":["react","frontend","hooks"],"created":"2024-11-25T15:54:59.540+08:00","updated":"2024-12-02T14:58:35.998+08:00"}
---

#### ANKI-如何让 useEffect 支持 async/await
```jsx
useEffect(() => {
  const fetchData = async () => {
    const result = await fetch('https://api.example.com/data');
    setData(await result.json());
  };
  fetchData();
}, []);
```
不能直接使用 `useEffect(async ()=>{ })` useEffect 不接受返回值为 promise类型。
ID: 1732525982381

