function Get-ADUsersEduBox {
    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline,
            ValueFromPipelinebyPropertyName)]
        [ValidateNotNullorEmpty()]
        [string]
        $ou_distinguishedname
    )
    BEGIN {
        Write-Verbose "[BEGIN]  Starting $($MyInvocation.MyCommand)"

        
    }
    PROCESS {
        try {
            if ($ou_distinguishedname) {

            }
            $searchbase = 
            'OU=4_Alunos,DC=edu,DC=azores,DC=gov,DC=local',
            'OU=5_Docentes,DC=edu,DC=azores,DC=gov,DC=local',
            'OU=6_Colaboradores,DC=edu,DC=azores,DC=gov,DC=local'
            
            foreach ($ou in $searchbase) {
                Get-ADUser @params -SearchBase "$($ou)"
            }
        }
        catch {
            $_
        }   
    }
    END {
        Write-Verbose "[END]    Ending $($MyInvocation.MyCommand)"
    }      
}