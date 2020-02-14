$CardDeck = Get-Content .\Cards.txt
$CardsNotAvailable = Get-Content .\CardsNotAvailable.txt -ErrorAction SilentlyContinue
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
    [CmdletBinding()]
    param
    (
    )
    process
    {
        # Which Cards are no longer available?
        do
        {
            $CardsNotAvailable = Get-Content .\CardsNotAvailable.txt -ErrorAction SilentlyContinue
            $CardToPick = Get-Random -Minimum 0 -Maximum ($CardDeck.Count-1)
        }
        until
        (!($CardToPick -in $CardsNotAvailable))

        Write-Verbose -Message "Picking Card # $CardToPick"
        Write-Verbose -Message "Place the card # $CardToPick in the taken pile"
        $CardToPick | Out-File .\CardsNotAvailable.txt -Append
        Write-Verbose -Message "Read the Card"
        Write-Verbose -Message "`n`n`tWhat is the following Character(s) used for `n`t$($CardDeck[$CardToPick])"
    }
}
