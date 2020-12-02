param databaseName string
param sqlserverName string

param collation string = 'SQL_Latin1_General_CP1_CI_AS'
param edition string = 'basic'
param requestedServiceObjectiveName string = 'basic'
param maxSizeBytes string = '1073741824'

param location string = resourceGroup().location

resource db 'Microsoft.Sql/servers/databases@2014-04-01' = {
  name: '${sqlserverName}/${databaseName}'
  location: location
  properties: {
    edition: edition
    collation: collation
    maxSizeBytes: maxSizeBytes
    requestedServiceObjectiveName: requestedServiceObjectiveName
  }
}
