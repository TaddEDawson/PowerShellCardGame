<#
    .SYNOPSIS
        Play-Game.ps1 used for examples and warm up in workshop
#>
$CardDeck = Get-Content .\symbols.txt
$CardsNotAvailable = @()
function Flip-Coin
{
    <#
        .EXAMPLE
            Flip-Coin
    #>
    if((Get-Random)%2 -eq 0)
    {
        Write-Host -ForegroundColor Green "HEADS"
    }
    else
    {
        Write-Host -ForegroundColor Yellow "TAILS"
    }
}

function Get-PowerShellCard
{
    <#
        .EXAMPLE
            Get-PowerShellCard
    #>
    param
    (
        $CardDeck = $Script:CardDeck
        ,
        $CardsNotAvailable = $Script:CardNotAvailable
    )
    process
    {
        # Which Cards are no longer available?
        do
        {
            $CardToPick = Get-Random -Minimum 0 -Maximum ($CardDeck.Count-1)
        }
        until
        (!($CardToPick -in $CardsNotAvailable))

        Write-Verbose -Message "Picking Card # $CardToPick"
        Write-Verbose -Message "Place the card # $CardToPick in the taken pile"
        $CardsNotAvailable += $CardToPick
        Write-Verbose -Message "Read the Card"
        Write-Verbose -Message "`n`n`tWhat is the following Character(s) used for `n`t$($CardDeck[$CardToPick])"
    }
}
