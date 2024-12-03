---
{"dg-publish":true,"permalink":"/01-frontend/react/react-core/","title":"react 核心深入知识","tags":["react","frontend"],"created":"2024-11-13T14:10:27.113+08:00","updated":"2024-12-02T15:00:50.052+08:00"}
---

#### ANKI-什么是React Fiber
**React Fiber** 是 React 16 引入的一种新的内部协调（reconciliation）引擎，旨在优化应用的渲染性能和响应速度。Fiber 架构使 React 能够处理更复杂的应用场景，特别是在大型应用中需要频繁更新或高性能的动画效果时提供更流畅的用户体验。
**Fiber 的主要目的**
React Fiber 的主要目标是改进 React 的更新算法，使其可以 **增量地、逐步地** 渲染组件。具体来说，Fiber 实现了以下目标：
1. **将渲染任务拆分为可中断的工作单元**：
	• Fiber 可以将长时间的渲染任务分解成多个小任务，使其在执行过程中可以被暂停、恢复和中断。这种机制被称为“**时间切片**（Time Slicing）”，允许 React 在不同任务之间切换，提升响应性。
2. **更好的优先级控制**：
	• Fiber 提供了**优先级调度**机制，使得 React 能够根据任务的优先级来决定应该先处理哪些任务，例如用户交互任务优先级高，后台数据更新任务优先级低。
3. **改进动画和流畅的用户体验**：
	• 通过细粒度的任务控制，Fiber 使得 React 能够处理高帧率的动画和复杂的用户交互而不会导致 UI 卡顿。
ID: 1731480918187

#### ANKI-**React Fiber 是如何工作的？**
Fiber 将组件的更新过程分为两个阶段：
1. **调和（Reconciliation）阶段**：
	• 又称“**渲染阶段**”或“**diff 阶段**”，主要任务是找到需要更新的部分。
	• React 会创建一个 fiber 树，用来记录组件结构的状态。Fiber 可以被视为是描述每个组件单元任务的对象。
	• 这一步可以被打断。比如在计算需要更新的组件时，如果有更高优先级的任务（例如用户输入），可以暂停调和过程，待高优先级任务完成后继续。
2. **提交（Commit）阶段**：
	• 又称“**更新阶段**”，是实际将更新应用到 DOM 的阶段。
	• 这一步是同步进行的，不可被打断。Fiber 会将调和阶段找到的变化应用到实际的 DOM 节点上。
**Fiber 树与双缓冲**
在 Fiber 架构中，React 使用了“**双缓冲 Fiber 树**”机制，即在内存中维护两个 Fiber 树：
• **current Fiber 树**：表示当前应用状态的 Fiber 树。
• **work-in-progress Fiber 树**：表示更新后的新状态的 Fiber 树
React 在 work-in-progress 树上应用变更，避免频繁操作真实的 DOM 树。调和阶段结束后，再将 work-in-progress 树转换为 current 树并应用到真实 DOM 中。
**优先级与调度**
React Fiber 引入了多种优先级级别，比如：
• **同步优先级**：立即执行，比如用户输入。
• **任务优先级**：用于快速更新数据，如动画或低延迟任务。
• **低优先级**：适合后台数据加载等不紧急的任务。
React 会根据任务的优先级安排任务的执行顺序，确保关键任务不会因为大量低优先级任务而延迟，提升响应速度。
ID: 1731480918188