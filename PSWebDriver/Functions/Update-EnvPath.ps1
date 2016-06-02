

 <#
.Synopsis
    Update the Environment Path Variable
.DESCRIPTION
   Checks to see if the the path to add already exists and if not adds it otherwise just returns
.PARAMETER Path
    Path to folder or exe to add to the Enviroment Path
.EXAMPLE
   Update-EnvPath -Path C:\Path\to\add\to\Env\Path
.INPUTS
   file path as string
.OUTPUTS
   boolean
#> 
function Update-EnvPath {
    [CmdletBinding()]
    [OutputType([Bool])]
    Param (
        [Parameter(Mandatory)]
        [ValidateScript({ Test-Path -Path $PSItem })]
        [String]
        $Path
    )

    $ErrorActionPreference = 'Stop'
    try {
        if ($env:Path -notlike $("*" + $Path + "*")) {
            $env:Path += $(';' + $Path )
        }
        Write-Output $true
    }
    catch {
        Write-Output $false
    }
}