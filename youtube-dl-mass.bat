SET ytdir=%~dp0
SET skip3=""
CD %ytdir%

echo "Requires youtube-dl.exe, ffmpeg.exe & ffprobe.exe in directory"

SET urlstart=http://www.cc.com/feeds/ent_m013_cc/V2_1_1

SET /p show=Select show to download (1-Daily Show, 2-Jim Jefferies, 3-Tosh, 4-Custom, 5-Single URL) 

IF /I "%show%" EQU "1" (
SET showURL=%urlstart%/68093885-ff62-47de-abdc-42e5469a82de/7c2d44b4-c8b1-43a9-9bfc-32af988eab20/1
SET skip3=" --playlist-items 1,2,4"
echo "Skipping interview (part 3)"
)

IF /I "%show%" EQU "2" (
SET showURL=%urlstart%/90aa5ceb-866c-4f74-9e0d-41e3809d7a15/e7b0c68a-3089-11e7-bfd4-0026b9414f30/1
)

IF /I "%show%" EQU "3" (
SET showURL=%urlstart%/4a5d0205-4521-42bc-98a0-67385756c3f6/27e6e03a-ecfd-11e0-aca6-0026b9414f30/1
)

IF /I "%show%" EQU "4" SET /p showURL=Enter Custom Feed 

IF /I "%show%" NEQ "5" (
powershell -command "(((Invoke-WebRequest '%showURL%').Content | ConvertFrom-Json).result.episodes.canonicalURL) | Out-File -Encoding ASCII -FilePath '%ytdir%DLs.txt'"
)

IF /I "%show%" EQU "4" (
powershell -command "$x=Get-Content -Path .\DLs.txt ;[array]::Reverse($x);$x | Out-File -Encoding ASCII -file DLs.txt"
)

IF /I "%show%" EQU "5" (
SET /p showURL=Enter Single URL 
echo %showURL% >%ytdir%DLs.txt
)

powershell -command "echo %showURL% | Out-File -Encoding ASCII -FilePath '%ytdir%DLs.txt'"

FOR /F "tokens=*" %%a IN (%ytdir%DLs.txt) DO youtube-dl-mass-run.bat %%~a %skip3%