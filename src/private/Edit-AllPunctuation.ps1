function Edit-AllPunctuation {
    [cmdletbinding()]
    param  (    
        [Parameter(Mandatory = $true,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelinebyPropertyName,
            HelpMessage = 'Introduza a frase ou conjunto de frases, para as quais pretende substituir um caracteres por si mesmo mas sem pontuação')]
        [string[]]$InputString
    )
    BEGIN {
        Write-Verbose "[BEGIN]Starting $($MyInvocation.MyCommand)"
        $SubsPMin = @{
            'à' = 'a'
            'á' = 'a'
            'â' = 'a'
            'ã' = 'a'
            'ä' = 'a'
            'è' = 'e'
            'é' = 'e'
            'ê' = 'e'
            'ë' = 'e'
            'ì' = 'i'
            'í' = 'i'
            'î' = 'i'
            'ï' = 'i'
            'ò' = 'o'
            'ó' = 'o'
            'ô' = 'o'
            'õ' = 'o'
            'ö' = 'o'
            'ù' = 'u'
            'ú' = 'u'
            'û' = 'u'
            'ü' = 'u'
            'ç' = 'c'
            'ñ' = 'n'
        }
        $SubsPMai = @{
            'À' = 'A'
            'Á' = 'A'
            'Â' = 'A'
            'Ã' = 'A'
            'Ä' = 'A'
            'È' = 'E'
            'É' = 'E'
            'Ê' = 'E'
            'Ë' = 'E'
            'Ì' = 'I'
            'Í' = 'I'
            'Î' = 'I'
            'Ò' = 'O'
            'Ó' = 'O'
            'Ô' = 'O'
            'Õ' = 'O'
            'Ö' = 'O'
            'Ù' = 'U'
            'Ú' = 'U'
            'Û' = 'U'
            'Ü' = 'U'
            'Ç' = 'C'
            'Ñ' = 'N'
        }
    }
    PROCESS {
        foreach ($string in $InputString) {
            Write-Verbose '[PROCESS] Starting string operations.'
            foreach ($key in $SubsPMin.Keys) {
                $string = $string.Replace($key, $SubsPMin.$key)
                foreach ($key in $SubsPMai.Keys) {
                    $string = $string.Replace($Key, $SubsPMai.$Key)
                }
            }
            Write-Output $string
        }
    }
    END {
    }
} #Edit-AllPunctuation
