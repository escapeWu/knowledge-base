---
{"dg-publish":true,"permalink":"/01-frontend/react/core-react/react-basic/","title":"react basic","tags":["react","frontend"],"created":"2024-11-07T15:47:26.866+08:00","updated":"2024-12-02T14:58:44.134+08:00"}
---

#### ANKI-在React的JSX中,属性是否可以被覆盖?覆盖的原则是什么?
在React的JSX中,当同一个属性被多次定义时,属性会被覆盖。覆盖的原则是:遇到相同的属性时,后定义的属性会覆盖之前定义的属性。
ID: 1731291082787


#### ANKI-React中什么是 pure components？
pure components（下面称为纯组件）的定义：对于相同的state 和 props，渲染的结果永远相同。
通过 React.memo 可以将组件变为 纯组件。这个api（React.memo）通过**比较新旧props**是否一直来避免不必要的重新渲染。
ID: 1731291082789

#### ANKI-React 中什么是合成事件？
**SyntheticEvent** 是对浏览器原生事件的跨浏览器封装。它的 API 与浏览器的原生事件相同，包括 stopPropagation() 和 preventDefault() 方法，且事件在所有浏览器中表现一致。可以通过 nativeEvent 属性从合成事件中直接访问原生事件。
```js
function BookStore() {
  function handleTitleChange(e) {
    console.log("The new title is:", e.target.value);
    // 'e' represents synthetic event
    const nativeEvent = e.nativeEvent;
    console.log(nativeEvent);
    e.stopPropagation();
    e.preventDefault();
  }
  return <input name="title" onChange={handleTitleChange} />;
}
```
ID: 1731291082790

#### ANKI-React Portals 是什么？
有时需要将组件的 DOM 节点放置在完全不同的位置（如全局的 body，比如Modal和Dialog用到），这就是 Portals 的用武之地。
```js
ReactDOM.createPortal(child, container);
```
+ child 要渲染的内容
+ container：目标元素DOM
```jsx
import React from 'react';
import ReactDOM from 'react-dom';
//
const portalRoot = document.getElementById('portal-root');
//
function Modal({ children }) {
    return ReactDOM.createPortal(
        <div className="modal">
            {children}
        </div>,
        portalRoot
    );
}
//
function App() {
    return (
        <div>
            <h1>App Component</h1>
            <Modal>
                <h2>I am inside a portal!</h2>
            </Modal>
        </div>
    );
}
export default App;
// HTML 文件
<div id="root"></div>
<div id="portal-root"></div>
```
在这个例子中，`<h2>` 元素被渲染到了 `#portal-root`，而不是默认的 React `#root`。
ID: 1731999993216
