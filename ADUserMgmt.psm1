#region::SetVerbosePreference
if ($Myinvocation.line -match '-verbose') {
    $VerbosePreference = 'continue'
}

#endregion::SetVerbosePreference

#region::CarregarFuncoes
Write-Verbose 'A carregar as funções'
. $PSScriptRoot\src\public\Get-ADUserbyAttribute.ps1
. $PSScriptRoot\src\public\Get-ADUserbyOU.ps1
. $PSScriptRoot\src\public\Get-ADUserImmutableID
. $PSScriptRoot\src\public\New-ADLOGON.ps1
. $PSScriptRoot\src\public\New-ADMUserFromExistingUser.ps1
. $PSScriptRoot\src\public\New-CustomADUser.ps1
. $PSScriptRoot\src\private\Edit-AllPunctuation.ps1
#endregion::CarregarFuncoes

#region::GenerateCredentials
Write-Host 'Por favor introduza credenciais de utilizador com permissões suficientes para administração de objetos do tipo User no diretório'
$global:Cred = Get-Credential
#endregion::GenerateCredentials

#region::ModuleEnvironmentSetup
$global:Server = Read-Host 'Por favor introduza o fqdn do servidor AD'
#endregion::ModuleEnvironmentSetup
