Get-Module WebDriver | Remove-Module
Import-Module WebDriver -RequiredVersion 0.1.0.0

InModuleScope 'WebDriver' {
    Describe "Start-WebDriver" {

        Mock -CommandName Update-EnvPath -MockWith { Test-Path -Path $PSBoundParameters['Path'] }

        It "The Command Exists" {
            $( Get-Command -Name 'Start-WebDriver' -ErrorAction SilentlyContinue ).Name | 
            Should Be 'Start-WebDriver'
        }

        It "Chrome is a Valid Parameter Argument" {
            $( Get-Command Start-WebDriver ).Parameters['Browser'].Attributes.ValidValues.Contains('Chrome') | 
            Should Be $true
        }

        It "IE is a Valid Parameter Argument" {
            $( Get-Command Start-WebDriver ).Parameters['Browser'].Attributes.ValidValues.Contains('IE') | 
            Should Be $true
        }

        It "FireFox is a Valid Parameter Argument" {
            $( Get-Command Start-WebDriver ).Parameters['Browser'].Attributes.ValidValues.Contains('Firefox') |
            Should Be $true
        }

        It "Safari is an invalid Parameter Argument" {
            { Start-WebDriver -Browser Safari } |
            Should Throw
        }

        It "Updates The Eviroment Path Variable" {
            Start-WebDriver -Browser Chrome
            Assert-MockCalled -CommandName Update-EnvPath
        }

    }
}