#!/bin/bash
# 定义配置名字列表
names=("陈晗" "刘入菲" "刘文宾" "陶星蒙" "肖亭" "岳潇逸" "祝赫" "许俊")

# 获取当前配置名字的索引
index=$(cat /tmp/current_index_s 2>/dev/null)
index=${index:-0}

# 获取当前配置名字
current_name=${names[$index]}
date_time=$(date +"%Y-%m-%d %H:%M:%S")

# 构建 JSON 字符串
json='{
        "msgtype": "text",
        "text": {
            "content": "当前时间是：'$date_time'，stand up时间到了，今日host是'$current_name'",
            "mentioned_list": ["@all"]
        }
    }'

# 执行命令，并将 JSON 字符串传递给 curl
curl 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=71196606-1470-4a4e-bf98-3d268c31987b' \
   -H 'Content-Type: application/json' \
   -d "$json"

# 更新索引，下次使用下一个配置名字
index=$((($index + 1) % ${#names[@]}))
echo $index > /tmp/current_index_s

