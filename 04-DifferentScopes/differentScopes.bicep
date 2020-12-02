// Setting the subscription as the primary target
targetScope = 'subscription'

param rgName string = 'RG1'
param location string = 'westeurope'

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: rgName
  location: location
}

param storageName string = 'storacctn5468789'

module storage './storageAccount.bicep' = {
  name: 'storageModule'
  params: {
    name: storageName
    location: location
  }
  scope: resourceGroup(rg.name)
}

