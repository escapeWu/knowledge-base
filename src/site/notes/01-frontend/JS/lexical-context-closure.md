---
{"dg-publish":true,"permalink":"/01-frontend/js/lexical-context-closure/","title":"javascript 从词法环境角度来解释执行上下文，this指向，以及闭包.","tags":["js","basic"],"created":"2024-06-12T11:06:57.589+08:00","updated":"2024-06-12T12:48:31.355+08:00"}
---

原博文地址：[Li Mei](https://limeii.github.io/#blog)
完整笔记

<div class="transclusion internal-embed is-loaded"><div class="markdown-embed">




==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠==


# Text Elements
在V8里JS的编译执行过程 
01: 
分词/词法分析(Tokenizing/Lexing) 
分词: 
var a = 2 ->  var a 2 ; 
四个token 
词法分析： 
02：Token -> AST 抽象语法树
     
登记变量声明、函数声明、函数声明的形参 
03：生成机器码 
登记的地方 
词法环境 
环境记录 
对外词法引用 
声明式环境记录
 
变量，常量，let class module import 及函数声明 
对象式环境记录 
主要用于with和global的词法环境。 
函数环境记录 
模块环境记录 
1. GlobalEnv 
2. fooEnv 
3. barEnv 
4. bazEnv 
outer：null 
envRecord: 
DeclarativeEnvironmentRecord: { 
x: 1, 
y: 5 
}, 

        ObjectEnvironmentRecord: {
            a: 2,
            foo:<< function>>,
            baz:<< function>>,
            isNaNl:<< function>>,
            isFinite: << function>>,
            parseInt: << function>>,
            parseFloat: << function>>,
            Array: << construct function>>,
            Object: << construct function>>
            ...
            ...
        } 
this指向 
声明式 
GlobalThisValue 
ObjectEnvironmentRecord[[BindingObject\|BindingObject]], 
outer：globalEnv 
envRecord: 
函数式环境记录 
thisValue: GlobalEnv
bar: <<function>> 
outer：fooEnv 
envRecord: 
函数式环境记录 
thisValue: GlobalEnv
 
DeclarativeEnvironmentRecord: { 
b:3 
}, 
声明式 
outer：Global 
envRecord: 
函数式环境记录 
thisValue: GlobalEnv
 
DeclarativeEnvironmentRecord: { 
a:10 
}, 
声明式 
作用域链：
 
每个词法环境都有一个outer指向上一层的词法环境，沿着outer一层一层词法环境找变量的值就是作用域链。

当运行上面代码，函数bar的词法环境里没有变量a，所以就会到它的上一层词法环境（foo函数词法环境）里去找，
foo函数词法环境里也没有变量a，就接着去foo函数词法环境的上一层（全局词法环境）去找，在全局词法环境里var a=2，
 
词法环境对这两个
特殊处理：
 
在词法分析的时候：

对于变量声明var a=2; let x=1;，
    1. 给变量分配内存并初始化为undefined，
    2. 赋值语句是在第三步生成机器码真正执行代码的时候才执行。

对于函数声明function foo(){...}，
    1. 会在内存里创建函数对象
    2. 直接初始化为该函数对象。 
var c;

function functionDec() {
    console.log(c)
    c = 30;
}

functionDec(); 
GlobalEnv:
 
outer: null 
环境记录：
    对象式环境记录： 
词法分析阶段： 
c: undefined
functionDec: <<function>> 
变量提升 
函数提升 
变量提升，函数提升 
蓝色区域就是， 
var a;
function foo() {
    a = "hi, i am foo";
    console.log(a);
}
function baz() {
    foo();
}
baz(); 
执行栈（Call Stack） 
执行上下文 
灰色的框是执行栈，执行栈遵循先进后出 
1. 在开始执行任何代码之前，都会创建全局上下文压入栈底。 
2. 创建词法环境，登记变量声明和函数声明。 
3. 引擎运行到baz()的时候，把baz执行上下文压入执行栈。 
baz调用foo，把foo执行上下文压入执行栈顶。 
foo调用console.log,把console.log执行上下文压入执行栈顶。 
console.log执行上下文是当前正在运行的执行上下文，在console执行完以后，console.log执行上下文被弹出执行栈。 
foo执行上下文是当前正在运行的执行上下文，在foo执行完以后，foo执行上下文被弹出执行栈。 
baz执行上下文是当前正在运行的执行上下文，在baz执行完以后，baz执行上下文被弹出执行栈。 
LexicalEnvironment：是一个词法环境(Lexical Environment)。 
VariableEnvironment：也是一个词法环境(Lexical Environment)，一般和LexicalEnvironment指向同一个词法环境。 
ThisBinding：这个就是代码里常用的this。 
执行上下文的构成： 
执行栈  可执行代码：
 
global code：整个js文件。 
function code：函数代码。 
module：模块代码 
eval code：放在eval的代码。 
每个function都会新创建一个词法环境，
function的词法环境中的scope，就是词法环境中的outer，
作用域链就是沿着outer往上一层的词法环境里找变量/方法 
执行到console.log 后 
变量环境组件（VariableEnvironment）是用来登记var function变量声明，
词法环境组件（LexicalEnvironment）是用来登记let const class等变量声明。 
执行第六步，foo baz执行完后被弹出执行栈，这两个function对象还在内存中，等待垃圾回收 
GlobalExecutionContext 
LexicalEnv
VariableEnv 
function foo() {
    var a = 2;

    function bar() {
        console.log(a);
    }

    bar();
}

foo() 
GlobalEnv
声明式环境记录
对象式环境记录：
    
    a: undefined 
This 
箭头函数中没有this绑定，this的值取决于其创建时所在词法环境链中最近的this绑定

非严格模式下，函数普通调用，this指向全局对象

严格模式下，函数普通调用，this为undefined

函数作为对象方法调用，this指向该对象

函数作为构造函数配合new调用，this指向构造出的新对象

非严格模式下，函数通过call、apply、bind等间接调用，this指向传入的第一个参数, 传入的第一个参数若为undefined或null，this指向全局对象

格模式下函数通过call、apply、bind等间接调用，this严格指向传入的第一个参数 
FooFunctionEnv
    FunctionEnvRecord:
        
outter 
foo: <<function>> 
scope:GlobalEnv 
bar:<<function>> 
FooFunctionEnv
    FunctionEnvRecord:
        
scope:FooFunctionEnv 
用于函数作用域。 
模块环境记录用于体现一个模块的外部作用域，即模块export所在环境。 
对象式环境记录，绑定对象为全局对象 

# Embedded files
80e7f99897ddb504976ab8310d4b183fdcb6e233: [[Pasted Image 20240611182456_531.png]]
835421f3e1a4390c7a8ff865682eb472f58bd980: [[Pasted Image 20240611191135_812.png]]
d8d0d0ea6c5049bf791ca09a5383e21e30d917e6: [[Pasted Image 20240611192342_834.png]]
7a6e54e8c18414de018a6b954e89519be9cd32d9: [[Pasted Image 20240611192543_845.png]]
dd061096227582d8b4e8d0d5acc5ecf24a490ec9: [[Pasted Image 20240611192743_854.png]]
26fa961251c4e2799e986aa109fa5fc46fdb9fc1: [[Pasted Image 20240611192843_864.png]]



</div></div>


#### ANKI-什么是词法环境?
在v8引擎里JS的编译过程：
1. 分词/词法分析（tokenizing/lexing） 
2. token -> AST 抽象
3. 生成cpu执行的机器码
词法环境就是第一步中执行，==它用来登记变量声明、函数声明、函数声明的形参，后续代码执行的时候就知道去哪里拿变量的值和函数了，这个登记的地方就是`Lexical Environment（词法环境）`==
![Pasted image 20240612111319.png](/img/user/Pasted%20image%2020240612111319.png)
词法环境：
+ envRecord: 环境记录
+ outer: 对外词法引用 
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
每个词法环境都有一个outer指向上一层的词法环境，沿着outer一层一层词法环境找变量的值就是作用域链。
当运行上面代码，函数bar的词法环境里没有变量a，所以就会到它的上一层词法环境（foo函数词法环境）里去找，
foo函数词法环境里也没有变量a，就接着去foo函数词法环境的上一层（全局词法环境）去找，在全局词法环境里var a=2，
![Pasted image 20240612112854.png](/img/user/Pasted%20image%2020240612112854.png)
ID: 1718165561786

#### ANKI-什么是执行上下文？
![Pasted image 20240612113126.png](/img/user/Pasted%20image%2020240612113126.png)
==为什么要有两个词法环境：LexicalEnvironment和VariableEnvironment==
**变量环境组件（VariableEnvironment）**是用来登记`var` `function`变量声明，**词法环境组件（LexicalEnvironment）**是用来登记`let` `const` `class`等变量声明。
//
在ES6之前都没有块级作用域，ES6之后我们可以用`let` `const`来声明块级作用域，有这两个词法环境是为了实现块级作用域的同时不影响`var`变量声明和函数声明，具体如下：
- 1：首先在一个正在运行的执行上下文内，词法环境由LexicalEnvironment和VariableEnvironment构成，用来登记所有的变量声明。
- 2：当执行到块级代码时候，会先LexicalEnvironment记录下来，记录为oldEnv。
- 3：创建一个新的LexicalEnvironment（outer指向oldEnv），记录为newEnv，并将newEnv设置为正在执行上下文的LexicalEnvironment。
- 4：块级代码内的`let` `const`会登记在newEnv里面，但是`var`声明和函数声明还是登记在原来的VariableEnvironment里。
- 5：块级代码执行结束后，将oldEnv还原为正在执行上下文的LexicalEnvironment。
ID: 1718165561788


#### ANKI-执行上下文，词法环境与执行栈的关系？
JS引擎是按照可执行代码来执行代码的，每次执行步骤如下
1：创建一个新的执行上下文（Execution Context）
2：创建一个新的词法环境（Lexical Environment）
3：把LexicalEnvironment和VariableEnvironment指向新创建的词法环境
4：把这个执行上下文压入执行栈并成为正在运行的执行上下文
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
