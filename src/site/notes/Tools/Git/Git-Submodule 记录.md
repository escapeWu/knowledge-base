---
{"dg-publish":true,"permalink":"/tools/git/git-submodule/","created":"2024-01-19T16:07:09.348+08:00","updated":"2024-01-15T17:01:15.000+08:00"}
---


 ## Example: adding an existing Git repository as a submodule of the repository that we’re working on.
 Command: `git submodule add`
 > we’ll add a library called “DbConnector”.
```console
git submodule add https://github.com/chaconinc/DbConnector
```
> By default, submodules will add the subproject into a directory named the same as the repository,  in this case “DbConnector”