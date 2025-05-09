// Setting the subscription as the primary target
targetScope = 'subscription'

param rgName string = 'RG1'
param location string = 'italynorth'

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: rgName
  location: location
}
module storage './storageAccount.bicep' = {
  name: 'storageModule'
  params: {
    name: 'storacctn${uniqueString(rg.id)}'
    location: rg.location
  }
  scope: resourceGroup(rg.name)
}



