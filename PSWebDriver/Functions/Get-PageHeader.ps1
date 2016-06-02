

 <#
.Synopsis
   Retrieves Headers from the current page by size
.DESCRIPTION
   By Default will return all headers of a specified size on the page.
.PARAMETER Size
    The header size 1, 2, 3
.PARAMETER Text
    The text of the header you want, wildcards accepted
.EXAMPLE
   $Links = Get-PageHeader -Size 1
.EXAMPLE
   $Link = Get-PageHeader -Size 3 -Text "to PowerShell.org"
.INPUTS
   String, String
.OUTPUTS
   OpenQA.Selenium.IWebElement[]
.COMPONENT
   WebDriver
.FUNCTIONALITY
   Web Testing
#> 
function Get-PageHeader {
    [CmdletBinding()]
    [OutputType([OpenQA.Selenium.IWebElement[]])]
    Param (
        [Parameter(Mandatory)]
        [ValidateSet('1','2','3')]
        [String]
        $Size,
        [String]
        $Text='*'
    )

    if ($Global:WebDriver -is [OpenQA.Selenium.IWebDriver]) {
        Get-ElementByTagName -TagName "h$Size" | 
        Where-Object { $PSItem.Text -like $Text } | 
        Write-Output
    }
    else {
        Write-Warning -Message 'WebDrive Does Not Appear To Be Running'
    }
}