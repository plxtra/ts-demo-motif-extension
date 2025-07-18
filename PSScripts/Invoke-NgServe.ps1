using module ../../motif/PSScripts/DevStaticValues

$newBundledExtensionPlusJsSourceFolderPath = Join-Path -Path $PSScriptRoot -ChildPath "New-BundledExtensionPlusJsSourceFolderPath.ps1"
$bundledExtensionPlusJsSourceFolderPath = & $newBundledExtensionPlusJsSourceFolderPath -Install $true

$xospMotifConfigRepositoryGetConfigAndBrandingFolderPathScriptPath = Join-Path `
    -Path $PSScriptRoot `
    -ChildPath "../../xosp-motif-config/PSScripts/Get-DevConfigAndBrandingFolderPath.ps1"

$configAndBrandingFolderPath = & $xospMotifConfigRepositoryGetConfigAndBrandingFolderPathScriptPath

[DevStaticValues] $devStaticValues = New-DevStaticValues `
    -Config $configAndBrandingFolderPath.Config `
    -BrandingSourceFolderPath $configAndBrandingFolderPath.BrandingFolderPath `
    -BundledExtensionPlusJsSourceFolderPathArray @($bundledExtensionPlusJsSourceFolderPath)

$motifRepositoryInvokeNgServeScriptPath = Join-Path -Path $PSScriptRoot -ChildPath "../../motif/PSScripts/Invoke-NgServe.ps1"
& $motifRepositoryInvokeNgServeScriptPath -DevStaticValues $devStaticValues
