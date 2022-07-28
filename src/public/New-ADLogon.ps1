function New-ADLOGON {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline,
            ValueFromPipelineByPropertyName)]
        [Object[]]$InputObject
    )
    
    BEGIN {
        Write-Verbose "[BEGIN]Starting $($MyInvocation.MyCommand)"
    } #Begin  
    PROCESS {
        foreach ($obj in $InputObject) {

            Write-Verbose '[PROCESS] Starting String Operations. Creating GivenName,Surname,MiddleNames,Initials.)'            
            $firstandLastName = $obj.Nome.ForEach( { $tempSplit = $_ -split ' '
                    [PSCustomObject]@{
                        InputObject = $_
                        GivenName   = $tempSplit[0]
                        Surname     = $tempSplit | Select-Object -Last 1
                        MiddleNames = $tempSplit[1..($tempsplit.Length - 2)]
                        Iniciais    = $tempsplit.Substring(0, [Math]::Min($tempsplit.Length, 1))
                    }
                })

            Write-Verbose '[PROCESS] Configuring Initials to Upper Case.'
            $FirstInitial = $FirstAndLastName.GivenName.ToUpperInvariant().Substring(0, 1)
            $LastInitial = $firstandLastName.Surname.ToUpperInvariant().SubString(0, 1)
            $IniciaisMeio = $firstandLastName.Iniciais.Trim().ToUpperInvariant()[1..($tempsplit.Length - 2)] -join ''

            Write-Verbose '[PROCESS] Performing string operations. Standardizing formats'
            $GivenName = "$([System.Globalization.CultureInfo]::CurrentCulture.TextInfo.ToTitleCase($FirstAndLastName.GivenName))"
            $SurName = "$([System.Globalization.CultureInfo]::CurrentCulture.TextInfo.ToTitleCase($FirstAndLastName.Surname))"
            $DisplayName = "$($firstandLastName.Givenname)" + ' ' + "$($IniciaisMeio)" + ' ' + "$($firstandLastName.Surname)"
            $DisplayName = "$([System.Globalization.CultureInfo]::CurrentCulture.TextInfo.ToTitleCase($DisplayName))"
            $Name = "$([System.Globalization.CultureInfo]::CurrentCulture.TextInfo.ToTitleCase($obj.Nome))"
            $Name = $Name | Edit-AllPunctuation

            Write-Verbose '[PROCESS] Creating email based on DisplayName'
            $EmailAddress = $DisplayName.Replace(' ', '.') + '@edu.azores.gov.pt'
            $EmailAddress = $EmailAddress | Edit-AllPunctuation
            $Office = $Obj.'Escola'
            $NIF = $obj.NIF
            
            Write-Verbose '[PROCESS] Creating SamAccountName.'
            $BirthDSam = Get-Date -Date $obj.'Data Nascimento' -UFormat '%d%m%y'
            $SamAccountName = "$FirstInitial$LastInitial$BirthDSam"
            $UserPrincipalName = "$SamAccountName@edu.azores.gov.pt"
               
            $EduLogon = [PSCustomObject]@{
                'SamAccountName'    = $SamAccountName
                'UserPrincipalName' = $UserPrincipalName
                'EmailAddress'      = $EmailAddress
                'DisplayName'       = $DisplayName
                'Name'              = $Name
                'GivenName'         = $GivenName
                'Surname'           = $SurName
                'Initials'          = $FirstInitial + $LastInitial
                'NIF'               = $NIF
                'Office'            = $Office
            }
            Return $EduLogon
        }
    }
    END {
        Write-Verbose "[END    ]Ending $($MyInvocation.MyCommand)"
    }
}
