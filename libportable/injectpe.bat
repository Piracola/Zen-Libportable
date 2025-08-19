@echo off
REM Zen 浏览器便携版 DLL 注入脚本 - 自动版本
REM 此脚本用于将 libportable 的 DLL 文件注入到 Zen 浏览器中，使其变为便携版
REM 作者：Zen Libportable 项目
REM 版本：1.0

REM 关闭命令回显，使输出更清晰
@echo off

REM 检查是否在正确的目录下运行
REM 检查是否存在 zen.exe 和 mozglue.dll 文件
if exist "%~dp0zen.exe" (echo.) && if exist "%~dp0mozglue.dll" (
echo 已找到需要注入的文件zen.exe. 
goto platform
) else (
echo 没找到相关文件,请把程序放入浏览器的安装目录执行.
goto eof
)

:platform
REM 平台检测和准备阶段
REM 删除可能存在的旧更新检查程序
if exist "%~dp0upcheck.exe" del /s/q "%~dp0upcheck.exe" 2>nul 1>nul

REM 根据系统架构检测位数并设置相应的 DLL 注入工具
REM PROCESSOR_ARCHITECTURE 环境变量显示当前系统架构
if "%PROCESSOR_ARCHITECTURE%"=="x86" setdll32 /t:zen.exe 2>nul
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" setdll64 /t:zen.exe 2>nul

REM 根据错误码确定系统位数（32=32位系统，64=64位系统）
if "%errorlevel%"=="32" set bits=32&goto x86
if "%errorlevel%"=="64" set bits=64&goto x64
goto eof

:x86
REM 32位系统处理分支
echo ***********************************************************************
echo *                程序自动注入32位的zen浏览器                      *
echo *注意!!! 新版本会修复omni.ja文件,不要在同一zen版本上重复运行此脚本*
echo ***********************************************************************
echo+
REM 重命名 32 位更新检查程序
if exist "%~dp0upcheck32.exe" rename upcheck32.exe upcheck.exe 2>nul
goto runing

:x64
REM 64位系统处理分支
echo+
echo ***********************************************************************
echo *                程序自动注入64位的zen浏览器                      *
echo *注意!!! 新版本会修复omni.ja文件,不要在同一zen版本上重复运行此脚本*
echo ***********************************************************************
echo+
REM 重命名 64 位更新检查程序
if exist "%~dp0upcheck64.exe" rename upcheck64.exe upcheck.exe 2>nul

:runing
REM 执行实际的 DLL 注入过程
echo 正在执行 DLL 注入...
REM 使用对应位数的 setdll 工具将 portable DLL 注入到 mozglue.dll
setdll%bits% /d:portable%bits%.dll mozglue.dll 2>nul

REM 如果存在更新检查程序，处理 omni.ja 文件
if exist "%~dp0upcheck.exe" setdll%bits% /p:browser\omni.ja 2>nul

REM 检查操作结果并给出相应提示
if "%errorlevel%"=="0" (
echo 注入成功,请仔细阅读readme.txt和portable(example).ini文件!
) else (
echo 程序注入失败,请联系开发者!
)

:eof
REM 清理和收尾阶段
echo 正在清理临时文件...

REM 清理临时文件和不需要的 DLL/EXE 文件
@del /s/q setdll*.exe 2>nul 1>nul

REM 根据系统位数删除不匹配的 DLL 和更新程序
if "%bits%"=="32" del /s/q portable64.dll upcheck64.exe 2>nul 1>nul
if "%bits%"=="64" del /s/q portable32.dll upcheck32.exe 2>nul 1>nul

if not exist %~dp0portable.ini copy /y %~dp0portable(example).ini %~dp0portable.ini 2>nul 1>nul

REM 自动删除此脚本文件（安全考虑）
@del /q %0 2>nul 1>nul
echo 便携版创建完成！
