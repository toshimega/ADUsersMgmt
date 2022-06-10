function Get-ADUserfromGroupMember {
    
    [CmdLetBinding()]
    [OutputType('ADUser')]
    [alias('ggm')]

    param (
        [string]$group
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