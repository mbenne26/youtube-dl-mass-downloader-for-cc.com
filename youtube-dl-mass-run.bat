SET ytdir=%~dp0
CD %ytdir%

youtube-dl %1%~2 --restrict-filenames -o "%ytdir%videos\%%(title)s.%%(ext)s"

powershell -NoProfile -ExecutionPolicy Bypass -command "& .\PSrename.ps1"
SET /p filename=<tmpfile.txt
echo DEL tmpfile.txt

(FOR %%i IN (%ytdir%videos\*.mp4) DO @echo file '%%i') > "%ytdir%videos\mylist.txt"

ffmpeg -f concat -safe 0 -i "%ytdir%videos\mylist.txt" -c copy %ytdir%%filename%.mp4

DEL "%ytdir%videos\"