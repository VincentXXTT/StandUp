#!/bin/bash
# 定义配置名字列表
names=("陈晗" "刘入菲" "刘文宾" "陶星蒙" "肖亭" "岳潇逸" "喻唅" "祝赫" "许俊" "徐延钊")

# 获取当前配置名字的索引
index=$(cat current_index.txt 2>/dev/null)
index=${index:-0}

# 获取当前配置名字
current_name=${names[$index]}

# 计算下一个名字的索引
next_index=$((index + 1))
next_index=$((next_index % ${#names[@]}))

# 获取下一个配置名字
next_name=${names[next_index]}

# 执行命令
curl 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=b938769b-2e38-4e79-94c0-62aff7fff328' \
   -H 'Content-Type: application/json' \
   -d '
   {
        "msgtype": "text",
        "text": {
            "content": "stand up时间9点45，今日host是'$current_name', 明日host是'$next_name'",
            "mentioned_list": ["@all"]
        }
   }'
