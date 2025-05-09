param location string
param name string
param adminUsername string


var imageReference = {
  publisher: 'MicrosoftWindowsServer'
  offer: 'WindowsServer'
  sku: '2019-Datacenter'
  version: 'latest'
}

module avmVnet 'br/public:avm/res/network/virtual-network:0.6.1' = {
  name: 'avmVnet'
  params: {
    name: '${name}-vnet'
    location: location
    addressPrefixes: [ '10.0.0.0/16' ]
    subnets: [
      {
        name: 'subnet1'
        addressPrefix: '10.0.0.0/24'
      }
    ]
  }
}

module avmVm 'br/public:avm/res/compute/virtual-machine:0.15.0' = {
  params: {
    name: name
    adminUsername: adminUsername
    imageReference: {
      publisher: imageReference.publisher
      offer: imageReference.offer
      sku: imageReference.sku
      version: imageReference.version
    }
    nicConfigurations: [
      {
        name: 'nicConfig'
        ipConfigurations: [
          {
            name: 'ipConfig'
            subnetResourceId: avmVnet.outputs.subnetResourceIds[0]
          }
        ]
      }
    ]
    osDisk: {
      managedDisk: {
        storageAccountType: 'StandardSSD_LRS'
      }
    }
    osType: 'Windows'
    vmSize: 'Standard_D2s_v3'
    zone: 1
  }
}
