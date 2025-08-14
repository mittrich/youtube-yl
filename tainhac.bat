@echo off
rem Tải audio từ YouTube, lưu file với tên dish.webm (hoặc định dạng gốc)
yt-dlp -f bestaudio[ext=webm] --extract-audio --audio-format mp3 --audio-quality 192K -o "tenbainhac.%%(ext)s" nguồn

rem Kiểm tra file tenbainhac.webm đã tồn tại chưa, chờ tối đa 30 giây
set count=0
:waitfile
if exist "tenbainhac.webm" goto convert
timeout /t 1 >nul
set /a count+=1
if %count% geq 30 (
    echo File tenbainhac.webm khong tim thay, ket thuc.
    goto end
)
goto waitfile
pause