---
external help file: EduADUsers-help.xml
Module Name: EduADUsers
online version:
schema: 2.0.0
---

# Get-ADUserImmutableID

## SYNOPSIS
Comando "wrapper/Involucro" da aplicação de consola 'ldifde.exe', para extrair  o valor do atributo immutableID de um objeto do tipo ADUser em ambiente Microsoft Active directory.

## SYNTAX

```
Get-ADUserImmutableID [-SamAccountName] <String[]> -Destination <String> [<CommonParameters>]
```

## DESCRIPTION
O comando envia para uma localização no sistema, especificado pelo utilizador no parametro <Destination>, o valor do atributo ImmutableID.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-ADUserImmutableID -SamAccountName 'RN861025' -Destination 'c:\tmp\RN862025-immuID.txt'
```

Exemplo1: Executa a procura do ImmutableID passando o valor ao parametro SamAccountName com um exemplo previamente conhecido. 
Envia o output para 'c:\tmp\RN862025-immuID.txt'

### Example 2
```powershell
PS C:\> Get-ADUser -Identity RN861025 | Get-ADUserImmutableID -SamAccountName $_ -Destination 'c:\tmp'
```
Exemplo2: O exemplo utiliza o comando Get-ADUser para obter um objeto utilizador.
Seguidamente, utiliza a variavel automatica $_, expandindo com o .SamAccountName, e passado o valor via pipeline para o comando

### Example 3
```powershell
PS C:\> 
    $utilizadores = @('RN861025','XP198601','TT651212')
    $utilizadores | Get-ADUserImmutableID -SamAccountName $_ -Destination 'c:\tmp'
```

Exemplo3: Neste exemplo é criada uma variavel que contem 3 valores para o SamAccountName.
Seguidamente, utilizamos o "pipeline" para passar os valores contidos em "utilizadores" para o parametro -SamAccountName.
A variavel automatica $_ é utilizada para representar cada item no "pipeline".

## PARAMETERS

### -Destination
Introduz o destino e nome do ficheiro para o qual pretendes que seja escrito o resultado do comando.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SamAccountName
Valor do SamAccountName do utilizador ActiveDirectory para o qual pretende procurar o immutableID

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

### System.String

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
