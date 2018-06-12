function Publish-ModuleToNuGetGallery {
    [CmdletBinding(PositionalBinding = $True)]
    Param
    (
        [Parameter(Mandatory = $False)]
        [string]$Path = (Get-Location | Select-Object -ExpandProperty Path),

        [Parameter(Mandatory = $False)]
        [string]$NuGetApiKey = (Get-MKPowerShellSetting -Name 'NuGetApiKey'),
        
        [Parameter(Mandatory = $False)]
        [string[]]$Exclude = ('.git', '.vscode', '.gitignore'),
        
        [switch]$DoNotConfirm,

        [switch]$WhatIf
    )

    $Confirm = ($DoNotConfirm.IsPresent -eq $False)

    # ignore .psd1, just concerned about module's root directory
    if ((Test-Path -Path $Path -PathType Container) -eq $False) {
        $Path = Split-Path -Path $Path -Parent -Resolve
    }

    # pick the first directory of $Env:PSModulePath and add the module's root directory name to it
    $ModuleDirectoryName = (Split-Path -Path $Path -Leaf)
    $DestinationDirectory = Join-Path -Path ($Env:PSModulePath.Split(';')[0]) -ChildPath $ModuleDirectoryName

    # if it exists in $Env:PSModulePath[0], remove it
    if ((Test-Path -Path $DestinationDirectory -PathType Container) -eq $True) {
        Remove-Item $DestinationDirectory -Recurse -Force -Verbose:$($Verbose.IsPresent -or $WhatIf.IsPresent)
    }
    
    # copy items to deploy directory
    Copy-Item -Path $Path -Exclude $Exclude -Destination $DestinationDirectory -Recurse -Verbose:$($Verbose.IsPresent -or $WhatIf.IsPresent)
    # TODO: not sure why Exclude isnt working other than similar Get-ChildItems issue PowerShell has
    $Exclude | ForEach-Object {
        Join-Path -Path $DestinationDirectory -ChildPath $_
    } | Remove-Item -Force -Confirm:$False -Recurse -ErrorAction SilentlyContinue 
    
    # Mask all but the last 8 chracters for Write-Information
    $RedactedNuGetApiKey = $NuGetApiKey.Remove(0, 23).Insert(0, 'XXXXXXXX-XXXX-XXXX-XXXX')
    Write-Information "Will be using the following value for NuGet API Key: $RedactedNuGetApiKey" -InformationAction Continue

    Publish-Module -Path $DestinationDirectory -NuGetApiKey $NuGetApiKey -Confirm:$Confirm -WhatIf:$WhatIf.IsPresent -Verbose:$($Verbose.IsPresent -or $WhatIf.IsPresent)
    
    # teardown
    Remove-Item $DestinationDirectory -Recurse -Force -Verbose:$($Verbose.IsPresent -or $WhatIf.IsPresent)
}