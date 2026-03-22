@echo off
chcp 65001 >nul 2>&1
title 抖音多开矩阵系统
cd /d "%~dp0"

where python >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Python，请先安装 Python 3.9+
    echo 下载地址: https://www.python.org/downloads/
    pause
    exit /b 1
)

echo 正在检查依赖...
python -c "import PySide6" >nul 2>&1
if %errorlevel% neq 0 (
    echo 首次运行，正在安装依赖...
    pip install -r requirements.txt
    if %errorlevel% neq 0 (
        echo [错误] 依赖安装失败，请手动运行: pip install -r requirements.txt
        pause
        exit /b 1
    )
)

echo 正在启动 抖音多开矩阵系统...
python desktop_app.py
if %errorlevel% neq 0 (
    echo.
    echo [错误] 程序异常退出，错误码: %errorlevel%
    echo 请检查 Python 版本 ^(需要 3.9+^) 和依赖是否完整
    pause
)
