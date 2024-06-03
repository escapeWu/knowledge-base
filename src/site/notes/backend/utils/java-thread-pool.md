---
{"dg-publish":true,"permalink":"/backend/utils/java-thread-pool/","created":"2024-05-27T15:40:15.037+08:00","updated":"2024-05-27T15:04:10.000+08:00"}
---

线程池并发任务执行
```java
ExecutorService executor = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors()); // 创建一个线程池  
List<Callable<Object>> callables = new ArrayList<>();  
  
payloads.forEach(name -> {  
    callables.add(Executors.callable(() -> /*你需要做并发计算的方法*/));  
    callables.add(Executors.callable(() -> /*你需要做并发计算的方法*/));  
    callables.add(Executors.callable(() -> /*你需要做并发计算的方法*/));  
});  
  
try {  
    // 并发执行所有任务，并等待所有任务完成  
    executor.invokeAll(callables);  
} catch (InterruptedException e) {  
    Thread.currentThread().interrupt(); // 重新设置中断状态  
    // TODO: 处理中断异常  
} finally {  
    // 关闭线程池  
    executor.shutdown();  
    try {  
        if (!executor.awaitTermination(60, TimeUnit.SECONDS)) {  
            executor.shutdownNow();  
        }  
    } catch (InterruptedException e) {  
        executor.shutdownNow();  
        Thread.currentThread().interrupt(); // 重新设置中断状态  
    }  
}
```