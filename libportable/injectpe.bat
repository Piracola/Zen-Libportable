@echo off
if exist "%~dp0zen.exe" (echo.) && if exist "%~dp0mozglue.dll" (
echo ���ҵ���Ҫע����ļ�zen.exe. 
goto platform
) else (
echo û�ҵ�����ļ�,��ѳ������������İ�װĿ¼ִ��.
goto eof
)

:platform
if exist "%~dp0upcheck.exe" del /s/q "%~dp0upcheck.exe" 2>nul 1>nul
if "%PROCESSOR_ARCHITECTURE%"=="x86" setdll32 /t:zen.exe 2>nul
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" setdll64 /t:zen.exe 2>nul
if "%errorlevel%"=="32" set bits=32&goto x86
if "%errorlevel%"=="64" set bits=64&goto x64
goto eof

:x86
@echo ***********************************************************************
@echo *                �����Զ�ע��32λ��zen�����                      *
@echo *ע��!!! �°汾���޸�omni.ja�ļ�,��Ҫ��ͬһzen�汾���ظ����д˽ű�*
@echo ***********************************************************************
echo+
if exist "%~dp0upcheck32.exe" rename upcheck32.exe upcheck.exe 2>nul
goto runing

:x64
echo+
@echo ***********************************************************************
@echo *                �����Զ�ע��64λ��zen�����                      *
@echo *ע��!!! �°汾���޸�omni.ja�ļ�,��Ҫ��ͬһzen�汾���ظ����д˽ű�*
@echo ***********************************************************************
echo+
if exist "%~dp0upcheck64.exe" rename upcheck64.exe upcheck.exe 2>nul

:runing
setdll%bits% /d:portable%bits%.dll mozglue.dll 2>nul
if exist "%~dp0upcheck.exe" setdll%bits% /p:browser\omni.ja 2>nul
if "%errorlevel%"=="0" echo ע��ɹ�,����ϸ�Ķ�readme.txt��portable(example).ini�ļ�!&goto eof
echo ����ע��ʧ��,����ϵ������!

:eof
@del /s/q setdll*.exe 2>nul 1>nul
if "%bits%"=="32" del /s/q portable64.dll upcheck64.exe 2>nul 1>nul
if "%bits%"=="64" del /s/q portable32.dll upcheck32.exe 2>nul 1>nul
if not exist %~dp0portable.ini copy /y %~dp0portable(example).ini %~dp0portable.ini 2>nul 1>nul
@del /q %0 2>nul 1>nul
