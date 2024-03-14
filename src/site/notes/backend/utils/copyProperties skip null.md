---
{"dg-publish":true,"permalink":"/backend/utils/copy-properties-skip-null/","created":"2024-03-13T14:34:26.059+08:00","updated":"2024-03-13T14:39:47.256+08:00"}
---

Spring 自带的BeanUtils copyProperties 不支持非null属性值复制，我们可以自己写一个util进行处理

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