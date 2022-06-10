#region::SetVerbosePreference
if ($Myinvocation.line -match '-verbose') {
    $VerbosePreference = 'continue'
}

#endregion::SetVerbosePreference

#region::CarregarFuncoes
Write-Verbose 'A carregar as funções'
. $PSScriptRoot\src\public\Get-ADUserbyAttribute.ps1
. $PSScriptRoot\src\public\.ps1
. $PSScriptRoot\src\public\Get-ADUserImmutableID
. $PSScriptRoot\src\public\Get-EduADUserbyOU.ps1
. $PSScriptRoot\src\public\New-EduADLOGON.ps1
. $PSScriptRoot\src\public\New-EduADMUser.ps1
. $PSScriptRoot\src\public\New-EDUADUser.ps1
. $PSScriptRoot\src\private\Edit-AllPunctuation.ps1
#endregion::CarregarFuncoes

#region::GenerateCredentials
$EncryptedPassword = Get-Secret -Name ''
$TT112233ADM = ''
$global:credEDU = [System.Management.Automation.PSCredential]::new($TT112233ADM, $EncryptedPassword)
#endregion::GenerateCredentials

#region::ModuleEnvironmentSetup
$global:ServerName = ''
#endregion::ModuleEnvironmentSetup
