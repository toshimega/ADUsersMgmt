---
external help file: ADUserMgmt-help.xml
Module Name: ADUserMgmt
online version:
schema: 2.0.0
---

# Edit-AllPunctuation

## SYNOPSIS
{{ Replaces all existing punctuated characters in a given powershell string(s) with its non punctuated counterpart, as present on the dictionary hardcoded, PT (pt-latin1) }}

## SYNTAX

```
Edit-AllPunctuation [-InputString] <String[]> [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{  Edit-AllPunctuation -InputString 'Olá, Estão caçando código aberto? Têm aqui'
-Output:  Ola, Estao cacando codigo aberto? Tem aqui }}
```

{{ Accepting a punctuated string, using the parameter InputString }}

## PARAMETERS

### -InputString
Introduza a frase ou conjunto de frases, para as quais pretende substituir caracteres com pontuação, por mesmo caracter sem pontuação

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
