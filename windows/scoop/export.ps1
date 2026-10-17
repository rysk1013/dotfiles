$ErrorActionPreference = "Stop"

$directory = $PSScriptRoot

$packages = @(
  Get-Content (Join-Path $directory "packages.txt") |
    Where-Object { $_.Trim() -ne "" }
)

$data = scoop export | ConvertFrom-Json

$data.apps = @(
  $data.apps | Where-Object {
    $_.Name -in $packages
  }
)

$data |
  ConvertTo-Json -Depth 10 |
  Set-Content -Encoding utf8 (Join-Path $directory "scoopfile.json")
