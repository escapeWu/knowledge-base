---
{"dg-publish":true,"permalink":"/01-frontend/react/core-react/use-callback-use-memo-react-memo/","title":"useMemo与React.memo","tags":["react","frontend","hook"],"created":"2024-11-25T16:43:59.679+08:00","updated":"2024-12-02T14:59:19.092+08:00"}
---

#### ANKI-useMemo 和 React Memo的区别
**React.memo() 是一个高阶组件 (HOC)**
	它接收一个组件 A 作为参数并返回一个组件 B，如果组件 B 的 props（或其中的值）没有改变，则组件 B 会阻止组件 A 重新渲染 。
**useMemo() 是一个 React Hook。**
	可以依赖 useMemo() 作为性能优化，而不是语义保证。函数内部引用的每个值也应该出现在依赖项数组中
ID: 1732525982375


#### ANKI-useMemo 和 useCallback的 使用场景介绍？
React 中当组件的 props 或 state 变化时，会重新渲染，实际开发会遇到不必要的渲染场景
点击父组件count，触发重新渲染
+ ==Child1重新渲染：因为生成新的onClick，Child1 监测到props发生变化，触发重新渲染==
+ ==Child2重新渲染：因为生成新的childObj, 因为：child2 检测到props发生变化，触发重新渲染==
```jsx
export const Parent = () => {
  const [count, setCount] = useState(0);
  const [name, setName] = useState("小明");
  const increment = () => setCount(count + 1);
  const onClick = (name: string) => {
    setName(name);
  };
  const childObj = {a:1, b:2}
  return (
    <div>
      <button onClick={increment}>点击次数：{count}</button>
      <Child1 name={name} onClick={onClick} />
      <Child2 childObj={childObj} />
    </div>
  );
};
```
解决方案：
+ 对于child1，使用useCallback ，对于相同依赖（可选），不会重复生成新的函数。
+ 对于child2，使用useMemo，对于相同依赖（可选），不会生成新的对象。
ID: 1732525982378

#### ANKI-useCallback 和 useMemo 是否支持异步函数
先说结论:
	useMemo没办法直接使用，useCallback 可以直接使用。
==useMemo== 需要自己封装hook，实现异步函数结果的缓存。
```jsx
function useAsyncMemo(asyncFunction, dependencies) {
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      try {
        const res = await asyncFunction();
        setResult(res);
      } catch (err) {
        setError(err);
      } finally {
        setLoading(false);
      }
    };
    fetchData();
  }, dependencies);
  return [result, loading, error];
}
// 父组件使用
function ExampleComponent() {
  const [result, loading, error] = useAsyncMemo(fetchData, []);
  if (loading) {
    return <p>Loading...</p>; // 数据加载中
  }
  if (error) {
    return <p style={{ color: 'red' }}>Error: {error.message}</p>; // 显示错误信息
  }
  return <p>Result: {result}</p>; // 成功时显示结果
}
```
useCallback 直接标记传入的函数为async即可
```jsx
const memoizedAsyncCallback = useCallback(async () => {
  await someAsyncFunction();
  // 其他操作
}, []);
```
- 当使用`useCallback`包裹异步回调函数时，要注意依赖项数组的设置。如果异步函数内部引用了外部变量，这些变量应该被正确地包含在依赖项数组中，否则可能会导致闭包问题或者使用过期的变量值。[[01-frontend/React/Core React/React Hook closure Trap\|React Hook closure Trap]]
ID: 1732590243192
