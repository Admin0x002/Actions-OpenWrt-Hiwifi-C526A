#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 管理地址
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/files/bin/config_generate

# 默认主题设置
# 注意：我们在 part1 中添加了 src-git argon，系统会自动下载到 feeds/argon/luci-theme-argon
# 只需要确保编译菜单中选中它，并设置为默认即可

# 强制替换 bootstrap 为 argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile