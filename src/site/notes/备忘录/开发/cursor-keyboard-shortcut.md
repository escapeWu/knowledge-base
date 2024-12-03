---
{"dg-publish":true,"permalink":"///cursor-keyboard-shortcut/","title":"cursor 的全局快捷键","tags":["dev-tool"],"created":"2024-12-03T10:59:17.230+08:00","updated":"2024-12-03T11:04:15.573+08:00"}
---

![Pasted image 20241203110414.png](/img/user/attachments/Pasted%20image%2020241203110414.png)
```json
// Place your key bindings in this file to override the defaults
[
    {
        "key": "cmd+[",
        "command": "-editor.action.outdentLines",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "cmd+]",
        "command": "-editor.action.indentLines",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "cmd+[",
        "command": "workbench.action.navigateBack",
        "when": "canNavigateBack"
    },
    {
        "key": "ctrl+-",
        "command": "-workbench.action.navigateBack",
        "when": "canNavigateBack"
    },
    {
        "key": "cmd+]",
        "command": "workbench.action.navigateForward",
        "when": "canNavigateForward"
    },
    {
        "key": "ctrl+shift+-",
        "command": "-workbench.action.navigateForward",
        "when": "canNavigateForward"
    },
    {
        "key": "ctrl+b",
        "command": "-cursorLeft",
        "when": "textInputFocus"
    }
]
```