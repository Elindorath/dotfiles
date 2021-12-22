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
CreateRestorePoint

#endregion Protection

#region WSL

WSL

#endregion WSL

#region Programs

InstallPrograms

#endregion Programs

#region Privacy & Telemetry

DiagTrackService -Enable
DiagnosticDataLevel -Default
ErrorReporting -Enable
FeedbackFrequency -Automatically
ScheduledTasks -Disable
SigninInfo -Enable
LanguageListAccess -Enable
AdvertisingID -Disable
WindowsWelcomeExperience -Hide
WindowsTips -Disable
SettingsSuggestedContent -Hide
AppsSilentInstalling -Disable
WhatsNewInWindows -Disable
TailoredExperiences -Enable
BingSearch -Enable

#endregion Privacy & Telemetry

#region UI & Personalization

ThisPC -Hide
Windows10FileExplorer -Disable
CheckBoxes -Disable
HiddenItems -Enable
FileExtensions -Show
MergeConflicts -Hide
OpenFileExplorerTo -ThisPC
FileExplorerCompactMode -Disable
OneDriveFileExplorerAd -Hide
SnapAssistFlyout -Enable
SnapAssist -Enable
FileTransferDialog -Detailed
RecycleBinDeleteConfirmation -Disable
QuickAccessRecentFiles -Hide
QuickAccessFrequentFolders -Show
TaskbarAlignment -Center
TaskbarSearch -Hide
TaskViewButton -Hide
TaskbarWidgets -Hide
TaskbarChat -Hide
ControlPanelView -SmallIcons
WindowsColorMode -Dark
AppColorMode -Dark
FirstLogonAnimation -Enable
JPEGWallpapersQuality -Max
TaskManagerWindow -Expanded
RestartNotification -Hide
ShortcutsSuffix -Disable
PrtScnSnippingTool -Disable
AppsLanguageSwitch -Enable
AeroShaking -Enable
UnpinTaskbarShortcuts -Shortcuts Edge, Store

#endregion UI & Personalization

#region OneDrive

OneDrive -Uninstall

#endregion OneDrive

#region System

StorageSense -Enable
StorageSenseFrequency -Default
StorageSenseTempFiles -Enable
Hibernation -Disable
Win32LongPathLimit -Enable
BSoDStopError -Enable
AdminApprovalMode -Default
MappedDrivesAppElevatedAccess -Disable
DeliveryOptimization -Enable
WaitNetworkStartup -Disable
WindowsManageDefaultPrinter -Enable
WindowsFeatures -Disable
WindowsCapabilities -Uninstall
UpdateMicrosoftProducts -Enable
PowerPlan -Balanced
LatestInstalled.NET -Disable
NetworkAdaptersSavePower -Disable
IPv6Component -Enable
InputMethod -Default
WinPrtScrFolder -Default
RecommendedTroubleshooting -Default
FoldersLaunchSeparateProcess -Disable
ReservedStorage -Enable
F1HelpPage -Disable
NumLock -Enable
CapsLock -Enable
StickyShift -Disable
Autoplay -Enable
ThumbnailCacheRemoval -Enable
SaveRestartableApps -Enable
NetworkDiscovery -Enable
ActiveHours -Automatically
RestartDeviceAfterUpdate -Disable
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "winrar") -Extension ".7z"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".aac"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".avi"
# Set-Association -ProgramPath "Photos" -Extension ".bmp"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".cc"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".cpp"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".crdownload"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".css"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".csv"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".eslintrc"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".flac"
# Set-Association -ProgramPath "Photos" -Extension ".gif"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".gitattributes"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".gitignore"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".hpp"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".htm"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".html"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".ini"
# Set-Association -ProgramPath "Photos" -Extension ".jpeg"
# Set-Association -ProgramPath "Photos" -Extension ".jpg"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".js"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".json"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".jsx"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".log"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".m3u"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".m3u8"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".m4a"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".m4r"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".m4v"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".md"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "chrome") -Extension ".mht"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "chrome") -Extension ".mhtml"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".mkv"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".mov"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".mp2"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".mp3"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".mp4"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".mp4v"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".mpa"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".mpe"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".mpeg"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".mpg"
Set-Association -ProgramPath "C:\Windows\System32\notepad.exe" -Extension ".nfo"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".ogg"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".ogm"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".ogv"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".ogx"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "chrome") -Extension ".pdf"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".php"
# Set-Association -ProgramPath "Photos" -Extension ".png"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".ps1"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".psd1"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".psm1"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "winrar") -Extension ".rar"
# Set-Association -ProgramPath "Photos" -Extension ".raw"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".sql"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".srt"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "chrome") -Extension ".svg"
# Set-Association -ProgramPath "Photos" -Extension ".tif"
# Set-Association -ProgramPath "Photos" -Extension ".tiff"
Set-Association -ProgramPath "C:\Windows\System32\notepad.exe" -Extension ".txt"
# Set-Association -ProgramPath "InternetShortcut" -Extension ".url"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".wav"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".webm"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".wma"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".wmv"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "vlc") -Extension ".wpl"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "chrome") -Extension ".xht"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "chrome") -Extension ".xhtml"
Set-Association -ProgramPath (GetInstalledProgramPath -ProgramName "visual studio code") -Extension ".xml"
# Set-Association -ProgramPath "CompressedFolder" -Extension ".zip"
DefaultTerminalApp -WindowsTerminal
InstallVCRedistx64

#endregion System

#region Start menu

RunPowerShellShortcut -Elevated
UnpinAllStartApps

#endregion Start menu

#region UWP apps

# HEIF -Install
CortanaAutostart -Disable
TeamsAutostart -Disable
UninstallUWPApps -ForAllUsers
CheckUWPAppsUpdates

#endregion UWP apps

#region Gaming

XboxGameBar -Disable
XboxGameTips -Disable
GPUScheduling -Enable

#endregion Gaming

#region Scheduled tasks

# CleanupTask -Register
# SoftwareDistributionTask -Register
# TempTask -Register

#endregion Scheduled tasks

#region Microsoft Defender & Security

NetworkProtection -Enable
PUAppsDetection -Enable
DefenderSandbox -Enable
AuditProcess -Disable
CommandLineProcessAudit -Disable
EventViewerCustomView -Disable
PowerShellModulesLogging -Disable
PowerShellScriptsLogging -Disable
AppsSmartScreen -Enable
SaveZoneInformation -Enable
WindowsScriptHost -Disable
WindowsSandbox -Enable
DismissMSAccount
DismissSmartScreenFilter

#endregion Microsoft Defender & Security

#region Context menu

MSIExtractContext -Hide
CABInstallContext -Hide
RunAsDifferentUserContext -Hide
CastToDeviceContext -Show
ShareContext -Show
EditWithPhotosContext -Show
CreateANewVideoContext -Show
PrintCMDContext -Show
IncludeInLibraryContext -Show
SendToContext -Show
BitLockerContext -Show
CompressedFolderNewContext -Show
MultipleInvokeContext -Disable
UseStoreOpenWith -Hide
OpenWindowsTerminalContext -Show
OpenWindowsTerminalAdminContext -Hide
Windows10ContextMenu -Disable

#endregion Context menu

#region Custom

GeneralConfiguration
ResumeAtRebootTask

#endregion Custom

RefreshEnvironment
Errors

Reboot
