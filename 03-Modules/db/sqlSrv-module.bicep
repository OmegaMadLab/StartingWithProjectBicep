param administratorLogin string = 'strongLogin'

@secure()
param administratorLoginPassword string

param location string = resourceGroup().location

param sqlServerName string


resource sqlSrv 'Microsoft.Sql/servers@2014-04-01' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}

resource fwRule 'Microsoft.Sql/servers/firewallrules@2014-04-01' = {
    name: '${sqlSrv.name}/firewallRule'
    properties: {
        startIpAddress: '0.0.0.0'
        endIpAddress: '255.255.255.255'
    }
  }

output SqlParameters object = {
    SqlUri: sqlSrv.properties.fullyQualifiedDomainName
    SqlServerName: sqlSrv.name
}
