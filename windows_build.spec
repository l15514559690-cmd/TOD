# -*- mode: python ; coding: utf-8 -*-
# Run on Windows: py -m PyInstaller --noconfirm --clean windows_build.spec
from PyInstaller.utils.hooks import collect_all

block_cipher = None

datas_s6, binaries_s6, hiddenimports_s6 = collect_all("PySide6")
datas_fl, binaries_fl, hiddenimports_fl = collect_all("flask")

a = Analysis(
    ["desktop_app.py"],
    pathex=[],
    binaries=binaries_s6 + binaries_fl,
    datas=datas_s6 + datas_fl,
    hiddenimports=hiddenimports_s6
    + hiddenimports_fl
    + [
        "PySide6.QtWebEngineWidgets",
        "PySide6.QtWebEngineCore",
        "PySide6.QtWebChannel",
        "werkzeug",
        "werkzeug.serving",
        "jinja2",
        "itsdangerous",
        "click",
        "blinker",
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name="DouyinMatrix",
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=False,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)

coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,
    upx=False,
    upx_exclude=[],
    name="DouyinMatrix",
)
