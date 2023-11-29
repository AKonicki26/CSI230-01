clear
# Did not work when I had the https:// in front, said could not trust website
$scraped_page = Invoke-WebRequest -TimeoutSec 10 192.168.3.148/ToBeScraped.html 
#$scraped_page.Links | select outerText, href

$h2 = $scraped_page.ParsedHtml.body.getElementsByTagName("h2")
#$h2

#for ($i = 0; $i -lt $h2.Length; $i++) {
#    $h2[$i].getElementsByTagName("a") | select `
#    @{Name = "h2 element"; Expression={$i}}, outerText, href   
#}

$div1 = $scraped_page.ParsedHtml.body.getElementsByClassName("div-1") | select innerText
$div1

$trs = $scraped_page.ParsedHtml.body.getElementsByTagName("tr")
#$trs

$multirow = @()
for ($i = 0; $i -lt $trs.Length; $i++) {
    $tds = $trs[$i].getElementsByTagName("td")

    if ($tds[0].innerText -ilike "Employee")
    { continue }

    $singleRow = @(
        @{Row = $i; Employee = $tds[0].innerText; Department = $tds[1].innerText; `
        Salary = $tds[2].innerText})
    $multirow += $singleRow
}

$multirow

Write-Host "-------------------------------------------------"

$salaries = @()
foreach($employee in $multirow) {
    $salaries += $employee.Salary
} 
$avg = $salaries | Measure-Object -Average
$avg.Average

Write-Host "-------------------------------------------------"

$scraped_page.ParsedHtml.body.getElementsByTagName("div") | select id