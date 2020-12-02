param name string
param location string

resource storage 'Microsoft.Storage/storageAccounts@2020-08-01-preview' = {
  name: name
  location: location
  kind: 'StorageV2'
  sku: {
      name: 'Standard_LRS'
      tier: 'Standard'
  }
}