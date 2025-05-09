param location string = 'italynorth'
param groupName string = 'demoEntraGroup'

resource storage 'Microsoft.Storage/storageAccounts@2020-08-01-preview' = {
  name: 'storacctn${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'StorageV2'
  sku: {
      name: 'Standard_LRS'
  }
}

extension microsoftGraphV1

resource entraGroup 'Microsoft.Graph/groups@v1.0' = {
  displayName: groupName
  uniqueName: groupName
  mailNickname: groupName
  mailEnabled: false
  securityEnabled: true
}

resource contributorRoleDefinition 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
  scope: subscription()
  name: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-10-01-preview' = {
  name: guid(storage.id, contributorRoleDefinition.id)
  scope: storage
  properties: {
    roleDefinitionId: contributorRoleDefinition.id
    principalId: entraGroup.id
    principalType: 'Group'
  }
}

