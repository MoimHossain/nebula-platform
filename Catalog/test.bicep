targetScope = 'subscription'

@description('Resource Group Name.') 
param resourceGroupName string
@description('Location.')
param location string
@description('User assigned managed identity name.')
param uamiName string
@description('Virtual Network Name.')
param vnetName string
@description('Storage account name.')
param storageAccountName string
@description('Application Gateway Name.')
param appGatewayName string
@description('Resource Tags.')
param resourceTags object

// Defining local variables - mostly derived from parameters
var storageEndpointName = '${storageAccountName}-storage-endpoint'
var core = 'core'
var storageServiceGroupName = 'web'
var dnsZoneName = 'privatelink.${storageServiceGroupName}.${core}.windows.net'

// var fqdn = '${storageAccountName}.${dnsZoneName}' // This would be the ideal way to define the FQDN, but it will raise the certificate issue
var fqdn = '${storageAccountName}.z6.${storageServiceGroupName}.${core}.windows.net'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
  tags: resourceTags
}

module uami 'modules/common/identity/user-assigned-identity.bicep' = {
  scope: resourceGroup
  name: uamiName
  params: {
    uamiName: uamiName
    location: location
  }
}

module vnet 'modules/networking/virtual-network.bicep' = {
  scope: resourceGroup
  name: vnetName
  params: {
    vnetName: vnetName
    location: location
  }
}

module storageAccount 'modules/storage/storage-account.bicep' = {
  scope: resourceGroup
  name: storageAccountName
  params: {
    accountName: storageAccountName
    uamiName: uami.outputs.name
    location: location
  }
}


module dnsZone 'modules/networking/dnsZone.bicep' = {
  scope: resourceGroup
  name: dnsZoneName
  params: {
    dnsZoneName: dnsZoneName
    vnetId: vnet.outputs.vnetId
    vnetName: vnet.outputs.vnetName
  }
}


module storagePrivateEndpoint 'modules/networking/private-endpoint.bicep' = {
  scope: resourceGroup
  name: storageEndpointName
  params: {
    location: location
    storageServiceGroupName: storageServiceGroupName
    dnsZoneId: dnsZone.outputs.dnsZoneId
    endpointName: storageEndpointName
    storageAccountName: storageAccount.outputs.name
    subnetId: vnet.outputs.vnetBackendSubnetId
  }
}

module appGateway 'modules/networking/application-gateway.bicep' = {
  scope: resourceGroup
  name: appGatewayName
  params: {
    gatewayName: appGatewayName
    subnetId: vnet.outputs.vnetGatewaySubnetId
    backendFqdn: fqdn
    location: location
  }
}
