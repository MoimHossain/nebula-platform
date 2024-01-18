

param accountName string
param location string = resourceGroup().location
param skuName string = 'Standard_RAGRS'
param kind string = 'StorageV2'
param dnsEndpointType string = 'Standard'
param publicNetworkAccess string = 'Disabled'
param defaultToOAuthAuthentication bool = false
param accessTier string = 'Hot'


resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: accountName
  location: location
  sku: {
    name: skuName
  }
  kind: kind
  properties: {
    dnsEndpointType: dnsEndpointType
    defaultToOAuthAuthentication: defaultToOAuthAuthentication
    publicNetworkAccess: publicNetworkAccess
    allowCrossTenantReplication: false
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Deny'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: accessTier
  }
}

module blobService 'blob-service.bicep' = {
  name: 'blob-service'
  params: {
    accountName: storageAccount.name
  }
}

module fileService 'file-service.bicep' = {
  name: 'file-service'
  params: {
    accountName: storageAccount.name
  }
}

module webContainer 'container.bicep' = {
  name: 'container'
  params: {
    accountName: storageAccount.name
  }
}

output id string = storageAccount.id
output name string = storageAccount.name
output properties object = storageAccount.properties
output primaryEndpoints object = storageAccount.properties.primaryEndpoints
output primaryLocation string = storageAccount.location


