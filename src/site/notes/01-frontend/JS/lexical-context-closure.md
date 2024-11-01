---
{"dg-publish":true,"permalink":"/01-frontend/js/lexical-context-closure/","title":"javascript 从词法环境角度来解释执行上下文，this指向，以及闭包.","tags":["js","basic"],"created":"2024-09-18T14:20:16.919+08:00","updated":"2024-09-30T10:50:34.207+08:00"}
---

原博文地址：[Li Mei](https://limeii.github.io/#blog)
完整笔记
![Pasted image 20240620173247.png](/img/user/Pasted%20image%2020240620173247.png)
#### ANKI-什么是词法环境?
在v8引擎里JS的编译过程：
1. 分词/词法分析（tokenizing/lexing） 
2. token -> AST 抽象
3. 生成cpu执行的机器码
词法环境就是第一步中执行，==它用来登记变量声明、函数声明、函数声明的形参，后续代码执行的时候就知道去哪里拿变量的值和函数了，这个登记的地方就是`Lexical Environment（词法环境）`==
![Pasted image 20240612111319.png](/img/user/Pasted%20image%2020240612111319.png)
==词法环境由 envRecord: 环境记录，outer: 对外词法引用 构成== 
ID: 1718165561782

#### ANKI-变量提升&函数提升
以如下代码为例：
```javascript
var c;
function functionDec() {
    console.log(c)
    c = 30;
}
functionDec();
```
在词法分析的时候：
对于变量声明var c
    1. 给变量分配内存并初始化为undefined，
    2. 赋值语句是在第三步生成机器码真正执行代码的时候才执行。
对于函数声明function functionDec(){...}，
    1. 会在内存里创建函数对象
    2. 直接初始化为该函数对象。
![Pasted image 20240612112035.png](/img/user/Pasted%20image%2020240612112035.png)
ID: 1718165561784


#### ANKI-什么是作用域链？
每个词法环境都有一个outer指向上一层的词法环境，==沿着(outer一层一层)词法环境找变量的值就是作用域链。==
当运行上面代码，函数bar的词法环境里没有变量a，所以就会到它的上一层词法环境（foo函数词法环境）里去找，
foo函数词法环境里也没有变量a，就接着去foo函数词法环境的上一层（全局词法环境）去找，在全局词法环境里var a=2，
![Pasted image 20240612112854.png](/img/user/Pasted%20image%2020240612112854.png)
ID: 1718165561786

#### ANKI-什么是执行上下文？
首先得提到词法环境是什么（参考文首）。
**类型**：
+ 全局执行上下文
+ 函数执行上下文
+ Eval 执行上下文
==构成==：
+ 两个词法环境
	+ **变量环境组件VariableEnvironment**
	+ **词法环境组件（LexicalEnvironment）**
+ this binding
有人会将 两个词法环境拆解为具体表现组件：
+ **变量对象**：包含了函数的所有形参，内部变量和函数声明
+ **作用域链**：用来解析变量，包含当前上下文的变量对象以及所有父级上下文的变量对象
==**为什么需要两个词法环境？**==
**变量环境组件VariableEnvironment**: 是用来登记`var` `function`变量声明，
**词法环境组件（LexicalEnvironment）**:  是用来登记`let` `const` `class`等变量声明，ES6之后补充。
在ES6之前都没有块级作用域，ES6之后我们可以用`let` `const`来声明块级作用域，有这两个词法环境是==为了实现块级作用域的同时不影响`var`变量声明和函数声明==
ID: 1718165561788


#### ANKI-执行上下文，词法环境与执行栈的关系？
==词法环境是执行上下文的组成部分，在代码执行的时候，执行上下文会被压入执行栈中，按照先进后出的原则执行==，具体如下：
JS引擎是按照可执行代码来执行代码的，每次执行步骤如下
1：创建一个新的执行上下文（Execution Context）
2：创建一个新的词法环境（Lexical Environment）
3：把LexicalEnvironment和VariableEnvironment指向新创建的词法环境
4：把这个==执行上下文压入执行栈==并成为正在运行的执行上下文
5：执行代码
6：执行结束后，把这个执行上下文弹出执行栈
```javascript
var a;
function foo() {
    a = "hi, i am foo";
    console.log(a);
}
function baz() {
    foo();
}
baz();
```
前面的代码在执行完1-4步以后，整个环境看起来是这样的：
![Pasted image 20240612113521.png](/img/user/Pasted%20image%2020240612113521.png)
> 可执行代码（Executable Code）
> global code：整个js文件。
> function code：函数代码。
> module：模块代码
> eval code：放在eval的代码。 
ID: 1718165561790


#### ANKI-什么是闭包
```javascript
function foo() {
    var a = 2;
    function bar() {
        console.log(a);
    }
    return bar;
}
var baz = foo();
baz();
```
正常情况下，在方法foo执行完以后，foo的执行上下文被弹出执行栈，它的词法环境链路也就失联了。我们知道每个方法在执行的时候都会创建一个新的执行上下文，同时也会创建它们自己的词法环境，每个方法的词法环境里有一个`scope`会保存（指向）它上一层的词法环境。 那么foo方法执行完以后返回bar，==这个bar的scope里还保留着整个foo方法的词法环境==，那么在执行`baz()`的时候也就是==执行`bar()`==，这样就可以==访问失联的`foo方法的词法作用域`==，也就是可以拿到变量`a`的值。
//
**闭包**就是指：执行完的`执行上下文`被弹出执行栈，它的词法环境处于失联状态，后续的执行上下文没办法直接访问这个失联的词法环境。在这种情况下还保留了对那个词法环境的`引用`，从而可以通过这个`引用`去访问失联的词法环境，这个`引用`就是闭包。
ID: 1718165561793
