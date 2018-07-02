# youtube-dl-mass-downloader-for-cc.com

Requires ffmpeg, ffprobe and youtube-dl (see google, or this repositories releases)


These scripts assist in mass downloading cc.com shows, or a custom url, and concatenating multiple parts to one file.


1. Download tools needed from external sources (or use my release to download versions of youtube-dl and ffmpeg used)
2. If tools are preinstalled, you will need PATHs defined. Usually these installers will do so by default.
3. Extract all files to the same file if needed, and <b>run youtube.dl-mass.bat</b>
4. Options 1-3 pull links from cc.com's json feeds for shows (The Daily Show, Jim Jefferies Show, & Tosh.0). Option 4 lets the user define a custom cc.com json url (found in the show's page, starting with "cc.com/feeds/ent_m013_cc/V2_1_1/"). Option 5 lets the user define a normal url for youtube-dl to handle (but will concatinate if presented with multiple parts at the end).


Windows:


* ffmpeg: https://ffmpeg.zeranoe.com/builds/
* youtube-dl: https://yt-dl.org/downloads/2018.06.25/youtube-dl.exe
