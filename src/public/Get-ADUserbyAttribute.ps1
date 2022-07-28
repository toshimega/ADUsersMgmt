function Get-ADUserbyAttribute {
    [cmdletbinding(PositionalBinding = $true)]
    [OutputType('ADUser')]
    [Alias('geau')]

    param (
        [parameter(
            Mandatory
        )]
        [ValidateNotNullorEmpty()]
        [ValidateSet('EmployeeType', 'SamAccountName', 'UserPrincipalName', 'EmailAddress')]
        [Alias('At', 'Attr')]
        [string]$Attributes,

        [parameter(
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullorEmpty()]
        [Alias('V', 'Valor')]
        [string[]]$Value
    )
    BEGIN {
        Write-Verbose "[BEGIN   ] Starting $($MyInvocation.MyCommand)"
    }
    PROCESS {
        foreach ($val in $value) {
            $selectProperties = 'Name', 'EmployeeType', 'SamAccountName', 'UserPrincipalName', 'EmailAddress'
            $Params = @{
                'Filter'   = "$($Attribute) -eq '$($value)'"
                'Property' = $selectProperties
            }
            Try {
                Get-ADUser @Params
            }
            catch {
                # ADUser Filter does not throw, why should it, but could warn, so..
                throw 'Ocorreu um erro com o filtro utilizado. Por favor tente novamente' 
            }
        }
    }
    END {
        Write-Verbose "[END   ] Ending $($MyInvocation.MyCommand)" 
    }
}