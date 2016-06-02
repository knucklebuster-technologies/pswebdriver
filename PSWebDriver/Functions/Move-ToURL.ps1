 
 
 <#
.Synopsis
   Moves the WebDriver Page to the specified URL
.DESCRIPTION
   Taking a URL. 
   The command will move the connected browser to the specified URL.
   The URL must begin with http://, https://, or ftp://
.PARAMETER URL
    The fully qualified url string to move the connected browsers location
.EXAMPLE
   Start-WebDriver -Browser Chrome 
   Move-ToURL -URL http://powershell.org
.INPUTS
   String
.COMPONENT
   WebDriver
.FUNCTIONALITY
   Web Testing
#> 
function Move-ToURL {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [ValidatePattern("^(http|ftp|https)://([\w+?\.\w+])+([a-zA-Z0-9\~\!\@\#\$\%\^\&\*\(\)_\-\=\+\\\/\?\.\:\;\'\,]*)?$")]
        [String]
        $URL
    )

    if ($global:WebDriver -is [OpenQA.Selenium.IWebDriver]) {
        $global:WebDriver.Navigate().GoToURL($URL)
    }
    else {
        Write-Warning -Message 'WebDriver Does Not Appear To Be Running'
    }
 
}