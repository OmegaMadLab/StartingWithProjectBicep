param administratorLogin string

@secure()
param administratorLoginPassword string
param databaseName string

var sqlserverName_var = 'sqlserver${uniqueString(resourceGroup().id)}'
var skuName = 'S0'
var collation = 'SQL_Latin1_General_CP1_CI_AS'

resource sqlserverName 'Microsoft.Sql/servers@2019-06-01-preview' = {
  name: sqlserverName_var
  location: resourceGroup().location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}

resource sqlserverName_databaseName 'Microsoft.Sql/servers/databases@2019-06-01-preview' = {
  parent: sqlserverName
  name: '${databaseName}'
  location: resourceGroup().location
  sku: {
    name: skuName
  }
  properties: {
    collation: collation
  }
}

output SqlParameters object = {
  SqlUri: sqlserverName.properties.fullyQualifiedDomainName
  sqlserverName: sqlserverName_var
}