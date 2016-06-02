

 <#
.Synopsis
   Starts a WebDriver for the specified browser
.DESCRIPTION
   Using the browser specified when this function is called a WebDriver session
   is created and the specified browser is launched and ready for further processing.
.PARAMETER Browser
    Suported browsers Chrome, Firefox, IE
.EXAMPLE
   Start-WebDriver -Browser Chrome
.EXAMPLE
   Start-WebDriver -Browser IE
.INPUTS
   String name of the browser
.OUTPUTS
   Bool
.NOTES
   The specified browser must be installed and available on the client machine.
   Currently only local driver sessions are supported.
.COMPONENT
   WebDriver
.ROLE
   Web Testing
.FUNCTIONALITY
   Enable Web Page and Browser testing.
#> 
function Start-WebDriver {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [ValidateSet('Chrome','IE','Firefox')]
        [String]
        $Browser
    )

    if ($global:WebDriver -is [OpenQA.Selenium.IWebDriver]) {
        Write-Warning -Message "WebDriver Seems To Already Be Started. Call Stop-WebDriver First Before Starting a New WebDriver Session"
    }
    else {
        $Binaries = Join-Path -Path $RootPath -ChildPath 'Binaries'

        switch ($Browser) {
            'Chrome'  {
                if (Update-EnvPath -Path "$Binaries\ChromeDriver.exe") {
                    $global:WebDriver = New-Object -TypeName OpenQA.Selenium.Chrome.ChromeDriver
                }
            }
            'IE' {
                if (Update-EnvPath -Path "$Binaries\IEDriverServer.exe") {
                    $global:WebDriver = New-Object -TypeName OpenQA.Selenium.IE.InternetExplorerDriver
                }
            }
            'Firefox' {
                $global:WebDriver = New-Object -TypeName OpenQA.Selenium.Firefox.FirefoxDriver
            }
        }
    }
}