param sqlServerName string
param sqlServerResourceGroup string = resourceGroup().name
param location string = resourceGroup().location
param createNewServer bool

param administratorLogin string
@secure()
param administratorLoginPassword string

module deploySqlSrv 'br:acr55899.azurecr.io/modules/sqlserver:v1' = if (createNewServer) {
  name: sqlServerName
  scope: resourceGroup(sqlServerResourceGroup)
  params: {
    sqlServerName: sqlServerName
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    location: location
  }
}

resource sqlSrv 'Microsoft.Sql/servers@2014-04-01' existing = {
  name: sqlServerName
  scope: resourceGroup(sqlServerResourceGroup)
}

param databaseName string
param collation string = 'SQL_Latin1_General_CP1_CI_AS'
param edition string = 'basic'
param requestedServiceObjectiveName string = 'basic'
param maxSizeBytes string = '1073741824'

resource db 'Microsoft.Sql/servers/databases@2014-04-01' = {
  name: createNewServer ? '${deploySqlSrv.name}/${databaseName}' : '${sqlSrv.name}/${databaseName}'
  location: location
  properties: {
    edition: edition
    collation: collation
    maxSizeBytes: maxSizeBytes
    requestedServiceObjectiveName: requestedServiceObjectiveName
  }
}
