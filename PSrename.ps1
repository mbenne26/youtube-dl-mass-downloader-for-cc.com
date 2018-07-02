$myFileName = dir .\videos\*act_1* | select -ExpandProperty name
$myMonthNames = (Get-Culture).DateTimeFormat.MonthNames

$a=0
while(($myFileName -match ($myMonthNames[$a])) -eq $false) {++$a;
$myFileName -match $myMonthNames[$a]
}

$myNewFileName = $myFileName -replace $myMonthNames[$a], ++$a

$SN=""
$myNewFileName.split('_') | ForEach-Object {
if($SN -match '\d'){return}
$SN += $_
}

#$SN=(($SN -replace "The", '') -replace "show", '') -replace 'with', ''
$SN=$SN -replace "The|with", ''
$SN = $SN.Substring(0,$SN.Length-1)

$myNewFileName -replace '.*(_\d_\d+_2018)_.*_(\w+_\w+)_Act_\d.mp4', "$SN`$1_`$2" | Out-File -Encoding ASCII -file tmpfile.txt

$myNewFileName