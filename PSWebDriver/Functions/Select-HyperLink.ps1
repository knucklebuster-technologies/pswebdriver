

 <#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#> 
function Select-HyperLink {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [ValidateScript({if ($PSItem.TagName -eq 'a'){return $true} else{return $false}})]
        [OpenQA.Selenium.IWebElement]
        $Link
    )

    if ($global:WebDriver -is [OpenQA.Selenium.IWebDriver]) {
        $Element.Click()
    }
    else {
        Write-Warning -Message 'WebDriver Does Not Appear To Be Running'
    }
}