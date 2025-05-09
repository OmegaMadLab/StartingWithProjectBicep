@description('The name of the webapp')
param name string

@description('The location of the webapp')
param location array

@description('The tier of the App Service Plan')
param skuName string

@description('Number of instances for the App Service Plan')
param skuCapacity int

module webApp 'br/myBr:webappmodule:1.0.0' = [for region in location: {
  name: 'webApp-${region}'
  params: {
    name: name
    location: region
    skuName: skuName
    skuCapacity: skuCapacity
  }
}]

resource trafficManager 'Microsoft.Network/trafficmanagerprofiles@2022-04-01' = if (length(location) > 1 ? bool('true') : bool('false')) {
  name: 'TrafficManager'
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Weighted'
    dnsConfig: {
      relativeName: 'TrafficManager${uniqueString(resourceGroup().id)}'
    }
    monitorConfig: {
      protocol: 'HTTP'
      port: 80
      path: '/'
      intervalInSeconds: 30
      toleratedNumberOfFailures: 3
      timeoutInSeconds: 10
    }
    endpoints: [for (region, i) in location: {
      name: '${region}-Endpoint'
      type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
      properties: {
        endpointStatus: 'Enabled'
        endpointMonitorStatus: 'Stopped'
        targetResourceId: webApp[i].outputs.webAppId
        weight: 1
        priority: (i + 1)
        endpointLocation: region
      }
    }]
  }
}

output tfUri string = length(location) > 1 ? trafficManager.properties.dnsConfig.fqdn : ''
