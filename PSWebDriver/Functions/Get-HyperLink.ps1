

 <#
.Synopsis
   Retrieves a Hyperlink or links on the current webpage
.DESCRIPTION
   By Default will return all hyperlinks on the current page.
   A String of the text can be passed in to limit the returns links.
   Wildcards are accepted.
.PARAMETER Text
    The Text in the HyperLink you want wildcards accepted
.EXAMPLE
   $Links = Get-Hyperlink
.EXAMPLE
   $Link = Get-Hyperlink -Text "Powershell Language*"
.INPUTS
   An optional string
.OUTPUTS
   OpenQA.Selenium.IWebElement[]
.COMPONENT
   WebDriver
.FUNCTIONALITY
   Web Testing
#> 
function Get-HyperLink {
    [CmdletBinding()]
    [OutputType([OpenQA.Selenium.IWebElement[]])]
    Param (
        [Parameter(Mandatory)]
        [String]
        $Text
    )

    if ($Global:WebDriver -is [OpenQA.Selenium.IWebDriver]) {
        Get-ElementByTagName -TagName 'a' | Where-Object {$PSItem.Text -like $Text} | Write-Output
    }
    else {
        Write-Warning -Message 'WebDrive Does Not Appear To Be Running'
    }
}