function Get-ADUserImmutableID {
    param (
        [ValidateNotNullOrEmpty()]
        [parameter(
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0)]
        
        [string[]]
        $SamAccountName = $(Throw 'Must provide -SamAccountName'),

        [parameter(
            HelpMessage = 'Enter the path where you wish to output the file.'
        )]
        [ValidateScript({ Test-Path $_ })]
        [string]
        $FilePath = $(Throw 'Parameter -FilePath mandatory')
    )
    BEGIN {
        $Hora = [System.DateTime]::Now.ToShortTimeString()
        $Output = "$($FilePath)\$($SamAccountName)ImmutableID.txt"
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