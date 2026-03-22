@echo off
chcp 65001 >nul 2>&1
title 打包 抖音多开矩阵系统 (Windows)
cd /d "%~dp0"

echo ============================================
echo   抖音多开矩阵系统 - Windows 打包工具
echo ============================================
echo.

where python >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Python
    pause
    exit /b 1
)

echo [1/3] 安装依赖...
pip install -r requirements.txt
pip install pyinstaller

echo.
echo [2/3] 开始打包...
pyinstaller --noconfirm --onedir --windowed ^
    --name "抖音多开矩阵系统" ^
    --hidden-import PySide6.QtWebEngineWidgets ^
    --hidden-import PySide6.QtWebEngineCore ^
    --hidden-import flask ^
    --collect-all PySide6 ^
    desktop_app.py

if %errorlevel% neq 0 (
    echo.
    echo [错误] 打包失败
    pause
    exit /b 1
)

echo.
echo [3/3] 清理临时文件...
rmdir /s /q build 2>nul
del /q *.spec 2>nul

echo.
echo ============================================
echo   打包完成！
echo   输出目录: dist\抖音多开矩阵系统\
echo   可执行文件: dist\抖音多开矩阵系统\抖音多开矩阵系统.exe
echo ============================================
echo.
echo 提示: 将 dist\抖音多开矩阵系统 整个文件夹复制给用户即可
echo       用户双击 抖音多开矩阵系统.exe 启动
echo.
pause
