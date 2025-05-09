param name string
param location string

resource storage 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: take('${name}${uniqueString(resourceGroup().id)}', 24)
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
    minimumTlsVersion: 'TLS1_3'
    supportsHttpsTrafficOnly: true
  }
}
