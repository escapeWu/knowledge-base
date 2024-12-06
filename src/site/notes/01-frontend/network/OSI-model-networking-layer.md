---
{"dg-publish":true,"permalink":"/01-frontend/network/osi-model-networking-layer/","title":"OSI 七层模型介绍","tags":["network"],"created":"2024-12-04T14:58:48.421+08:00","updated":"2024-12-06T14:40:52.202+08:00"}
---

#### ANKI-OSI七层模型，具体是哪几层，列举
速记：
请不要把暗号告诉任何人（Please Do Not Tell the Secret Password to Anyone）。
- **Please** | 物理层（Physical Layer）
- **Do** | 数据链路层（Data Link Layer）
- **Not** | 网络层（Network Layer）
- **Tell** （the）| 传输层（Transport Layer）
- **Secret** | 会话层（Session Layer）
- **Password** （to）| 表示层（Presentation Layer）
- **Anyone** | 应用层（Application Layer）
ID: 1733467252182

#### ANKI-OSI 七层模型，每层的具体作用
1. 物理层：光纤，无线网
2. 数据链路层：它定义了数据的传输格式、可以在节点间流动的数据量大小、数据流动可以持续的时长，以及在流中检测到错误时应采取的措施
3. 网络层：通过路由器在网络间或跨网发送信息，比如路由表之类的就是在网络层。
4. 传输层：传输层通过将消息分割成多个数据包提供端到端的消息传输，支持面向连接的和无连接的通信。
	1. TCP 是一个面向连接的协议，优先保证的是数据的质量而不是速度。
	2. UDP 是一个无连接的协议，优先保证速度而不是数据的质量。
5. **会话层**： 会话层负责初始化、维持并终止两个用户应用程序之间的连接。它响应来自表示层的请求，并向传输层发起请求。
6. **表示层**：表示层的主要功能是解决数据的表示、编码和转换问题，以确保来自发送端的数据可以被接收端正确解释和处理。
7. **应用层**：应用层是用户与网络交互的接口。它支持用户访问网络服务，如浏览网页、发送电子邮件、文件传输等
	1. FTP
	2. SSH
	3. SMTP
	4. DNS
	5. HTTP
ID: 1733467252183

