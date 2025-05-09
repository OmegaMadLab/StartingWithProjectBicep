# Deploy via PowerShell
$rgName = "BicepSamples-RG"

Set-Location .\05-Extensibility

New-AzResourceGroupDeployment -ResourceGroupName $rgName `
    -TemplateFile .\main.bicep