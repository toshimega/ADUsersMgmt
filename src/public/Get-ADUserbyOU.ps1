function Get-ADUserbyOU {
    [cmdletbinding()]

    param (
        [parameter(
            ValueFromPipeline,
            ValueFromPipelinebyPropertyName)]
        [ValidateNotNullorEmpty()]
        [string[]]$ou_distinguishedname
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
            'searchbase' = "$($ou_distinguishedname)"
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
