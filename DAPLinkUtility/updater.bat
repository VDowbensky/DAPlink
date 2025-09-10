@echo off

set filename=DAPLinkUtility.exe
set partname=DAPLinkUtility.exe.part
set bakupname=DAPLinkUtility.exe.bak

:: 检查进程是否存在如果存在则杀死（errorlevel为0时表示进程存在）
tasklist | findstr /i %filename%
if errorlevel 0 (
	taskkill /f /im %filename%
) else (
	pass
)

:: 检查下载文件是否文件如果存在则重命名并覆盖就文件
if exist %partname% (
	if exist %bakupname% (
		del %bakupname%
	)
	rename %filename% %bakupname%
	rename %partname% %filename%
)

:: 检查文件是否存在如果存在则启动
if exist %filename% (
	start %filename%
)

msg %filename% "HelloWorld"

:: 退出脚本
exit
