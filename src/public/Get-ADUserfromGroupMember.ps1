function Get-ADUserfromGroupMember {
    
    [CmdLetBinding()]
    [OutputType('ADUser')]
    [alias('gagmu')]

    param (
        [string]$group = 'GRP_NIT_Escolas'
    )
    BEGIN {
        [System.Collections.ArrayList]$members = @()
        [System.Collections.ArrayList]$resultUsers = @()
    }
    PROCESS {
        
        $members.Add((Get-ADGroupMember -Identity $group))
        
        foreach ($member in $members) {
            $selectedProperties = 'emailAddress', 'EmployeeType', 'Title'
            $aduserParams = @{
                'Identity'   = $member.ObjectGUID
                'Properties' = $selectedProperties
            }
            $resultUsers.Add((Get-ADUser @aduserParams))
        }
        return $resultUsers
    }
    END {
    }
}#ADUserfromGroupMember