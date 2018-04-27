#!/bin/sh

# 打印0到255种颜色
for i in {0..255} ; do
    printf "\x1b[38;5;${i}m${i} "
done

