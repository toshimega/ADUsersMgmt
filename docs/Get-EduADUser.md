---
external help file: EduADUsers-help.xml
Module Name: EduADUsers
online version:
schema: 2.0.0
---

# Get-EduADUser

## SYNOPSIS
{{ O comando pesquisa utilizadores no Active Directory e devolve os mesmos para a consola, caso existam, baseado em valores de pesquisa em ficheiro CSV, ou por valor singular. 
}}

## SYNTAX
    Get-EduADUser
    [-Value <psobject>]
    [-Attribute <string>]
    [-CSVFilePath <string>]

    Get-EduADUser
    [-Attribute <string>]
    [-CSVFilePath <string>]

### file
```
Get-EduADUser [-Attribute <String>] [-CSVFilePath <String>] [<CommonParameters>]
```

### value
```
Get-EduADUser -Attribute <String> [-Value] <PSObject> [<CommonParameters>]
```

## DESCRIPTION
{{ O comando Get-EduADUser utiliza as capacidades de filtragem do CmdLet Get-ADUser para definir e passar parametros referenciando o parametro original de pesquisa.
Desta forma torna-se desnecessário escrever a syntax de filtragem, tornando as pesquisas uniformes entre si.  }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{
    Get-EduADUser -Attribute SamAccountName -CSVFilePath C:\Scripts\SamsEDU.csv
 }}
```
{{ Obtém os utilizadores existentes baseado em dados num ficheiro .CSV }}

## PARAMETERS

### -Attribute
{{ Valor do atributo a utilizar para referenciar a pesquisa.
Se pretende obter os dados de um utilizador por numero de contribuinte, utiliza: -Attribute EmployeeType, se pelo SamAccountName o respetivo, etc. }}

```yaml
Type: String
Parameter Sets: file
Aliases: At, Attr
Accepted values: EmployeeType, SamAccountName, UserPrincipalName, EmailAddress

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: value
Aliases: At, Attr
Accepted values: EmployeeType, SamAccountName, UserPrincipalName, EmailAddress

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CSVFilePath
{{ Caminho, em texto, para a localização no sistema onde se encontra o ficheiro CSV com os dados a pesquisar. }}

```yaml
Type: String
Parameter Sets: file
Aliases: File, Path

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Value
{{ Valor do atributo a pesquisar, por exemplo, -EmployeeType '999999999'. }}

```yaml
Type: PSObject
Parameter Sets: value
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

### System.String

### System.Management.Automation.PSObject

## OUTPUTS

### Microsoft.ActiveDirectory.Management.ADUser

## NOTES

## RELATED LINKS
