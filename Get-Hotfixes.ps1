Function SearchForSpecificUpdate
{
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$true)][String]$KBNumber
    )
    Write-Verbose "Checking the given Patch $KBNumber on Computer"

    $env:COMPUTERNAME | ForEach-Object { 
        if ((Get-HotFix -Id $KBNumber -ComputerName $_)) {
            Write-Output "The Given KB $KBNumber is installed on that Computer $env:COMPUTERNAME Object"
        } else {
            Write-Output "The Given KB $KBNumber is not installed on that Computer $env:COMPUTERNAME Object"
        }
    } -ErrorAction Continue 2> null

}
<#
 # Exsamples:
 SearchForSpecificUpdate -KBNumber "KB2584146"
 SearchForSpecificUpdate -KBNumber "KB2584146" -Verbose
 Get-Help SearchForSpecificUpdate
 Clear
#>
