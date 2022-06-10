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
        [psobject]$Value
    )
    BEGIN {
        Write-Verbose "[BEGIN   ] Starting $($MyInvocation.MyCommand)"
    }
    PROCESS {
        foreach ($val in $Value) {
            $selectdProperties = 'Name', 'EmployeeType', 'SamAccountName', 'UserPrincipalName', 'EmailAddress'
            $Params = @{
                'Filter'     = "$($Attribute) -eq '$($val)'"
                'Property'   = $selectdProperties
                'Server'     = $global:ServerName
                'Credential' = $global:credEDU
            }
            Try {
                Get-ADUser @Params
            }
            catch {
                throw 'Ocorreu um erro com o filtro utilizado. Por favor tente novamente' 
            }
        }
    }
    END {
        Write-Verbose "[END   ] Ending $($MyInvocation.MyCommand)" 
    } #end
} #Get-ADUserbyAttribute
