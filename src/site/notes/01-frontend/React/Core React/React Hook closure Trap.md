---
{"dg-publish":true,"permalink":"/01-frontend/react/core-react/react-hook-closure-trap/","title":"react hook使用闭包陷阱注意","tags":["react","hook","frontend"],"created":"2024-11-25T15:24:19.994+08:00","updated":"2024-12-02T14:58:52.470+08:00"}
---

#### ANKI-解释下为什么这段代码，useState 和 setTimeout 组合的区别
`setCount(count + 1)` 读取的是 handleClick 外部作用域的count，在1s内频繁触发多次，等于==排队执行了 setCount(0 + 1)多次==，所以count 没有正确更新。
![20241125153549_rec_.gif](/img/user/attachments/20241125153549_rec_.gif)
```jsx
function Counter() {
    const [count, setCount] = useState(0);
    const handleClick = () => {
      setTimeout(() => {
        setCount(count + 1);
      }, 1000);
    };
    const handleReset = () => {
      setCount(0);
    };
    return (
      <div>
        <p>Count: {count}</p>
        <button onClick={handleClick}>Increment</button>
        <button onClick={handleReset}>Reset</button>
      </div>
    );
}
```
`setCount(count => count + 1) `在1s内触发多次，使用的不是外部作用域的count，而是最新的count，排队执行多次，可以实现正确效果。
![20241125153945_rec_.gif](/img/user/attachments/20241125153945_rec_.gif)
```jsx
function Counter() {
    const [count, setCount] = useState(0);
    const handleClick = () => {
      setTimeout(() => {
        setCount(count => count + 1);
      }, 1000);
    };
    const handleReset = () => {
      setCount(0);
    };
    return (
      <div>
        <p>Count: {count}</p>
        <button onClick={handleClick}>Increment</button>
        <button onClick={handleReset}>Reset</button>
      </div>
    );
}
```
ID: 1732525982382

