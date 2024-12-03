---
{"dg-publish":true,"permalink":"/01-frontend/react/core-react/react-component-commulucation/","title":"react 组件通信方式","tags":["react","frontend"],"created":"2024-11-25T16:38:02.574+08:00","updated":"2024-12-02T14:59:07.695+08:00"}
---

#### ANKI-react 中父组件调用子组件方式
+ 子组件使用 useImperativeHandle暴露特定函数
+ 父组件使用useRef 绑定在子组件，进行调用
```jsx
import React, { useRef } from 'react';
// 子组件
const Child = React.forwardRef((props, ref) => {
  const showMessage = () => {
    alert("子组件的方法被调用了！");
  };
  React.useImperativeHandle(ref, () => ({
    showMessage,
  }));
  return <div>这是子组件</div>;
});
// 父组件
const Parent = () => {
  const childRef = useRef();
  const handleClick = () => {
    if (childRef.current) {
      childRef.current.showMessage();
    }
  };
  return (
    <div>
      <h1>父组件</h1>
      <button onClick={handleClick}>调用子组件的方法</button>
      <Child ref={childRef} />
    </div>
  );
};
export default Parent;
```
ID: 1732525982379