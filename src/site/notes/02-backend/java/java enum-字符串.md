---
{"dg-publish":true,"permalink":"/02-backend/java/java-enum/","created":"2024-05-29T23:33:30.435+08:00","updated":"2024-05-29T23:33:13.000+08:00"}
---


#### ANKI-java如何将enum 以字符串格式输出值
#java #json #enum
当你在一个枚举的方法上使用 `@JsonValue` 注解时，Jackson 库会在序列化该枚举对象时调用该方法，并将其返回的值作为序列化结果
```java
import com.fasterxml.jackson.annotation.JsonValue;
public enum MessageType {
    SYSTEM("system"),
    USER("user"),
    ASSISTANT("assistant");
    private final String value;
    MessageType(String value) {
        this.value = value;
    }
    @JsonValue
    public String getValue() {
        return value;
    }
}
```