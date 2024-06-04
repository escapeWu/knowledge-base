---
{"dg-publish":true,"permalink":"/06-tools/python/coroutine-and-threading-all-in-one/","created":"2024-05-27T15:03:25.000+08:00","updated":"2024-05-27T15:03:25.000+08:00"}
---

线程和协程，整合在一个python启动文件中的写法

+ bootstrap 为启动函数
+ exit_event 作为停止指令传入函数，ctrl+c 停止

```python
import asyncio
import signal
import threading
from pygame.time import Clock 

async def ws_server_startup(exit_flag):
    while not exit_flag.is_set():
        print('coroutine running')
        await asyncio.sleep(1)

def thread_mouse_move(exit_flag):
    clock = Clock()
    while not exit_flag.is_set():
        clock.tick(10)
        print('threading mouse move')


def handle_interrupt(signum, frame):
    global exit_event
    print("Received Ctrl+C. Exiting...")
    exit_event.set()  # 设置线程退出标志

# 创建全局事件，用于通知线程退出
exit_event = threading.Event()
def bootstrap():
    try:
        _loop = asyncio.get_running_loop()
    except RuntimeError:
        _loop = asyncio.new_event_loop()
        asyncio.set_event_loop(_loop)

    # 注册信号处理器，捕获 Ctrl+C
    signal.signal(signal.SIGINT, handle_interrupt)
    
    ws_task = _loop.create_task(ws_server_startup(exit_event, ))

    mouse_move_thread = threading.Thread(target=thread_mouse_move, args={exit_event, })
    mouse_move_thread.start()

    _loop.run_until_complete(ws_task)

    exit_event.set()
    mouse_move_thread.join()


if __name__ == '__main__':
    bootstrap()
```