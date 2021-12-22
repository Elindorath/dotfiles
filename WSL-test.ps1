#Requires -RunAsAdministrator
#Requires -Version 5.1

[CmdletBinding()]
param
(
  [Parameter(Mandatory = $false)]
  [string[]]
  $Functions
)

Clear-Host

$Host.UI.RawUI.WindowTitle = "Sophia Script for Windows 11 v6.0.7 | Made with $([char]::ConvertFromUtf32(0x1F497)) of Windows | $([char]0x00A9) farag & Inestic, 2014$([char]0x2013)2021"
Remove-Module -Name Sophia -Force -ErrorAction Ignore
Import-Module -Name $PSScriptRoot\Manifest\Sophia.psd1 -PassThru -Force
Import-Module -Name $PSScriptRoot\Overwrite\Overwrite.psd1 -PassThru -Force
Import-LocalizedData -BindingVariable Global:Localization -FileName Sophia -BaseDirectory $PSScriptRoot\Localizations

#region Protection

Checkings
Logging

#endregion Protection

#region WSL

WSL

#endregion WSL

#region Custom

ResumeAtRebootTask

#endregion Custom

RefreshEnvironment
Errors

Reboot
