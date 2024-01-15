---
{"dg-publish":true,"permalink":"/tools/git/git-submodule/","tags":["gardenEntry"]}
---


 ## Example: adding an existing Git repository as a submodule of the repository that we’re working on.
 Command: `git submodule add`
 > we’ll add a library called “DbConnector”.
```console
git submodule add https://github.com/chaconinc/DbConnector
```
> By default, submodules will add the subproject into a directory named the same as the repository,  in this case “DbConnector”

