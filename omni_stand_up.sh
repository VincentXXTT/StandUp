#!/bin/bash
# 定义配置名字列表
names=("陈晗" "刘入菲" "刘文宾" "陶星蒙" "肖亭" "岳潇逸" "喻唅" "祝赫" "许俊")

# 获取当前配置名字的索引
index=$(cat current_index.txt 2>/dev/null)
index=${index:-0}

# 获取当前配置名字
current_name=${names[$index]}

# 执行命令
curl 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=71196606-1470-4a4e-bf98-3d268c31987b' \
   -H 'Content-Type: application/json' \
   -d '
   {
        "msgtype": "text",
        "text": {
            "content": "stand up时间到了，今日host是'$current_name'",
            "mentioned_list": ["@all"]
        }
   }'

