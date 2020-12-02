param administratorLogin string = 'strongLogin'
param administratorLoginPassword string {
  secure: true
}
param databaseName string
param environment string {
  metadata: {
    description: 'target environment'
  }
  allowed: [
    'TEST'
    'PROD'
  ]
}

var sqlserverName = concat('sqlserver', uniqueString(resourceGroup().id))
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
    name: environment == 'TEST' ? 'S0' : 'S3'
  }
  properties: {
    collation: collation
  }
}

output SqlParameters object = {
    SqlUri: sqlSrv.properties.fullyQualifiedDomainName
    SqlServerName: sqlSrv.name
}