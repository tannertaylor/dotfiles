# Oh-My-Posh
oh-my-posh init pwsh --config ~/.poshthemes/night-owl.omp.json | Invoke-Expression

# Aliases
Set-Alias -Name cl -Value Clear-Host 
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name tf -Value terraform

# Environment variables
$env:GOPATH = "$env:HOME/code/go"
