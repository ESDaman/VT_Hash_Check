#Replace "<APIKEY>" with your API key...
Get-Content .\hashes.txt | foreach-object {
$webcontent = curl -uri "https://www.virustotal.com/vtapi/v2/file/report?apikey=<APIKEY>&resource=$_"
$converted = $webcontent.content | ConvertFrom-json
if ($converted.positives -gt 0)
{
$_ >> .\results.txt
$converted.positives >> .\results.txt
}
}