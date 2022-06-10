BeforeAll {
    $ModulePath = 'C:\Users\RN861025\OneDrive - PGA\DEV\EDU\edu.adusers\edu.adusers.psm1' 
    Import-Module $ModulePath
    Mock -ModuleName edu.adusers Get-ADUserImmutableID { $LASTEXITCODE = 0 }
}
Describe 'Get-ADUserImmutableID' {
    It 'Exit code 0 quando o comando é completado com sucesso' {
        Get-ADUserImmutableID | Should -Be 0
    }
}
