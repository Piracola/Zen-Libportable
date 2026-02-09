@echo off
chcp 65001 >nul
setlocal

set "target=%~dp0Zen\zen.exe"
set "lnk=%~dp0Zen.lnk"

if not exist "%target%" (
    echo [错误] 未找到 %target%
    pause & exit /b 1
)

powershell -NoP -EP Bypass -C "$w=New-Object -ComObject WScript.Shell;$s=$w.CreateShortcut('%lnk%');$s.TargetPath='%target%';$s.WorkingDirectory='%~dp0Zen';$s.Description='Zen浏览器';$s.Save()" 2>nul

if %errorlevel% neq 0 (
    echo [错误] 创建快捷方式失败
    pause & exit /b 1
)

echo [成功] 快捷方式已创建: %lnk%
pause
