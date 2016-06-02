$RootPath = $PSScriptRoot

Add-Type -Path "$RootPath\Binaries\WebDriver.dll"
Add-Type -Path "$RootPath\Binaries\ThoughtWorks.Selenium.Core.dll"
Add-Type -Path "$RootPath\Binaries\WebDriver.Support.dll"

$global:WebDriver = $null
$By = [OpenQA.Selenium.By]

Get-ChildItem -Path "$RootPath\Modules" -Filter "*psm1" | ForEach-Object {
	Import-Module $($PSItem.FullName) -Force
}

Get-ChildItem -Path "$RootPath\Functions" -Filter "*ps1" | ForEach-Object {
	. $($PSItem.FullName)
}

if ($args[0] -eq 'DevMode') {
    Export-ModuleMember -Function * -Cmdlet * -Variable * -Alias *
}
else {
    Export-ModuleMember -Function @(
        'Start-WebDriver'
        'Stop-WebDriver'
        'Move-ToURL'
        'Get-ElementByTagName'
        'Get-HyperLink'
        'Select-HyperLink'
        'Get-WebPageTitle'
        'Get-PageHeader'
    )
}