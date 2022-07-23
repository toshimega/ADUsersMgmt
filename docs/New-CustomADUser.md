---
external help file: adusers-helpers-help.xml
Module Name: adusers-helpers
online version:
schema: 2.0.0
---

# New-CustomADUser

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

```
New-CustomADUser [[-InputObject] <PSObject[]>] -OrganizationalUnit <String> [-Password <SecureString>]
 [-DomainFQDN <String>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -DomainFQDN
{{ Fill DomainFQDN Description }}

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

### -InputObject
{{ Fill InputObject Description }}

```yaml
Type: PSObject[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -OrganizationalUnit
{{ Fill OrganizationalUnit Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Students, Teachers, Employees

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
{{ Fill Password Description }}

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Management.Automation.PSObject[]
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
