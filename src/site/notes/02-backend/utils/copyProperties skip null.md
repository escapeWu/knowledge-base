---
{"dg-publish":true,"permalink":"/02-backend/utils/copy-properties-skip-null/","created":"2024-08-07T09:59:35.046+08:00","updated":"2024-08-07T09:58:50.000+08:00"}
---

#spring 
#### ANKI-java 复制非空属性值
`getNullPropertyNames` 方法有效地使用这些 API 来检查对象中值为 `null` 的属性，并返回它们的名称。它利用了 Spring 框架的 `BeanWrapper` 来高效地处理反射操作。
1. 写个util 获取 value 为null 的属性名
```java
public class ObjectUtils {
    public static String[] getNullPropertyNames (Object source) {
        final BeanWrapper src = new BeanWrapperImpl(source);
        java.beans.PropertyDescriptor[] pds = src.getPropertyDescriptors();
		//
        Set<String> emptyNames = new HashSet<String>();
        for(java.beans.PropertyDescriptor pd : pds) {
            Object srcValue = src.getPropertyValue(pd.getName());
            if (srcValue == null) emptyNames.add(pd.getName());
        }
        String[] result = new String[emptyNames.size()];
        return emptyNames.toArray(result);
    }
}
```
2. 使用spring 自带的`BeanUtils.copyProperties` 进行复制
```java
BeanUtils.copyProperties(source, target, ObjectUtils.getNullPropertyNames(source));
// operation on target
```
**`BeanWrapper`**：
- **API**：这是 Spring 框架中 `org.springframework.beans` 包中的接口。
- **作用**：提供在目标对象上设置和获取属性值的功能。它作为一个包装器，用于动态访问 bean 的属性。
- **代码中的使用**：`BeanWrapper` 用于包装 `source` 对象，以便能够轻松访问和操作其属性。
**`getPropertyDescriptors()`**：
- **API**：由 `BeanWrapper` 接口提供的方法。
- **作用**：返回一个 `PropertyDescriptor` 对象数组，这些对象描述了被包装 bean 的所有属性。
- **代码中的使用**：用于检索 `source` 对象的所有属性的信息，以便对其进行迭代。
**`getPropertyValue(String propertyName)`**：
- **API**：由 `BeanWrapper` 接口提供的方法。
- **作用**：从包装的 bean 中检索指定属性的值。
- **代码中的使用**：用于检查 `source` 对象的属性值是否为 `null`。
ID: 1717062604578

