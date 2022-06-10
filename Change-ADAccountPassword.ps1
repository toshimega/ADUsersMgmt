function Reset-ADUserpassword {
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'exec')] [String]$email,
        [Parameter(Mandatory = $true, ParameterSetName = 'exec')] [String]$old,
        [Parameter(Mandatory = $true, ParameterSetName = 'exec')] [String]$new,
        [Parameter(Mandatory = $true, ParameterSetName = 'exec')] [String]$supUser,
        [Parameter(Mandatory = $true, ParameterSetName = 'exec')] [String]$supPWD,
        [Parameter(Mandatory = $true, ParameterSetName = 'exec')] [String]$server,
        [Parameter(Mandatory = $false, ParameterSetName = 'exec')]
        [Parameter(Mandatory = $true, ParameterSetName = 'help')] [Switch]$help = $false
    )

    [array]$serverIP = [System.Net.Dns]::GetHostAddresses($server)
    $serverIP = $serverIP[1].IPAddressToString

    if ($help -or $help1) {
        Write-Output 'Sintax: -email "example@example.com" -old "oldPWD" -new "newPWD" -supUser "domain\user" -supPWD "supPWD" -server "server"'
        Write-Output '(...) - Optional'
        Write-Output 'Use -help to print this.'
        exit
    }
    else {
        if ($email -like '' -or $old -like '' -or $new -like '' -or $supUser -like '' -or $supPWD -like '') {
            Write-Output "Some argument(s) is missing, check sintax.`n"
            Write-Output 'Sintax: -email "example@example.com" -old "oldPWD" -new "newPWD" -supUser "domain\user" -supPWD "supPWD" -server "server"'
            exit
        }
    }

    $oldPWD = $old
    $newPWD = $new

    $supSecPWD = ConvertTo-SecureString $supPWD -AsPlainText -Force
    $serverCredentials = New-Object System.Management.Automation.PSCredential ($supUser, $supSecPWD)

    $userData = Get-ADUser -Filter { EmailAddress -like $email } -Properties objectSid -Server $server -Credential $serverCredentials 2> $err

    if (-not $userData) {
        Write-Error 'No user Found'
        exit
    }

    $SID = $userData['objectSid'][0].Value
    $originalPWD = $userData['extensionAttribute13']

    Set-ADAccountPassword -AuthType Negotiate -Credential $serverCredentials -Identity $SID -OldPassword (ConvertTo-SecureString -AsPlainText $oldPWD -Force) -NewPassword (ConvertTo-SecureString -AsPlainText $newPWD -Force) -Server $server
}
