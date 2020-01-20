$urls = @(
    "https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt",
    "https://trackerslist.com/all.txt"
)
$i = 0
$t = $env:TEMP
$p = "$t\__trackers"
$f = "$p.all.txt"
Foreach ($url in $urls)
{
    #Write-Host "$p$i.txt"
    Invoke-Webrequest $url -OutFile "$p$i.txt"
    $i++
}
cat $p* | Sort-Object -Unique | ? {$_.trim() -ne "" } | sc $f
notepad $f
sleep 5
Remove-Item -Path $t"\" -Include trackers*