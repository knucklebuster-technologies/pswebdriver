

 <#
.Synopsis
   Stops The Current WebDriver Session
.DESCRIPTION
   Stops The Current WebDriver Session
.EXAMPLE
   Stop-WebDriver
.EXAMPLE
   Start-WebDriver -Browser Chrome | Stop-WebDriver
#> 
function Stop-WebDriver {
    [CmdletBinding()]
    Param ()

    if ($global:WebDriver -is [OpenQA.Selenium.IWebDriver]) {
        $global:WebDriver.Quit()
        $global:WebDriver = $null
    }
    else {
        Write-Warning -Message 'WebDriver Does Not Appear To Be Running'
    }
    
}