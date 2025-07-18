using module ../../motif/PSScripts/BundledExtension

param (
    [Parameter(Mandatory = $true)]
    [bool] $Install
)

$newBundledExtensionScriptPath = Join-Path -Path $PSScriptRoot -ChildPath "New-BundledExtension.ps1"
$bundledExtension = & $newBundledExtensionScriptPath -Install $Install

$jsSourceFolderPath = Resolve-Path (Join-Path -Path $PSScriptRoot -ChildPath "../dist")
$bundledExtensionPlusJsSourceFolderPath = New-BundledExtensionPlusJsSourceFolderPath `
    -BundledExtension $bundledExtension `
    -JsSourceFolderPath $jsSourceFolderPath

return $bundledExtensionPlusJsSourceFolderPath