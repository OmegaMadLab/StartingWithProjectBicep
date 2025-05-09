# Deploy via PowerShell
$rgName = "BicepSamples-RG"

Set-Location .\03-Modules

New-AzResourceGroupDeployment -ResourceGroupName $rgName `
    -TemplateFile .\webapp\webapp-main.bicep `
    -TemplateParameterFile .\webapp\webapp-main.test.bicepparam

New-AzResourceGroupDeployment -ResourceGroupName $rgName `
    -TemplateFile .\webapp\webapp-main.bicep `
    -TemplateParameterFile .\webapp\webapp-main.prod.bicepparam

# Bicep registry
$br = New-AzContainerRegistry -ResourceGroupName $rgName `
        -Name "omegabicepregistry$(Get-Random -Maximum 99999)" `
        -Sku Basic `
        -Location "ItalyNorth"

$br.LoginServer

bicep publish .\webapp\webapp-module.bicep --target br:$($br.LoginServer)/webappmodule:1.0.0

# Template spec
$ts = New-AzTemplateSpec -ResourceGroupName $rgName `
        -Name "ts-webApp" `
        -Location "ItalyNorth" `
        -Description "Template spec for Web App" `
        -Version 1.0.0 `
        -TemplateFile .\webapp\webapp-module.bicep

$ts.ResourceGroupName
$ts.SubscriptionId