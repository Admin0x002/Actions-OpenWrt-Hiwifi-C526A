#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 1. 移除可能冲突的源 (Helloworld / Kenzo)
# 注意：Kenzo 源包含大量插件，极易与 PassWall 产生依赖冲突，建议只按需添加单一插件
sed -i '/helloworld/d' feeds.conf.default
sed -i '/kenzo/d' feeds.conf.default
sed -i '/passwall/d' feeds.conf.default

# 2. 添加 PassWall 2 (后端 + 前端)
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> feeds.conf.default
echo "src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall2.git;main" >> feeds.conf.default
