using module ../../motif/PSScripts/BundledExtension

param (
    [Parameter(Mandatory = $true)]
    [bool] $Install
)

$packagePath = Join-Path -Path $PSScriptRoot -ChildPath "../package.json"
$packageObject = Get-Content -Path $packagePath -Raw | ConvertFrom-Json
$version = $packageObject.version

$publisherId = New-PublisherId -Type "Organisation" -Name "Plxtra"

$info = New-BundledExtensionInfo `
    -PublisherId $publisherId `
    -Name "TsDemo" `
    -Version $version `
    -ApiVersion "3" `
    -ShortDescription "TypeScript Demo" `
    -LongDescription "Example extension demonstrating how an Extension is written with TypeScript" `
    -UrlPath "/extensions/ts-demo/index.js"

$bundledExtension = New-BundledExtension -Info $info -Install $Install

return $bundledExtension
