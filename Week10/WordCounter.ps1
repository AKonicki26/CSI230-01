$FilesToLookAt = Get-ChildItem $PSScriptRoot/.. -Recurse -Filter "*.bash" | % {$_.FullName}


for ($i = 0; $i -lt $FilesToLookAt.Count; $i++) {
    $data += Get-Content $FilesToLookAt[$i] | Measure-Object -Word -Line
}

$data | Measure-Object -Property Words -Minimum -Maximum -Average

$data | select Words, Lines