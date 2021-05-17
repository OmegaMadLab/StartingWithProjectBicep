param administratorLogin string = 'strongLogin'

@secure()
param administratorLoginPassword string

var sqlserverName = concat('sqlserver', uniqueString(resourceGroup().id))
var dbName = 'DemoDB'
var collation = 'SQL_Latin1_General_CP1_CI_AS'
var edition = 'basic'
var requestedServiceObjectiveName = 'basic'
var maxSizeBytes = '1073741824'

module sqlSrv './sqlSrvMod.bicep' = {
  name: 'sqlServer'
  params: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}

param databaseName string

module db './dbMod.bicep' = {
  name: 'db'
  params: {
    sqlserverName: sqlSrv.outputs.SqlParameters.sqlserverName
    databaseName: dbName
    edition: edition
    collation: collation
    maxSizeBytes: maxSizeBytes
    requestedServiceObjectiveName: requestedServiceObjectiveName
  }
}
