function New-ADMuserFromExistingUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
            ValueFromPipelinebyPropertyName)]
        [string[]]
        $DisplayName,

        [Parameter(Mandatory,
            ValueFromPipelineByPropertyName,
            ValueFromPipeline)]
        [String[]]
        $SamAccountName,

        [parameter(Mandatory)]
        [ValidateSet('0207', '0209', '0210', '0211', '0222', '0227', '0228', '0231', '0232', '0235', '0236', '0237', '0239',
            '0240', '0241', '0242', '0243', '0244', '0245', '0246', '0247', '0248', '0250', '0251', '0252', '0255', '0257',
            '0258', '0260', '0300', '0301', '0304', '0308', '0317', '0324', '0521', '5238', '5438', '5440'
        )]
        [String[]]
        $Site,

        [Parameter(Mandatory)]
        [SecureString]
        $Password
    )
    BEGIN {
        Write-Verbose "[BEGIN] Starting $($MyInvocation.MyCommand)"
    }#begin
    PROCESS {
        foreach ($sam in $SamAccountName) { 
            try {
                $params = @{
                    Name                  = "$($sam)-ADM"
                    Initials              = 'ADM'
                    Enabled               = $true
                    ChangePasswordAtLogon = $false
                    AccountPassword       = "$($Password)" | ConvertTo-SecureString -AsPlainText -Force
                    UserPrincipalName     = "$sam-ADM@edu.azores.gov.pt" 
                    SamAccountName        = "$($sam)-ADM"
                    Company               = 'Núcleo de Informática e Telecomunicações'
                    Division              = 'Núcleo de Informática e Telecomunicações'
                    DisplayName           = "$($DisplayName) - Conta ADM" 
                    Description           = "Conta de Suporte Site GRA$($Site)"
                    Path                  = 'OU=Users_Suporte,OU=3_SuporteSites,DC=edu,DC=azores,DC=gov,DC=local'
                    Server                = "$($global:ServerName)"
                    
                }
                Write-Verbose "[PROCESS] Creating user $Sam-ADM"
                New-ADUser @params -ErrorAction Stop
            }
            catch {
                throw $_
            }
        }
    }
    END {
        Write-Verbose "[END] Ending $($MyInvocation.MyCommand)" 
    }
} #New-ADMuserFromExistingUser
