function New-EduADUser {
    [cmdletbinding(PositionalBinding = $true)]
    param (
        [Parameter(ValueFromPipeline,
            ValueFromPipelinebyPropertyName,
            Position = 0)]
        [PSObject[]]$InputObject,
        
        [parameter(Mandatory)]
        [validateSet('Alunos', 'Colaboradores', 'Docentes')]
        [string]$OrganizationalUnit,
        
        [parameter()]
        [SecureString]$Password = 'JweJqSdzTSUCmWuHNJm6wXsNw'
    )
    BEGIN {
        Write-Verbose "[BEGIN]  Starting $($MyInvocation.MyCommand)"
    }
    PROCESS {
        foreach ($User in $InputObject) {
            $oAttributes = @{
                EmployeeType        = $User.NIF
                extensionAttribute1 = $User.NIF
                C                   = 'PT'
                CO                  = 'Portugal'
                CountryCode         = '620'
                ProxyAddresses      = "SMTP:$User.emailAddress"
                TargetAddress       = "SMTP:$User.emailAddress"
            }

            $EduUser = @{
                Enabled               = $True
                SamAccountName        = $User.SamAccountName.Trim()
                UserPrincipalName     = $User.UserPrincipalName.Trim()
                Name                  = $User.Name.Trim()
                GivenName             = $User.GivenName.Trim()
                Surname               = $User.Surname.Trim()
                Description           = $User.Name.Trim()
                Initials              = $User.Initials.Trim()
                DisplayName           = $User.DisplayName.Trim()
                Office                = $User.Escola.Trim()
                EmailAddress          = $User.EmailAddress.Trim()
                AccountPassword       = (ConvertTo-SecureString -AsPlainText "$Password" -Force)
                ChangePasswordAtLogon = $False
                HomePage              = 'htts://edu.azores.gov.pt'
                Department            = 'Direção Regional da Educação'
                Division              = $User.'Escola'
                Company               = 'Direção Regional da Educação'
                State                 = 'Açores'
                OtherAttributes       = $oAttributes
            }
            
            switch -regex ($OrganizationalUnit) {
                'Alunos' {
                    $EduUser.add('Path', 'OU=4_Alunos,dc=edu,dc=azores,dc=gov,dc=local')
                    $EduUser.add('Title', 'Aluno'); BREAK
                }
                'Docentes' {
                    $EduUser.add('Path', 'OU=5_Docentes,dc=edu,dc=azores,dc=gov,dc=local')
                    $EduUser.add('Title', 'Docente'); BREAK
                }
                'Colaboradores' {
                    $EduUser.add('Path', 'OU=6_Colaboradores,dc=edu,dc=azores,dc=gov,dc=local')
                    $EduUser.add('Title', 'Colaborador'); BREAK
                }
                Default {
                }
            }
            try {
                New-ADUser @EduUser
            } 
            catch {
                $_
            }
        }
    }
    END {
        Write-Verbose "[END]    Ending $($MyInvocation.MyCommand)"
    }
}#New-EDUADUser
