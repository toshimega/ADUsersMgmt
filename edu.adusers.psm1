#region::SetVerbosePreference
if ($Myinvocation.line -match '-verbose') {
    $VerbosePreference = 'continue'
}

#endregion::SetVerbosePreference

#region::CarregarFuncoes
Write-Verbose 'A carregar as funções'
. $PSScriptRoot\src\public\Get-EduADUser.ps1
. $PSScriptRoot\src\public\Get-ADUserfromGroupMember.ps1
. $PSScriptRoot\src\public\Get-ADUserImmutableID
. $PSScriptRoot\src\public\Get-EduADUserbyOU.ps1
. $PSScriptRoot\src\public\New-EduADLOGON.ps1
. $PSScriptRoot\src\public\New-EduADMUser.ps1
. $PSScriptRoot\src\public\New-EDUADUser.ps1
. $PSScriptRoot\src\private\Edit-AllPunctuation.ps1
#endregion::CarregarFuncoes

#region::GenerateCredentials
$EncryptedPassword = Get-Secret -Name RN861025-ADM
$RN861025ADM = 'EDU\RN861025-ADM'
$global:credEDU = [System.Management.Automation.PSCredential]::new($RN861025ADM, $EncryptedPassword)
#endregion::GenerateCredentials

#region::ModuleEnvironmentSetup
$global:ServerName = 'E000DCSD-VM.edu.azores.gov.local'
#endregion::ModuleEnvironmentSetup
