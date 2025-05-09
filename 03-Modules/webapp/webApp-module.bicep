@description('The name of the webapp')
param name string

@description('The location of the webapp')
param location string

@description('The tier of the App Service Plan')
param skuName string

@description('Number of instances for the App Service Plan')
param skuCapacity int


var hostingPlanName = 'hostingPlan-${location}'

var webAppName = '${name}-${location}'

resource hostingPlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: hostingPlanName
  location: location
  sku: {
    name: skuName
    capacity: skuCapacity
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
