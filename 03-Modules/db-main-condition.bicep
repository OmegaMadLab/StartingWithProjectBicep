param sqlServerName string
param location string = resourceGroup().location
param createNewServer bool = false

param administratorLogin string
@secure()
param administratorLoginPassword string

module sqlSrv './sqlSrv-module.bicep' = if (createNewServer) {
  name: sqlServerName
  params: {
    sqlServerName: sqlServerName
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    location: location
  }
}

param databaseName string
param collation string = 'SQL_Latin1_General_CP1_CI_AS'
param edition string = 'basic'
param requestedServiceObjectiveName string = 'basic'
param maxSizeBytes string = '1073741824'

resource db 'Microsoft.Sql/servers/databases@2014-04-01' = {
  name: createNewServer ? '${sqlSrv.name}/${databaseName}' : '${sqlServerName}/${databaseName}'
  location: location
  properties: {
    edition: edition
    collation: collation
    maxSizeBytes: maxSizeBytes
    requestedServiceObjectiveName: requestedServiceObjectiveName
  }
}
