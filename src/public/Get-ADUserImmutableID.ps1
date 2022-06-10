function Get-ADUserImmutableID {
    param (
        [ValidateNotNullOrEmpty()]
        [parameter(
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0)]
        
        [string[]]
        $SamAccountName = $(Throw 'É necessário o -SamAccountName'),

        [parameter(
            HelpMessage = 'Introduza o caminho para a pasta onde pretende exportar o valor.'
        )]
        [ValidateScript({ Test-Path $_ })]
        [string]
        $Destination = $(Throw 'É necessário o parametro -Destino')
    )
    BEGIN {
        $Hora = [System.DateTime]::Now.ToShortTimeString()
        $Output = "$($Destination)\$($SamAccountName)ImmutableID.txt"
    }

    PROCESS {
        foreach ($SAM in $SamAccountName) {
            $Params = @{
                FilePath     = 'ldifde.exe'
                ArgumentList = "-r (SamAccountName=$SAM) -f $Output"
            }
            try {
                Write-Verbose "Writing $SamAccountName ImmutableID to c:\scripts\$SAM-$Hora-ImmutableIDInfo.txt"
                Start-Process @Params
            }
            catch {
                throw $_
            }
        }
    }
    END {
    }
} #Get-EDUADUserImmutableID