---
external help file: PowerBolt-help.xml
Module Name: PowerBolt
online version: https://github.com/marckassay/PowerBolt/blob/0.0.4/docs/Build-Documentation.md
schema: 2.0.0
---

# Build-Documentation

## SYNOPSIS
Creates or updates help documentation files and module's README file. Also creates a XML based help documentation file for PowerShell.

## SYNTAX

### ByPath (Default)
```
Build-Documentation [[-Path] <String>] [-MarkdownFolder <String>] [-Locale <String>]
 [-OnlineVersionUrlTemplate <String>] [-OnlineVersionUrlPolicy <String>] [-NoReImportModule] [-Force]
 [<CommonParameters>]
```

### ByName
```
Build-Documentation [-MarkdownFolder <String>] [-Locale <String>] [-OnlineVersionUrlTemplate <String>]
 [-OnlineVersionUrlPolicy <String>] [-NoReImportModule] [-Force] [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
With required [`PlatyPS`](https://github.com/PowerShell/platyPS) module, this function will generate Markdown help documentation files (such as the file where you are reading this from) and update or create a README.md file with new functions from the help docs. Also this generates a new PowerShell help doc file that is used in the CLI.

## EXAMPLES

### Example 1
```powershell
PS C:\Users\Alice\PowerSploit> Build-Documentation
```

Builds documentation for the PowerSploit module with default parameters.

## PARAMETERS

### -Force
{{Fill Force Description}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Locale
The name of the folder where PowerShell XML file will reside.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: en-US
Accept pipeline input: False
Accept wildcard characters: False
```

### -MarkdownFolder
A relative path of module's folder where the Markdown files reside or will reside.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: docs
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
If the module is already imported, the value is the name of the module.

```yaml
Type: String
Parameter Sets: ByName
Aliases:
Accepted values: CimCmdlets, Microsoft.PowerShell.Management, Microsoft.PowerShell.Utility, Pester, Plaster, platyPS, posh-git, PowerBolt, PSReadLine

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoReImportModule
By default this function will re-import module to get the latest changes to that modules source code.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OnlineVersionUrlPolicy
{{Fill OnlineVersionUrlPolicy Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Auto, Omit

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OnlineVersionUrlTemplate
{{Fill OnlineVersionUrlTemplate Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Folder that contains a module.

```yaml
Type: String
Parameter Sets: ByPath
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### MKPowerShellDocObject

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Build-Documentation.ps1](https://github.com/marckassay/PowerBolt/blob/0.0.4/src/documentation/Build-Documentation.ps1)

[Build-Documentation.Tests.ps1](https://github.com/marckassay/PowerBolt/blob/0.0.4/test/documentation/Build-Documentation.Tests.ps1)

[`Build-PlatyPSMarkdown`](https://github.com/marckassay/PowerBolt/blob/0.0.4/docs/Build-PlatyPSMarkdown.md)

[`New-ExternalHelpFromPlatyPSMarkdown`](https://github.com/marckassay/PowerBolt/blob/0.0.4/docs/New-ExternalHelpFromPlatyPSMarkdown.md)

[`Update-ReadmeFromPlatyPSMarkdown`](https://github.com/marckassay/PowerBolt/blob/0.0.4/docs/Update-ReadmeFromPlatyPSMarkdown.md)
