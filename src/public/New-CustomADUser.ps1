function New-CustomADUser {
    [cmdletbinding(PositionalBinding = $true)]
    param (
        [Parameter(ValueFromPipeline,
            ValueFromPipelinebyPropertyName,
            Position = 0)]
        [PSObject[]]$InputObject,
        
        [parameter(Mandatory)]
        [validateSet('Students', 'Teachers', 'Employees')]
        [string]$OrganizationalUnit,
        
        [parameter()]
        [SecureString]$Password,

        [parameter()]
        [string]$DomainFQDN
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

            $Users = @{
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
                HomePage              = 'htts://'
                Department            = 'department'
                Division              = $User.'School'
                Company               = 'company'
                State                 = 'state'
                OtherAttributes       = $oAttributes
            }
            
            switch -regex ($OrganizationalUnit) {
                'Students' {
                    $Users.add('Path', "OU=4_Students,$DomainFQDN")
                    $Users.add('Title', 'Student'); BREAK
                }
                'Docentes' {
                    $Users.add('Path', "OU=5_Teachers,$DomainFQDN")
                    $Users.add('Title', 'Teacher'); BREAK
                }
                'Colaboradores' {
                    $Users.add('Path', "OU=6_Employees,$DomainFQDN")
                    $Users.add('Title', 'Employee'); BREAK
                }
                Default {
                }
            }
            try {
                New-ADUser @Users
            } 
            catch {
                $_
            }
        }
    }
    END {
        Write-Verbose "[END]    Ending $($MyInvocation.MyCommand)"
    }
}
