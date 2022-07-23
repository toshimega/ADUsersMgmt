---
external help file: ADUserMgmt-help.xml
Module Name: ADUserMgmt
online version:
schema: 2.0.0
---

# Get-ADUserbyAttribute

## SYNOPSIS
{{ Este comando simplifica a pesquisa de utilizadores via active directory, pela utilização de parametros invés do 'Filter' }}

## SYNTAX

```
Get-ADUserbyAttribute [-Attributes] <String> [-Value] <PSObject> [<CommonParameters>]
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

### -Attributes
{{ Fill Attributes Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: At, Attr
Accepted values: EmployeeType, SamAccountName, UserPrincipalName, EmailAddress

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value
{{ Fill Value Description }}

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases: V, Valor

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Management.Automation.PSObject
## OUTPUTS

### ADUser
## NOTES

## RELATED LINKS
