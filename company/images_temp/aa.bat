@echo off
setlocal enabledelayedexpansion
:: 处理jpg png mp4三种格式
for %%f in (*_compressed.jpg *_compressed.png *_compressed.mp4) do (
    set "oldname=%%~nf"
    set "newname=!oldname:_compressed=!"
    ren "%%f" "!newname!%%~xf"
)
echo 全部重命名完成！
pause