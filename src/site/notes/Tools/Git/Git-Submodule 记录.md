---
{"dg-publish":true,"permalink":"/tools/git/git-submodule/","tags":["gardenEntry"],"created":"2024-01-15T10:55:03.154+08:00","updated":"2024-01-15T12:47:08.607+08:00"}
---


 ## Example: adding an existing Git repository as a submodule of the repository that we’re working on.
 Command: `git submodule add`
 > we’ll add a library called “DbConnector”.
```console
git submodule add https://github.com/chaconinc/DbConnector
```
> By default, submodules will add the subproject into a directory named the same as the repository,  in this case “DbConnector”

![Pasted image 20240115123720.png](/img/user/attachments/Pasted%20image%2020240115123720.png)
[[Excalidraw/Drawing 2024-01-15 12.44.48.excalidraw\|Drawing 2024-01-15 12.44.48.excalidraw]]
