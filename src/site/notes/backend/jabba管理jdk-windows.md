---
{"dg-publish":true,"permalink":"/backend/jabba-jdk-windows/","created":"2024-04-03T10:25:53.000+08:00","updated":"2024-04-03T10:25:53.000+08:00"}
---

#windows #jdk
powershell 管理员运行:

安装
```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-Expression (
  Invoke-WebRequest https://github.com/shyiko/jabba/raw/master/install.ps1 -UseBasicParsing
).Content
```

使用
1. 列出可选jdk: `jabba ls-remote`
2. 列出本地已安装jdk: `jabba ls`
3. 下载: `jabba install openjdk@1.11.0`

环境变量设置：
```powershell
$envRegKey = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey('SYSTEM\CurrentControlSet\Control\Session Manager\Environment', $true)
$envPath=$envRegKey.GetValue('Path', $null, "DoNotExpandEnvironmentNames").replace('%JAVA_HOME%\bin;', '')
[Environment]::SetEnvironmentVariable('JAVA_HOME', "$(jabba which $(jabba current))", 'Machine')
[Environment]::SetEnvironmentVariable('PATH', "%JAVA_HOME%\bin;$envPath", 'Machine')
```
