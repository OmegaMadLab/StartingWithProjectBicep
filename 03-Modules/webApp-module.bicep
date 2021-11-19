@description('The name of the webapp')
param name string

param location string

@allowed([
  'PROD'
  'TEST'
])
@description('The environment object of the deployment')
param environment string

var hostingPlanName = 'hostingPlan-${environment}-${location}'

var webAppName = '${name}-${environment}-${location}'

var environmentSettings = {
  TEST: {
      skuName: 'B1'
      skuCapacity: 1
  }
  PROD: {
      skuName: 'S1'
      skuCapacity: 2
  }
}

resource hostingPlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: hostingPlanName
  location: location
  sku: {
    name: environmentSettings[environment].skuName
    capacity: environmentSettings[environment].skuCapacity
  }
}

resource webApp 'Microsoft.Web/sites@2020-12-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: hostingPlan.id
  }
}

output webAppId string = webApp.id
