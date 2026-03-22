#!/bin/bash
cd "$(dirname "$0")"

if ! python3 -c "import PySide6" 2>/dev/null; then
    echo "首次运行，正在安装依赖..."
    pip3 install -r requirements.txt
fi

python3 desktop_app.py
