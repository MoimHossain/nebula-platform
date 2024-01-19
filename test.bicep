param location string
param storageAccountName string
param accountType string
param kind string
param minimumTlsVersion string
param supportsHttpsTrafficOnly bool
param allowBlobPublicAccess bool
param allowSharedKeyAccess bool
param defaultOAuth bool
param accessTier string
param publicNetworkAccess string
param allowCrossTenantReplication bool
param networkAclsBypass string
param networkAclsDefaultAction string
param dnsEndpointType string
param keySource string
param encryptionEnabled bool
param keyTypeForTableAndQueueEncryption string
param infrastructureEncryptionEnabled bool
param isContainerRestoreEnabled bool
param isBlobSoftDeleteEnabled bool
param blobSoftDeleteRetentionDays int
param isContainerSoftDeleteEnabled bool
param containerSoftDeleteRetentionDays int
param changeFeed bool
param isVersioningEnabled bool
param isShareSoftDeleteEnabled bool
param shareSoftDeleteRetentionDays int

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageAccountName
  location: location
  properties: {
    minimumTlsVersion: minimumTlsVersion
    supportsHttpsTrafficOnly: supportsHttpsTrafficOnly
    allowBlobPublicAccess: allowBlobPublicAccess
    allowSharedKeyAccess: allowSharedKeyAccess
    defaultToOAuthAuthentication: defaultOAuth
    accessTier: accessTier
    publicNetworkAccess: publicNetworkAccess
    allowCrossTenantReplication: allowCrossTenantReplication
    networkAcls: {
      bypass: networkAclsBypass
      defaultAction: networkAclsDefaultAction
      ipRules: []
    }
    dnsEndpointType: dnsEndpointType
    encryption: {
      keySource: keySource
      services: {
        blob: {
          enabled: encryptionEnabled
        }
        file: {
          enabled: encryptionEnabled
        }
        table: {
          enabled: encryptionEnabled
        }
        queue: {
          enabled: encryptionEnabled
        }
      }
      requireInfrastructureEncryption: infrastructureEncryptionEnabled
    }
  }
  sku: {
    name: accountType
  }
  kind: kind
  tags: {}
  dependsOn: []
}

resource storageAccountName_default 'Microsoft.Storage/storageAccounts/blobServices@2022-05-01' = {
  parent: storageAccount
  name: 'default'
  properties: {
    restorePolicy: {
      enabled: isContainerRestoreEnabled
    }
    deleteRetentionPolicy: {
      enabled: isBlobSoftDeleteEnabled
      days: blobSoftDeleteRetentionDays
    }
    containerDeleteRetentionPolicy: {
      enabled: isContainerSoftDeleteEnabled
      days: containerSoftDeleteRetentionDays
    }
    changeFeed: {
      enabled: changeFeed
    }
    isVersioningEnabled: isVersioningEnabled
  }
}

resource Microsoft_Storage_storageAccounts_fileservices_storageAccountName_default 'Microsoft.Storage/storageAccounts/fileservices@2022-05-01' = {
  parent: storageAccount
  name: 'default'
  properties: {
    protocolSettings: null
    shareDeleteRetentionPolicy: {
      enabled: isShareSoftDeleteEnabled
      days: shareSoftDeleteRetentionDays
    }
  }
  dependsOn: [

    storageAccountName_default
  ]
}

module privateEndpoints_0_41837443309260935 'https://storage.hosting.portal.azure.net/storage/Content/5.13.393.1409/DeploymentTemplates/PrivateEndpointForStorage.json' = {
  name: 'privateEndpoints_0.41837443309260935'
  scope: resourceGroup('7f2413b7-93b1-4560-a932-220c34c9db29', 'test-demo')
  params: {
    privateEndpointName: 'PRIVSATEENP'
    privateEndpointConnectionId: '/subscriptions/7f2413b7-93b1-4560-a932-220c34c9db29/resourceGroups/test-demo/providers/Microsoft.Network/privateEndpoints/privateLinkServiceConnections/PRIVSATEENP_c299f767-b874-4908-ac98-e5919938d01a'
    privateEndpointConnectionName: 'PRIVSATEENP_c299f767-b874-4908-ac98-e5919938d01a'
    privateEndpointId: '/subscriptions/7f2413b7-93b1-4560-a932-220c34c9db29/resourceGroups/test-demo/providers/Microsoft.Network/privateEndpoints/PRIVSATEENP'
    privateEndpointApiVersion: '2021-05-01'
    privateLinkServiceId: '/subscriptions/7f2413b7-93b1-4560-a932-220c34c9db29/resourcegroups/test-demo/providers/Microsoft.Storage/storageAccounts/gaga'
    groupId: 'web'
    subnetId: '/subscriptions/7f2413b7-93b1-4560-a932-220c34c9db29/resourceGroups/dev-env-vm/providers/Microsoft.Network/virtualNetworks/WINVMMHA-vnet/subnets/default'
    location: 'westeurope'
    tags: {}
  }
  dependsOn: [
    'Microsoft.Storage/storageAccounts/gaga'
  ]
}

module PrivateDns_0_23307667363248408 './nested_PrivateDns_0_23307667363248408.bicep' = {
  name: 'PrivateDns-0.23307667363248408'
  scope: resourceGroup(string('7f2413b7-93b1-4560-a932-220c34c9db29'), string('dev-env-vm'))
  params: {
    reference_privateEndpoints_0_41837443309260935_outputs_networkInterfaceId_value: privateEndpoints_0_41837443309260935.properties
  }
  dependsOn: [
    string('privateEndpoints_0.41837443309260935')
  ]
}
