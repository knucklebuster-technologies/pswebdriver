

 <#
.Synopsis
   Returns current page title
.DESCRIPTION
   Returns current page title
.EXAMPLE
   $Title = Get-WebPageTitle
.OUTPUTS
   string
.COMPONENT
   WebDriver
.FUNCTIONALITY
   WebTesting
#> 
function Get-WebPageTitle {
    [CmdletBinding()]
    [OutputType([String])]
    Param ()

    if ($Global:WebDriver -is [OpenQA.Selenium.IWebDriver]) {
        $Global:WebDriver.Title | Write-Output
    }
    else {
        Write-Warning -Message 'WebDriver Does Not Appear To Be Running'
    }
}