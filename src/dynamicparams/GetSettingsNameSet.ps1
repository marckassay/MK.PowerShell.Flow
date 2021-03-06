
using module .\New-DynamicParam.ps1

function GetSettingsNameSet {
    [CmdletBinding(PositionalBinding = $false)]
    Param(
        [Parameter(Mandatory = $true)]
        [String]$ConfigFilePath,

        [Parameter(Mandatory = $false)]
        [int]$Position = 0,

        [switch]$Mandatory
    )

    $Script:MKPowerShellConfig = Get-Content -Path $ConfigFilePath | ConvertFrom-Json -AsHashtable
    $SettingNames = $Script:MKPowerShellConfig | ForEach-Object { $_.Keys }

    New-DynamicParam -Name 'Name' -Position $Position -ValidateSet $SettingNames -Mandatory:$Mandatory.IsPresent
}