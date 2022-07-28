function Get-ADUserbyOU {
    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline,
            ValueFromPipelinebyPropertyName)]
        [ValidateSet('Alunos', 'Docentes', 'Colaboradores')]
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
        }
    }
    PROCESS {
        if ($All) {
            $searchbase = 'OU=4_Alunos,DC=edu,DC=azores,DC=gov,DC=local', 'OU=5_Docentes,DC=edu,DC=azores,DC=gov,DC=local', 'OU=6_Colaboradores,DC=edu,DC=azores,DC=gov,DC=local'
            foreach ($ou in $searchbase) {
                Get-ADUser @params -SearchBase "$($ou)"
            }
        }
        else {
            switch -Regex ($OrganizationalUnit) {
                'Alunos' {
                    $params.Add('Searchbase', 'OU=4_Alunos,DC=edu,DC=azores,DC=gov,DC=local'); Break 
                }
                'Docentes' {
                    $params.Add('Searchbase', 'OU=5_Docentes,DC=edu,DC=azores,DC=gov,DC=local'); Break 
                }
                'Colaboradores' {
                    $params.Add('Searchbase', 'OU=6_Colaboradores,DC=edu,DC=azores,DC=gov,DC=local'); Break 
                }
            }
            Get-ADUser @params
        }
    }
    END {
    }      
}