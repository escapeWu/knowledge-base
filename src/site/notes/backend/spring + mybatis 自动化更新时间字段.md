---
{"dg-publish":true,"permalink":"/backend/spring-mybatis/","created":"2024-05-29T20:44:51.317+08:00","updated":"2024-05-29T16:04:30.000+08:00"}
---

#mybatis #spring 
要求：自动更新createTime 和 updateTime 两个字段，并在插入的时候序列化为 yyyy-MM-dd HH:mm:ss 格式



### 创建自定义MetaObjectHandler 实现类，实现字段自动更新
```java
@Slf4j
@Component
public class MybatisColumnHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName("createTime", LocalDateTime.now(), metaObject);
        this.setFieldValByName("updateTime", LocalDateTime.now(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName("updateTime", LocalDateTime.now(), metaObject);
    }
}

```

### 重写Jackson2Object LocalDateTime 类型的序列化和反序列化
```java
@Configuration
public class LocalDateTimeConfig {
    private String pattern = "yyyy-MM-dd HH:mm:ss";

    @Bean
    public LocalDateTimeDeserializer localDateTimeDeserializer() {
        return new LocalDateTimeDeserializer(DateTimeFormatter.ofPattern(pattern));
    }

    @Bean
    public LocalDateTimeSerializer localDateTimeSerializer() {
        return new LocalDateTimeSerializer(DateTimeFormatter.ofPattern(pattern));
    }

    @Bean
    public Jackson2ObjectMapperBuilderCustomizer jackson2ObjectMapperBuilderCustomizer() {
        return builder -> builder
                .serializerByType(LocalDateTime.class, localDateTimeSerializer())
                .deserializerByType(LocalDateTime.class, localDateTimeDeserializer());
    }
}

```