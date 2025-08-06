@echo off
rem Tải audio từ YouTube, lưu file với tên dish.webm (hoặc định dạng gốc)
yt-dlp -f bestaudio[ext=webm] --extract-audio --audio-format mp3 --audio-quality 192K -o "chuc.%%(ext)s" https://www.youtube.com/watch?v=Wu8NeFXaoOc

rem Kiểm tra file dish.webm đã tồn tại chưa, chờ tối đa 30 giây
set count=0
:waitfile
if exist "chuc.webm" goto convert
timeout /t 1 >nul
set /a count+=1
if %count% geq 30 (
    echo File dish.webm khong tim thay, ket thuc.
    goto end
)
goto waitfile

:convert
rem Chuyển đổi file webm sang mp3
ffmpeg -i "chuc.webm" -vn -ab 192k -ar 44100 -y "chuc.mp3"

:end
pause
