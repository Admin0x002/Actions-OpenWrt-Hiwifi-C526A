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

# 1. 修改管理 IP
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/files/bin/config_generate

# 2. 移除 Lean 源码自带的老旧 Argon 主题 (防止冲突)
# Lean 的源码里有时会自带一个旧版本的 luci-theme-argon，必须删掉，否则编译会报错或不生效
rm -rf package/lean/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon

# 3. 拉取 Argon 主题 (严格按照官方文档：Build for Lean's LEDE project)
# 注意：这里必须加 -b 18.06，否则你的固件进去后 CSS 会崩
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# 4. 替换默认主题为 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile