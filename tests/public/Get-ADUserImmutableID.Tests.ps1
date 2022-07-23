BeforeAll {
    $ModulePath = '.\adusers-helpers.psm1' 
    Import-Module $ModulePath
    Mock -ModuleName adusers-helpers Get-ADUserImmutableID { $LASTEXITCODE = 0 }
}
Describe 'Get-ADUserImmutableID' {
    It 'Exit code 0 quando o comando é completado com sucesso' {
        Get-ADUserImmutableID | Should -Be 0
    }
}
