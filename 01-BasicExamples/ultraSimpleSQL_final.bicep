param administratorLogin string

@secure()
param administratorLoginPassword string

param databaseName string

//var sqlserverName = concat('sqlserver', uniqueString(resourceGroup().id))
var sqlserverName = 'sqlserver${uniqueString(resourceGroup().id)}'

var skuName = 'S0'
var collation = 'SQL_Latin1_General_CP1_CI_AS'

resource sqlSrv 'Microsoft.Sql/servers@2019-06-01-preview' = {
  name: sqlserverName
  location: resourceGroup().location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}



resource db 'Microsoft.Sql/servers/databases@2019-06-01-preview' = {
  name: '${sqlSrv.name}/${databaseName}'
  location: resourceGroup().location
  sku: {
    name: skuName
  }
  properties:{
    collation: collation
  }
}

output SqlParameters object = {
  SqlUri: sqlSrv.properties.fullyQualifiedDomainName
  sqlserverName: sqlSrv.name
}
