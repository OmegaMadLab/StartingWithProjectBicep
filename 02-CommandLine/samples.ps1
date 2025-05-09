# Bicep capabilities
bicep --help

# Compile to JSON ARM
bicep build .\storageAccount.bicep --outdir .\out

# Decompile JSON ARM to Bicep
bicep decompile .\out\storageAccount.json --outdir .\out

# Deploy via PowerShell
$rgName = "BicepSamples-RG"

New-AzResourceGroupDeployment -ResourceGroupName $rgName `
    -TemplateFile .\storageAccount.bicep
    
New-AzResourceGroupDeployment -ResourceGroupName $rgName `
    -TemplateFile .\storageAccount.bicep `
    -TemplateParameterFile .\storageAccount.bicepparam

New-AzResourceGroupDeployment -ResourceGroupName $rgName `
    -TemplateFile .\tls13StorageAccount.bicep `
    -TemplateParameterFile .\tls13StorageAccount.bicepparam `
    -WhatIf
