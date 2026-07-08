@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
echo 开始批量移除文件名中的 _compressed（jpg/png/mp4）
echo ==============================================

:: 遍历三种带_compressed后缀的文件
for %%f in (*_compressed.jpg *_compressed.png *_compressed.mp4) do (
    set "oldFullName=%%f"
    set "fileNameNoExt=%%~nf"
    set "fileExt=%%~xf"
    :: 替换掉 _compressed
    set "newFileName=!fileNameNoExt:_compressed=!!fileExt"

    :: 防止重名覆盖
    if exist "!newFileName!" (
        echo 【跳过】!oldFullName! 目标文件 !newFileName! 已存在，避免覆盖
    ) else (
        ren "!oldFullName!" "!newFileName!"
        echo 已重命名：!oldFullName!  →  !newFileName!
    )
)

echo ==============================================
echo 全部处理完成！
pause