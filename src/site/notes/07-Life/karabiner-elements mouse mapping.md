---
{"dg-publish":true,"permalink":"/07-life/karabiner-elements-mouse-mapping/","title":"karabiner-elements鼠标侧键映射方案","created":"2024-07-12T10:43:28.000+08:00","updated":"2024-07-12T10:43:28.000+08:00"}
---


```json
{
    "title": "mouse map",
    "rules": [
        {
            "description": "left_control",
            "manipulators": [
                {
                    "from": {
                        "pointing_button": "button5"
                    },
                    "to": [
                        {
                            "key_code": "left_arrow",
                            "modifiers": [
                                "left_control"
                            ]
                        }
                    ],
                    "type": "basic"
                },
                {
                    "from": {
                        "pointing_button": "button4"
                    },
                    "to": [
                        {
                            "key_code": "right_arrow",
                            "modifiers": [
                                "left_control"
                            ]
                        }
                    ],
                    "type": "basic"
                }
            ]
        }
    ]
}
```