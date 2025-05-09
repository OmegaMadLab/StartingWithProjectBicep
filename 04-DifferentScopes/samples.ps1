# Deploy via PowerShell
Set-Location .\04-DifferentScopes

New-AzDeployment -TemplateFile .\differentScopes.bicep `
    -Location "ItalyNorth"