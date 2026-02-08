# Zen-Libportable

<p align="center">
  <a href="https://github.com/Piracola/Zen-Libportable/actions/workflows/Zen-Portable-package.yml">
    <img src="https://img.shields.io/github/actions/workflow/status/Piracola/Zen-Libportable/Zen-Portable-package.yml?branch=main&style=flat-square&label=构建状态" alt="构建状态">
  </a>
  <a href="https://github.com/Piracola/Zen-Libportable/releases/latest">
    <img src="https://img.shields.io/github/v/release/Piracola/Zen-Libportable?style=flat-square&label=最新版本&color=blue" alt="最新版本">
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/github/license/Piracola/Zen-Libportable?style=flat-square&label=许可证" alt="许可证">
  </a>
</p>

<p align="center">
  <b>开箱即用的 Zen 浏览器便携版</b>
</p>

---

## 📖 项目简介

本项目基于 [libportable](https://github.com/AdoptOpenJDK/libportable) ，对 Zen 浏览器进行自动化便携版打包。

### 支持的浏览器

| 浏览器 | 项目地址 | 状态 |
|--------|----------|------|
| **Zen** | 本项目 | ✅  actively maintained |
| Firefox | [Firefox-Libportable](https://github.com/Piracola/Firefox-Libportable) | ✅  available |
| Floorp | [Floorp_portable](https://github.com/Piracola/Floorp_portable) | ✅  available |

---

## 🚀 快速开始

### 使用步骤

1. **下载** 
   - 从 [Releases](https://github.com/Piracola/Zen-Libportable/releases/latest) 页面下载 `Zen.zip`
   - 或直接点击：[📥 下载最新版本](https://github.com/Piracola/Zen-Libportable/releases/latest/download/Zen.zip)

2. **解压**
   ```bash
   # 解压到任意目录，例如：
   D:\Browser\Zen
   ```

3. **创建快捷方式**
   - 双击运行 `开始.bat`
   - 脚本将自动在同级目录创建 `Zen.lnk` 快捷方式

---

## 🔄 更新指南

### 升级步骤

仅需替换浏览器本体目录即可完成升级：

| 步骤 | 操作 | 说明 |
|------|------|------|
| 1 | 重命名旧版本 | 将 `Zen` 目录重命名为 `Zenold`（便于回退） |
| 2 | 复制新版本 | 将新版本的 `Zen` 目录复制到同目录下 |
| 3 | 验证运行 | 启动浏览器确认正常工作 |

> 💡 **提示**：配置文件和浏览数据独立于浏览器目录，升级不会丢失个人数据。

---

## ⚙️ 高级配置

### 便携化参数

配置文件位于：`libportable/portable.ini`

```ini
; 示例配置
[Portable]
; 数据目录路径
DataPath=..\Profile

; 缓存目录路径
CachePath=..\Cache
```

详细配置说明请参考 [portable.ini](libportable/portable.ini) 文件内的注释。

## 📄 许可证

本项目采用 **MIT 许可证** - 详见 [LICENSE](LICENSE) 文件。

> 本项目使用了 [libportable](https://github.com/AdoptOpenJDK/libportable) 进行构建。

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/Piracola">Piracola</a>
</p>
