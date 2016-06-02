

 <#
.Synopsis
   returns elements from the current page by tag name
.DESCRIPTION
   Takes the tag name and returns IWebElement objects
.PARAMETER TagName
    The string of the Tag you want returned
.EXAMPLE
   Start-WebDriver -Browser Chrome
   $Links = Get-ElementByTagName -TagName a 
.INPUTS
   String
.OUTPUTS
   OpenQA.Selenium.IWebElement[]
.COMPONENT
   WebDriver
.FUNCTIONALITY
   Web Testing
#> 
function Get-ElementByTagName {
    [CmdletBinding()]
    [OutputType([OpenQA.Selenium.IWebElement[]])]
    Param (
        [Parameter(Mandatory)]
        [String]
        $TagName
    )

    if ($global:WebDriver -is [OpenQA.Selenium.IWebDriver]) {
        $global:WebDriver.FindElements($By::TagName($TagName)) | Write-Output
    }
    else {
        Write-Warning -Message 'WebDriver Does Not Appear To Be Running'
    }
}