function Get-ADUserbyOU {
    [cmdletbinding()]

    param (
        [parameter(
            ValueFromPipeline,
            ValueFromPipelinebyPropertyName)]
        [ValidateNotNullorEmpty()]
        [string[]]$searchbase
    )
    BEGIN {
        Write-Verbose "[BEGIN]  Starting $($MyInvocation.MyCommand)"

        $params = @{
            'Filter'     = '*'
            'Properties' = 
            'CN',
            'DistinguishedName',
            'EmployeeType',
            'Enabled',
            'GivenName',
            'Mail',
            'Name',
            'ObjectClass',
            'ObjectGUID',
            'SamAccountName',
            'SID',
            'Surname',
            'UserPrincipalName',
            'WhenChanged',
            'WhenCreated'
        }
    }
    PROCESS {
        foreach ($ou in $searchbase) {
            Get-ADUser @params
        }
    }
    END {
    }      
}
