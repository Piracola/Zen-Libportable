# Zen-Libportable

[![Build Status](https://img.shields.io/github/actions/workflow/status/Piracola/Zen-Libportable/Zen-Portable-package.yml?style=flat-square&label=构建状态)](https://github.com/Piracola/Zen-Libportable/actions/workflows/Zen-Portable-package.yml)
[![Latest Release](https://img.shields.io/github/v/release/Piracola/Zen-Libportable?style=flat-square&label=最新版本&color=blue)](https://github.com/Piracola/Zen-Libportable/releases/latest)
[![License](https://img.shields.io/github/license/Piracola/Zen-Libportable?style=flat-square&label=许可证)](LICENSE)

**开箱即用的 Zen 浏览器便携版**

本项目基于 libportable，对 Zen 浏览器进行自动化便携版打包。

## 🚀 快速开始

1. **下载**: [📥 下载最新版本](https://github.com/Piracola/Zen-Libportable/releases/latest/download/Zen.zip)
2. **解压**: 将压缩包解压到任意目录（如 `D:\Browser\Zen`）。
3. **运行**: 双击 `开始.bat`，脚本将自动创建快捷方式。

## 🔄 更新指南

仅需替换浏览器本体目录即可完成升级：

1. 将旧版 `Zen` 目录重命名为 `Zenold`（备份）。
2. 将新版 `Zen` 目录复制到同级位置。
3. 启动浏览器验证，确认无误后可删除备份。

## ⚙️ 高级配置

配置文件位于 `Zen/portable.ini`：

```ini
[Portable]
DataPath=..\Profile
CachePath=..\Cache
```

更多配置项请阅读文件内说明

## 🔗 相关项目

| 浏览器 | 项目地址 | 状态 |
|--------|----------|------|
| Firefox | [Firefox-Libportable](https://github.com/Piracola/Firefox-Libportable) | ✅ Available |
| Floorp | [Floorp_portable](https://github.com/Piracola/Floorp_portable) | ✅ Available |

## 📄 许可证

本项目采用 **MIT 许可证**。详见 [LICENSE](LICENSE) 文件。

<p>
  Made with ❤️ by <a href="https://github.com/Piracola">Piracola</a>
</p>
