# ------------------------------------------------------ #
# -          Functions with dialog to replace          - #
# ------------------------------------------------------ #
# - ScheduledTasks
# - WindowsFeatures
# - WindowsCapabilities
# - WSL
# - UninstallUWPApps
# - RestoreUWPApps (unused)



$WSLDistroName = "Ubuntu-20.04"



#region Utility
function GetInstalledProgramPath {
  [CmdletBinding()]
  param
  (
    [Parameter(
      Mandatory = $true,
      Position = 0
    )]
    [String]
    $ProgramName
  )

  $PotentialExecutablePath = Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" |
    Where-Object { $null -ne $_.getValue("DisplayIcon") -and $_.getValue('DisplayName') -like "*" + $ProgramName.replace(" ", "*") + "*" } |
    ForEach-Object { $_.getValue("DisplayIcon").Trim('"') }

  if (-not $PotentialExecutablePath) {
    $PotentialExecutablePath = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths" |
      Where-Object { $null -ne $_.getValue("") -and $_.getValue("") -like "*" + $ProgramName.replace(" ", "*") + "*" } |
      ForEach-Object { $_.getValue("").Trim('"') }
  }

  return $PotentialExecutablePath
}
#endregion Utility



#region Privacy & Telemetry
<#
	.SYNOPSIS
	The diagnostics tracking scheduled tasks

	.PARAMETER Disable
	Turn off the diagnostics tracking scheduled tasks

	.PARAMETER Enable
	Turn on the diagnostics tracking scheduled tasks

	.EXAMPLE
	ScheduledTasks -Disable

	.EXAMPLE
	ScheduledTasks -Enable

	.NOTES
	A pop-up dialog box lets a user select tasks

	.NOTES
	Current user
#>
function ScheduledTasks {
  param
  (
    [Parameter(
      Mandatory = $true,
      ParameterSetName = "Disable"
    )]
    [switch]
    $Disable,

    [Parameter(
      Mandatory = $true,
      ParameterSetName = "Enable"
    )]
    [switch]
    $Enable
  )

  #region Variables
  # The following tasks will have their checkboxes checked
  [string[]]$CheckedScheduledTasks = @(
    # Collects program telemetry information if opted-in to the Microsoft Customer Experience Improvement Program
    "ProgramDataUpdater",

    # This task collects and uploads autochk SQM data if opted-in to the Microsoft Customer Experience Improvement Program
    "Proxy",

    # If the user has consented to participate in the Windows Customer Experience Improvement Program, this job collects and sends usage data to Microsoft
    "Consolidator",

    # The USB CEIP (Customer Experience Improvement Program) task collects Universal Serial Bus related statistics and information about your machine and sends it to the Windows Device Connectivity engineering group at Microsoft
    "UsbCeip",

    # The Windows Disk Diagnostic reports general disk and system information to Microsoft for users participating in the Customer Experience Program
    "Microsoft-Windows-DiskDiagnosticDataCollector",

    # This task shows various Map related toasts
    "MapsToastTask",

    # This task checks for updates to maps which you have downloaded for offline use
    "MapsUpdateTask",

    # Initializes Family Safety monitoring and enforcement
    "FamilySafetyMonitor",

    # Synchronizes the latest settings with the Microsoft family features service
    "FamilySafetyRefreshTask",

    # XblGameSave Standby Task
    "XblGameSaveTask"
  )

  # Check if device has a camera
  $DeviceHasCamera = Get-CimInstance -ClassName Win32_PnPEntity | Where-Object -FilterScript { (($_.PNPClass -eq "Camera") -or ($_.PNPClass -eq "Image")) -and ($_.Service -ne "StillCam") }
  if (-not $DeviceHasCamera) {
    # Windows Hello
    $CheckedScheduledTasks += "FODCleanupTask"
  }
  #endregion Variables

  #region Functions
  function DisableButton {
    Write-Information -MessageData "" -InformationAction Continue
    Write-Verbose -Message $Localization.Patient -Verbose

    $Tasks | ForEach-Object -Process { Write-Verbose $_.TaskName -Verbose }
    $Tasks | Disable-ScheduledTask
  }

  function EnableButton {
    Write-Information -MessageData "" -InformationAction Continue
    Write-Verbose -Message $Localization.Patient -Verbose

    $Tasks | ForEach-Object -Process { Write-Verbose $_.TaskName -Verbose }
    $Tasks | Enable-ScheduledTask
  }
  #endregion Functions

  switch ($PSCmdlet.ParameterSetName) {
    "Enable" {
      $State = "Disabled"
    }
    "Disable" {
      $State = "Ready"
    }
  }

  Write-Information -MessageData "" -InformationAction Continue
  Write-Verbose -Message $Localization.Patient -Verbose

  # Getting list of all scheduled tasks according to the conditions
  $Tasks = Get-ScheduledTask | Where-Object -FilterScript { ($_.State -eq $State) -and ($_.TaskName -in $CheckedScheduledTasks) }

  if (-not ($Tasks)) {
    Write-Information -MessageData "" -InformationAction Continue
    Write-Verbose -Message $Localization.NoData -Verbose

    return
  }

  switch ($PSCmdlet.ParameterSetName) {
    "Enable" {
      EnableButton
    }
    "Disable" {
      DisableButton
    }
  }
}
#endregion Privacy & Telemetry



#region Programs
function InstallPrograms {
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
  # choco feature enable -n=useRememberedArgumentsForUpgrades
  # choco install -y -f geforce-game-ready-driver --package-parameters="'/dch'"
  choco install -y -f --accept-license `
    googlechrome `
    vlc `
    vscode `
    winrar `
    firefox `
    git `
    ccleaner `
    teamviewer `
    slack `
    windirstat `
    whatsapp `
    discord `
    epicgameslauncher `
    notion `
    deepl `
    itunes

  # Google Drive
  choco install -y -f --accept-license google-drive-file-stream

  # Close Google Drive login window
  Start-Sleep -Seconds 2
  Stop-Process -Name 'GoogleDriveFS' -ErrorAction Ignore
  CloseWindowOfProcessAtStartup -ProcessName 'GoogleDriveFS'

  # Docker Desktop
  choco install -y -f --accept-license docker-desktop

  # Close Docker Desktop agreement window
  Get-Process -Name 'Docker Desktop' -ErrorAction Ignore | Where-Object { $_.MainWindowTitle -eq 'Docker Desktop' } | Stop-Process -ErrorAction Ignore
  CloseWindowOfProcessAtStartup -ProcessName 'Docker Desktop' -WithWhere

  # GOG
  choco install -y -f --accept-license goggalaxy

  # Close GOG login window
  Stop-Process -Name 'GalaxyClient' -ErrorAction Ignore
  CloseWindowOfProcessAtStartup -ProcessName 'GalaxyClient'

  # PowerToys
  choco install -y -f --accept-license powertoys

  # Close PowerToys settings window
  Stop-Process -Name 'PowerToys.Settings' -ErrorAction Ignore
  CloseWindowOfProcessAtStartup -ProcessName 'PowerToys.Settings'

  # Hack: Spotify installation fails randomly
  do {
    choco install -y -f --accept-license spotify

    if (-not (Get-Item -Path "$Home\Desktop\Spotify.lnk" -ErrorAction Ignore)) {
      Stop-Process -Name SpotifyFullSetup, SpWebInst0 -ErrorAction Ignore
    }
  } until (Get-Item -Path "$Home\Desktop\Spotify.lnk" -ErrorAction Ignore)

  # Close Spotify login window
  Get-Process -Name 'Spotify' -ErrorAction Ignore | Where-Object { $_.MainWindowTitle -eq 'Spotify' } | Stop-Process -ErrorAction Ignore
  CloseWindowOfProcessAtStartup -ProcessName 'Spotify' -WithWhere

    # ----- Non working packages ----- #
    # geforce-experience
    # ubisoft-connect
    # leagueoflegendseuw
    # ----- Non working packages ----- #
}
#endregion Programs



#region System
<#
	.SYNOPSIS
	Windows features

	.PARAMETER Disable
	Disable Windows features

	.PARAMETER Enable
	Enable Windows features

	.EXAMPLE
	WindowsFeatures -Disable

	.EXAMPLE
	WindowsFeatures -Enable

	.NOTES
	A pop-up dialog box lets a user select features

	.NOTES
	Current user
#>
function WindowsFeatures {
  param
  (
    [Parameter(
      Mandatory = $true,
      ParameterSetName = "Disable"
    )]
    [switch]
    $Disable,

    [Parameter(
      Mandatory = $true,
      ParameterSetName = "Enable"
    )]
    [switch]
    $Enable
  )

  #region Variables
  [string[]]$SelectedFeatures = @(
    # Legacy Components
    "LegacyComponents",

    # PowerShell 2.0
    "MicrosoftWindowsPowerShellV2",
    "MicrosoftWindowsPowershellV2Root",

    # Microsoft XPS Document Writer
    "Printing-XPSServices-Features",

    # Work Folders Client
    "WorkFolders-Client"

    # Media Features
    # If you want to leave "Multimedia settings" in the advanced settings of Power Options do not disable this feature
    "MediaPlayback"
  )
  #endregion Variables

  #region Functions
  function DisableButton {
    Write-Information -MessageData "" -InformationAction Continue
    Write-Verbose -Message $Localization.Patient -Verbose

    $Features | ForEach-Object -Process { Write-Verbose $_.DisplayName -Verbose }
    $Features | Disable-WindowsOptionalFeature -Online -NoRestart
  }

  function EnableButton {
    Write-Information -MessageData "" -InformationAction Continue
    Write-Verbose -Message $Localization.Patient -Verbose

    $Features | ForEach-Object -Process { Write-Verbose -Message $_.DisplayName -Verbose }
    $Features | Enable-WindowsOptionalFeature -Online -NoRestart
  }
  #endregion Functions

  switch ($PSCmdlet.ParameterSetName) {
    "Enable" {
      $State = @("Disabled", "DisablePending")
    }
    "Disable" {
      $State = @("Enabled", "EnablePending")
    }
  }

  Write-Information -MessageData "" -InformationAction Continue
  Write-Verbose -Message $Localization.Patient -Verbose

  # Getting list of all optional features according to the conditions
  $OFS = "|"
  $Features = Get-WindowsOptionalFeature -Online | Where-Object -FilterScript {
		($_.State -in $State) -and ($_.FeatureName -match $SelectedFeatures)
  } | ForEach-Object -Process { Get-WindowsOptionalFeature -FeatureName $_.FeatureName -Online }
  $OFS = " "

  if (-not ($Features)) {
    Write-Information -MessageData "" -InformationAction Continue
    Write-Verbose -Message $Localization.NoData -Verbose

    return
  }

  switch ($PSCmdlet.ParameterSetName) {
    "Enable" {
      EnableButton
    }
    "Disable" {
      DisableButton
    }
  }
}

<#
	.SYNOPSIS
	Optional features

	.PARAMETER Uninstall
	Uninstall optional features

	.PARAMETER Install
	Install optional features

	.EXAMPLE
	WindowsCapabilities -Uninstall

	.EXAMPLE
	WindowsCapabilities -Install

	.NOTES
	A pop-up dialog box lets a user select features

	.NOTES
	Current user
#>
function WindowsCapabilities {
  param
  (
    [Parameter(
      Mandatory = $true,
      ParameterSetName = "Uninstall"
    )]
    [switch]
    $Uninstall,

    [Parameter(
      Mandatory = $true,
      ParameterSetName = "Install"
    )]
    [switch]
    $Install
  )

  #region Variables
  # The following optional features will have their checkboxes checked
  [string[]]$CheckedCapabilities = @(
    # Steps Recorder
    "App.StepsRecorder*",

    # Microsoft Quick Assist
    "App.Support.QuickAssist*",

    # WordPad
    "Microsoft.Windows.WordPad*"

    # Internet Explorer mode
    "Browser.InternetExplorer*",

    # Math Recognizer
    "MathRecognizer*",

    # Windows Media Player
    # If you want to leave "Multimedia settings" element in the advanced settings of Power Options do not uninstall this feature
    "Media.WindowsMediaPlayer*",

    # OpenSSH Client
    "OpenSSH.Client*"
  )

  # The following optional features will be excluded from the display
  [string[]]$ExcludedCapabilities = @(
    # The DirectX Database to configure and optimize apps when multiple Graphics Adapters are present
    "DirectX.Configuration.Database*",

    # Language components
    "Language.*",

    # Notepad
    "Microsoft.Windows.Notepad*",

    # Mail, contacts, and calendar sync component
    "OneCoreUAP.OneSync*",

    # Windows PowerShell Intergrated Scripting Enviroment
    "Microsoft.Windows.PowerShell.ISE*",

    # Management of printers, printer drivers, and printer servers
    "Print.Management.Console*",

    # Features critical to Windows functionality
    "Windows.Client.ShellComponents*"
  )
  #endregion Variables

  #region Functions
  function UninstallButton {
    Write-Information -MessageData "" -InformationAction Continue
    Write-Verbose -Message $Localization.Patient -Verbose

    $Capabilities | ForEach-Object -Process { Write-Verbose -Message $_.DisplayName -Verbose }
    $Capabilities | Where-Object -FilterScript { $_.Name -in (Get-WindowsCapability -Online).Name } | Remove-WindowsCapability -Online

    if ([string]$Capabilities.Name -match "Browser.InternetExplorer") {
      Write-Information -MessageData "" -InformationAction Continue
      Write-Warning -Message $Localization.RestartWarning
    }
  }

  function InstallButton {
    Write-Information -MessageData "" -InformationAction Continue
    Write-Verbose -Message $Localization.Patient -Verbose

    $Capabilities | ForEach-Object -Process { Write-Verbose -Message $_.DisplayName -Verbose }
    $Capabilities | Where-Object -FilterScript { $_.Name -in ((Get-WindowsCapability -Online).Name) } | Add-WindowsCapability -Online

    if ([string]$Capabilities.Name -match "Browser.InternetExplorer") {
      Write-Information -MessageData "" -InformationAction Continue
      Write-Warning -Message $Localization.RestartWarning
    }
  }
  #endregion Functions

  switch ($PSCmdlet.ParameterSetName) {
    "Install" {
      try {
        # Check the internet connection
        $Parameters = @{
          Uri              = "https://www.google.com"
          Method           = "Head"
          DisableKeepAlive = $true
          UseBasicParsing  = $true
        }

        if (-not (Invoke-WebRequest @Parameters).StatusDescription) {
          return
        }

        $State = "NotPresent"
      }
      catch [System.Net.WebException] {
        Write-Warning -Message $Localization.NoInternetConnection
        Write-Error -Message $Localization.NoInternetConnection -ErrorAction SilentlyContinue

        Write-Error -Message ($Localization.RestartFunction -f $MyInvocation.Line) -ErrorAction SilentlyContinue
      }
    }
    "Uninstall" {
      $State = "Installed"
    }
  }

  Write-Information -MessageData "" -InformationAction Continue
  Write-Verbose -Message $Localization.Patient -Verbose

  # Getting list of all capabilities according to the conditions
  $OFS = "|"
  $Capabilities = Get-WindowsCapability -Online | Where-Object -FilterScript {
		($_.State -eq $State) -and (($_.Name -match $CheckedCapabilities) -and ($_.Name -notmatch $ExcludedCapabilities))
  } | ForEach-Object -Process { Get-WindowsCapability -Name $_.Name -Online }
  $OFS = " "

  if (-not ($Capabilities)) {
    Write-Information -MessageData "" -InformationAction Continue
    Write-Verbose -Message $Localization.NoData -Verbose

    return
  }

  switch ($PSCmdlet.ParameterSetName) {
    "Install" {
      InstallButton
    }
    "Uninstall" {
      UninstallButton
    }
  }
}

<#
	.SYNOPSIS
	Default terminal app

	.PARAMETER WindowsTerminal
	Set Windows Terminal as default terminal app to host the user interface for command-line applications

	.PARAMETER ConsoleHost
	Set Windows Console Host as default terminal app to host the user interface for command-line applications

	.EXAMPLE
	DefaultTerminalApp -WindowsTerminal

	.EXAMPLE
	DefaultTerminalApp -ConsoleHost

	.NOTES
	Current user
#>
function DefaultTerminalApp {
  param
  (
    [Parameter(
      Mandatory = $true,
      ParameterSetName = "WindowsTerminal"
    )]
    [switch]
    $WindowsTerminal,

    [Parameter(
      Mandatory = $true,
      ParameterSetName = "ConsoleHost"
    )]
    [switch]
    $ConsoleHost
  )

  switch ($PSCmdlet.ParameterSetName) {
    "WindowsTerminal" {
      $Package = Get-AppxPackage -Name Microsoft.WindowsTerminal

      if ($Package) {
        if (-not (Test-Path -Path "HKCU:\Console\%%Startup")) {
          New-Item -Path "HKCU:\Console\%%Startup" -Force
        }

        # Find the current GUID of Windows Terminal
        Get-ChildItem -Path "HKLM:\SOFTWARE\Classes\PackagedCom\Package\$Package\Class" | ForEach-Object -Process {
          if ((Get-ItemPropertyValue -Path $_.PSPath -Name ServerId) -eq 0) {
            New-ItemProperty -Path "HKCU:\Console\%%Startup" -Name DelegationConsole -PropertyType String -Value $_.PSChildName -Force
          }

          if ((Get-ItemPropertyValue -Path $_.PSPath -Name ServerId) -eq 1) {
            New-ItemProperty -Path "HKCU:\Console\%%Startup" -Name DelegationTerminal -PropertyType String -Value $_.PSChildName -Force
          }
        }
      }
    }
    "ConsoleHost" {
      New-ItemProperty -Path "HKCU:\Console\%%Startup" -Name DelegationConsole -PropertyType String -Value "{00000000-0000-0000-0000-000000000000}" -Force
      New-ItemProperty -Path "HKCU:\Console\%%Startup" -Name DelegationTerminal -PropertyType String -Value "{00000000-0000-0000-0000-000000000000}" -Force
    }
  }
}
#endregion System



#region WSL
<#
	.SYNOPSIS
	Windows Subsystem for Linux (WSL)

	.PARAMETER Install
	Enable Windows Subsystem for Linux (WSL), install the latest WSL Linux kernel version, and a Linux distribution using a pop-up form

	.EXAMPLE
	WSL

	.NOTES
	To receive kernel updates, enable the Windows Update setting: "Receive updates for other Microsoft products"

	.NOTES
	Machine-wide
#>
function WSL {



  # NEED TO RESTART HERE



  Write-Output "Start installing WSL by running: wsl.exe --install --distribution $WSLDistroName"

  wsl.exe --install --distribution $WSLDistroName

  Write-Output "Finished installing WSL"

  # Receive updates for other Microsoft products when you update Windows
	(New-Object -ComObject Microsoft.Update.ServiceManager).AddService2("7971f918-a847-4430-9279-4a52d1efe18d", 7, "")
}
#endregion WSL



#region UWP apps
<#
	.SYNOPSIS
	Uninstall UWP apps

	.PARAMETER ForAllUsers
	The "ForAllUsers" argument sets a checkbox to unistall packages for all users

	.EXAMPLE
	UninstallUWPApps

	.EXAMPLE
	UninstallUWPApps -ForAllUsers

	.NOTES
	Current user
#>
function UninstallUWPApps {
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory = $false)]
    [switch]
    $ForAllUsers
  )

  #region Variables
  # The following UWP apps will have their checkboxes unchecked
  # $PackagesToRemove = @(
  #   # AMD Radeon UWP panel
  #   "AdvancedMicroDevicesInc*",

  #   # Intel Graphics Control Center
  #   "AppUp.IntelGraphicsControlPanel",
  #   "AppUp.IntelGraphicsExperience",

  #   # Sticky Notes
  #   "Microsoft.MicrosoftStickyNotes",

  #   # Photos (and Video Editor)
  #   "Microsoft.Photos.MediaEngineDLC",

  #   # HEVC Video Extensions from Device Manufacturer
  #   "Microsoft.HEVCVideoExtension",

  #   # Web Media Extensions
  #   "Microsoft.WebMediaExtensions",

  #   # Windows Camera
  #   "Microsoft.WindowsCamera",

  #   # Xbox Speech To Text Overlay
  #   "Microsoft.XboxSpeechToTextOverlay",

  #   # Xbox Game Bar
  #   "Microsoft.XboxGamingOverlay",

  #   # Xbox Game Bar Plugin
  #   "Microsoft.XboxGameOverlay",

  #   # Realtek Audio Console
  #   "RealtekSemiconductorCorp.RealtekAudioControl"
  # )

  # The following UWP apps will be excluded from the display
  $ExcludedAppxPackages = @(
    "AD2F1837.HPPrinterControl",
    "AnywaySoftInc.FreeColorPicker",
    "AppleInc.iTunes",
    "CanonicalGroupLimited.UbuntuonWindows",

    # Microsoft Desktop App Installer
    "Microsoft.DesktopAppInstaller",

    # Xbox
    "Microsoft.GamingApp",
    "Microsoft.GamingServices",

    "Microsoft.MicrosoftMinesweeper",
    "Microsoft.MicrosoftSolitaireCollection",

    # Paint
    "Microsoft.Paint",

    # Screen Sketch
    "Microsoft.ScreenSketch",

    # Store Experience Host
    "Microsoft.StorePurchaseApp",

    # Photos (and Video Editor)
    "Microsoft.Windows.Photos",

    # Calculator
    "Microsoft.WindowsCalculator",

    # Notepad
    "Microsoft.WindowsNotepad",

    # Microsoft Store
    "Microsoft.WindowsStore",

    # Windows Terminal
    "Microsoft.WindowsTerminal",
    "Microsoft.WindowsTerminalPreview",

    # Xbox TCUI
    "Microsoft.Xbox.TCUI",

    # Xbox Console Companion
    "Microsoft.XboxApp",

    # Xbox Identity Provider
    "Microsoft.XboxIdentityProvider",

    # NVIDIA Control Panel
    "NVIDIACorp.NVIDIAControlPanel",

    "RollingDonutApps.PinballStar"
  )
  #endregion Variables

  #region Functions
  function Get-AppxBundle {
    [CmdletBinding()]
    param
    (
      [string[]]
      $Exclude,

      [switch]
      $AllUsers
    )

    Write-Information -MessageData "" -InformationAction Continue
    Write-Verbose -Message $Localization.Patient -Verbose

    $AppxPackages = @(Get-AppxPackage -PackageTypeFilter Bundle -AllUsers:$AllUsers | Where-Object -FilterScript { $_.Name -notin $ExcludedAppxPackages })

    # The Bundle packages contains no Microsoft Teams
    if (Get-AppxPackage -Name MicrosoftTeams -AllUsers:$AllUsers) {
      # Temporarily hack: due to the fact that there are actually two Microsoft Teams packages, we need to choose the first one to display
      $AppxPackages += Get-AppxPackage -Name MicrosoftTeams -AllUsers:$AllUsers | Select-Object -Index 0
    }

    # The Bundle packages contains no Spotify
    if (Get-AppxPackage -Name SpotifyAB.SpotifyMusic -AllUsers:$AllUsers) {
      # Temporarily hack: due to the fact that there are actually two Microsoft Teams packages, we need to choose the first one to display
      $AppxPackages += Get-AppxPackage -Name SpotifyAB.SpotifyMusic -AllUsers:$AllUsers | Select-Object -Index 0
    }

    $PackagesIds = [Windows.Management.Deployment.PackageManager, Windows.Web, ContentType = WindowsRuntime]::new().FindPackages() | Select-Object -Property DisplayName -ExpandProperty Id | Select-Object -Property Name, DisplayName

    foreach ($AppxPackage in $AppxPackages) {
      $PackageId = $PackagesIds | Where-Object -FilterScript { $_.Name -eq $AppxPackage.Name }

      if (-not $PackageId) {
        continue
      }

      $AppxPackage.PackageFullName
    }
  }

  function ButtonUninstallClick {
    Write-Information -MessageData "" -InformationAction Continue
    Write-Verbose -Message $Localization.Patient -Verbose

    # If Xbox Game Bar is selected to uninstall stop its' processes
    if ($PackagesToRemove -match "Microsoft.XboxGamingOverlay") {
      Get-Process -Name GameBar, GameBarFTServer -ErrorAction Ignore | Stop-Process -Force
    }

    $PackagesToRemove | Remove-AppxPackage -AllUsers:$ForAllUsers -Verbose
  }
  #endregion Functions

  $PackagesToRemove = Get-AppxBundle -Exclude $ExcludedAppxPackages -AllUsers:$ForAllUsers


  ButtonUninstallClick
}
#endregion UWP apps


# ------------------------------------------------------ #
# -                Functions to rewrite                - #
# ------------------------------------------------------ #
# - RefreshEnvironment -> Remove Toast display about Telegram group



#region Refresh Environment
function RefreshEnvironment {
  $UpdateEnvironment = @{
    Namespace        = "WinAPI"
    Name             = "UpdateEnvironment"
    Language         = "CSharp"
    MemberDefinition = @"
private static readonly IntPtr HWND_BROADCAST = new IntPtr(0xffff);
private const int WM_SETTINGCHANGE = 0x1a;
private const int SMTO_ABORTIFHUNG = 0x0002;

[DllImport("shell32.dll", CharSet = CharSet.Auto, SetLastError = false)]
private static extern int SHChangeNotify(int eventId, int flags, IntPtr item1, IntPtr item2);

[DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = false)]
private static extern IntPtr SendMessageTimeout(IntPtr hWnd, int Msg, IntPtr wParam, string lParam, int fuFlags, int uTimeout, IntPtr lpdwResult);

[DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = false)]
static extern bool SendNotifyMessage(IntPtr hWnd, uint Msg, IntPtr wParam, string lParam);

public static void Refresh()
{
	// Update desktop icons
	SHChangeNotify(0x8000000, 0x1000, IntPtr.Zero, IntPtr.Zero);

	// Update environment variables
	SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, IntPtr.Zero, null, SMTO_ABORTIFHUNG, 100, IntPtr.Zero);

	// Update taskbar
	SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, IntPtr.Zero, "TraySettings");
}

private static readonly IntPtr hWnd = new IntPtr(65535);
private const int Msg = 273;
// Virtual key ID of the F5 in File Explorer
private static readonly UIntPtr UIntPtr = new UIntPtr(41504);

[DllImport("user32.dll", SetLastError=true)]
public static extern int PostMessageW(IntPtr hWnd, uint Msg, UIntPtr wParam, IntPtr lParam);

public static void PostMessage()
{
	// Simulate pressing F5 to refresh the desktop
	PostMessageW(hWnd, Msg, UIntPtr, IntPtr.Zero);
}
"@
  }
  if (-not ("WinAPI.UpdateEnvironment" -as [type])) {
    Add-Type @UpdateEnvironment
  }

  # Simulate pressing F5 to refresh the desktop
  [WinAPI.UpdateEnvironment]::PostMessage()

  # Refresh desktop icons, environment variables, taskbar
  [WinAPI.UpdateEnvironment]::Refresh()

  # Restart the Start menu
  Stop-Process -Name StartMenuExperienceHost -Force -ErrorAction Ignore

  # Turn on Controlled folder access if it was turned off
  if ($Script:ControlledFolderAccess) {
    Set-MpPreference -EnableControlledFolderAccess Enabled
  }
}
#endregion Refresh Environment



# ------------------------------------------------------ #
# -               Functions to configure               - #
# ------------------------------------------------------ #
# - Set-Association



# ------------------------------------------------------ #
# - Functions for inspiration to write scheduled tasks - #
# ------------------------------------------------------ #
# - CleanupTask
# - SoftwareDistributionTask
# - TempTask

#region Custom
function ResumeAtRebootTask {
  $Path = "$PSScriptRoot".replace('\', '/').replace(' ', '\ ').replace('C:', 'c')
  $TaskName = "Resume setup script"

  $ResumeTask = @"
Write-Output 'Will run: wsl.exe -d $WSLDistroName -u root bash -ic ${Path}/../wsl-setup.sh $env:USERNAME ubuntu'
wsl.exe --install --distribution '$WSLDistroName'
do {
  Start-Sleep -Seconds 1
} until ((wsl.exe -l -q).length -ne 0)
Stop-Process -Name ubuntu2004, wsl -ErrorAction Ignore
wsl.exe -d '$WSLDistroName' -u root bash -ic '/mnt/${Path}/../wsl-setup.sh $env:USERNAME ubuntu'
Start-Sleep -Seconds 60
Unregister-ScheduledTask -TaskName '$TaskName' -Confirm:`$false
"@

  $Action = New-ScheduledTaskAction -Execute powershell.exe -Argument "-Command $ResumeTask"
  $Trigger = New-ScheduledTaskTrigger -AtLogOn
  $Settings = New-ScheduledTaskSettingsSet -Compatibility Win8
  $Principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -RunLevel Highest
  $Parameters = @{
    TaskName    = $TaskName
    Action      = $Action
    Trigger     = $Trigger
    Description = "Resume the setup script at reboot"
    Principal   = $Principal
    Settings    = $Settings
  }
  Register-ScheduledTask @Parameters -Force
}

function GeneralConfiguration {
  # ----- Explorer settings ----- #
  # Add Home to Quick Access
  $o = new-object -com shell.application
  $o.Namespace("$Home").Self.InvokeVerb("pintohome")
  # ----- Explorer settings ----- #

  # ----- Keyboard settings ----- #
  # Enable Num Lock
  New-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Keyboard' -Name InitialKeyboardIndicators -PropertyType DWord -Value 2 -Force
  New-ItemProperty -Path 'HKCU:\Control Panel\Keyboard' -Name InitialKeyboardIndicators -PropertyType DWord -Value 2 -Force

  # Set Keyboard delay before repeat
  New-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name KeyboardDelay -PropertyType String -Value 0 -Force

  # Set Keyboard repeat frequency
  New-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name KeyboardSpeed -PropertyType String -Value 31 -Force
  # ----- Keyboard settings ----- #

  # ----- Task Bar settings ----- #
  # Show Task Bar on all screens
  New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name MMTaskbarEnabled -PropertyType DWord -Value 1 -Force

  # Show Task Bar buttons on all screens
  New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name MMTaskbarMode -PropertyType DWord -Value 0 -Force

  # Show all windows from all desktops when Alt+Tab
  New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name VirtualDesktopAltTabFilter -PropertyType DWord -Value 0 -Force

  # Show all windows from all desktops on the Task Bar
  New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name VirtualDesktopTaskbarFilter -PropertyType DWord -Value 0 -Force

  # Hide Lang Bar in Task Bar
  Set-WinLanguageBarOption -UseLegacyLanguageBar -UseLegacySwitchMode

  if (-not (Test-Path -Path "HKCU:\Software\Microsoft\CTF\LangBar")) {
    New-Item -Path "HKCU:\Software\Microsoft\CTF\LangBar" -Force
  }
  New-ItemProperty -Path "HKCU:\Software\Microsoft\CTF\LangBar" -Name ShowStatus -PropertyType DWord -Value 3 -Force
  # ----- Task Bar settings ----- #
}

function Reboot {
  shutdown /r /f /t 0
}

function CloseWindowOfProcessAtStartup {
  [CmdletBinding()]
  param
  (
    [Parameter(
      Mandatory = $true,
      Position = 0
    )]
    [String]
    $ProcessName,

    [Parameter(
      Mandatory = $false,
      ParameterSetName = "WithWhere"
    )]
    [switch]
    $WithWhere
  )

  if ($WithWhere) {
    $GetProcessCommand = "Get-Process -Name '$ProcessName' -ErrorAction Ignore | Where-Object { `$_.MainWindowTitle -eq '$ProcessName' }"
  } else  {
    $GetProcessCommand = "Get-Process -Name '$ProcessName' -ErrorAction Ignore"
  }

  $ResumeTask = @"
`$Process = $GetProcessCommand
`$Timeout = 60
`$ElapsedTime = 0

do {
  Write-Output """Waiting... (`${ElapsedTime}s)"""
  Start-Sleep -Seconds 1
  `$Process = $GetProcessCommand
  `$ElapsedTime++

  if (`$ElapsedTime -eq `$Timeout) {
    break
  }
} until (`$Process)
Start-Sleep -Seconds 1
`$Process | Stop-Process -ErrorAction Ignore
Write-Output 'Done'
"@

  $Action = New-ScheduledTaskAction -Execute powershell.exe -Argument "-Command $ResumeTask"
  $Trigger = New-ScheduledTaskTrigger -AtLogOn
  $Settings = New-ScheduledTaskSettingsSet -Compatibility Win8
  $Principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -RunLevel Highest
  $Parameters = @{
    TaskName    = "Close $ProcessName window"
    Action      = $Action
    Trigger     = $Trigger
    Description = "Close $ProcessName window at startup"
    Principal   = $Principal
    Settings    = $Settings
  }
  Register-ScheduledTask @Parameters -Force
}
#endregion Custom



# ------------------------------------------------------ #
# -                        TODO                        - #
# ------------------------------------------------------ #
# - Write a scheduled task to restart and resume script
# - Find a way to hide Language Bar
# - Find a way to add Start Menu Folders



# ------------------------------------------------------ #
# -                      Workflow                      - #
# ------------------------------------------------------ #
# - Run the script once -> create a scheduled task to restart itself
# - Restart
