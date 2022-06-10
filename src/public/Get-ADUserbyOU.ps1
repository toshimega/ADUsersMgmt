function Get-ADUserbyOU {
    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline,
            ValueFromPipelinebyPropertyName)]
        [ValidateSet('Students', 'Teachers', 'Employees')]
        [ValidateNotNullorEmpty()]
        [string]
        $OrganizationalUnit,
        
        [Switch]
        $All
    )
    BEGIN {
        Write-Verbose "[BEGIN]Starting $($MyInvocation.MyCommand)"
        $params = @{
            'Filter'     = '*'
            'Properties' = 'CN', 'DistinguishedName', 'EmployeeType', 'Enabled', 'GivenName', 'Mail', 'Name', 'ObjectClass', 'ObjectGUID', 'SamAccountName', 'SID', 'Surname', 'UserPrincipalName', 'WhenChanged', 'WhenCreated'
            'Server'     = $ServerName
            'Credential' = $credEDU
        }
    }
    PROCESS {
        if ($All) {
            $searchbase = 'OU=4_Students,DC=contoso,DC=com', 'OU=5_Teachers,DC=contoso,DC=com', 'OU=6_Employees,DC=contoso,DC=com'
            foreach ($ou in $searchbase) {
                Get-ADUser @params -SearchBase "$($ou)"
            }
        }
        else {
            switch -Regex ($OrganizationalUnit) {
                'Alunos' {
                    $params.Add('Searchbase', 'OU=4_Students,DC=contoso,DC=com'); Break 
                }
                'Docentes' {
                    $params.Add('Searchbase', 'OU=5_Teachers,DC=contoso,DC=com'); Break 
                }
                'Colaboradores' {
                    $params.Add('Searchbase', 'OU=6_Employees,DC=contoso,DC=com'); Break 
                }
            }
            Get-ADUser @params
        }
    }
    END {
    }      
} #Get-ADUserbyOU
