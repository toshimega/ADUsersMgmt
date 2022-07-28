BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Get-ADUserbyOU" {
    It "Returns expected output" {
        Get-ADUserbyOU | Should -Be "YOUR_EXPECTED_VALUE"
    }
}
