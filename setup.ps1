# Login and set the context
Login-AzAccount

# Create a resource group
$rgName = "BicepSamples-RG"
$location = "ItalyNorth"
if (-not (Get-AzResourceGroup -Name $rgName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $rgName -Location $location    
} 


