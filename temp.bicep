param virtualMachines_JUMBMOIM_name string = 'JUMBMOIM'
param virtualNetworks_mokmjhavnet_name string = 'mokmjhavnet'
param publicIPAddresses_JUMBMOIM_ip_name string = 'JUMBMOIM-ip'
param storageAccounts_moimhossain123_name string = 'moimhossain123'
param applicationGateways_moimhaxy124_name string = 'moimhaxy124'
param publicIPAddresses_moimhagateway_name string = 'moimhagateway'
param networkInterfaces_jumbmoim908_z1_name string = 'jumbmoim908_z1'
param networkSecurityGroups_JUMBMOIM_nsg_name string = 'JUMBMOIM-nsg'
param privateEndpoints_pvtEndpointMoimHossain_name string = 'pvtEndpointMoimHossain'
param privateDnsZones_privatelink_blob_core_windows_net_name string = 'privatelink.blob.core.windows.net'
param networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name string = 'mokmjhavnet-default-nsg-westeurope'
param networkSecurityGroups_mokmjhavnet_backendsubnet_nsg_westeurope_name string = 'mokmjhavnet-backendsubnet-nsg-westeurope'

resource networkSecurityGroups_JUMBMOIM_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2023-06-01' = {
  name: networkSecurityGroups_JUMBMOIM_nsg_name
  location: 'westeurope'
  properties: {
    securityRules: []
  }
}

resource networkSecurityGroups_mokmjhavnet_backendsubnet_nsg_westeurope_name_resource 'Microsoft.Network/networkSecurityGroups@2023-06-01' = {
  name: networkSecurityGroups_mokmjhavnet_backendsubnet_nsg_westeurope_name
  location: 'westeurope'
  properties: {
    securityRules: [
      {
        name: 'AllowCorpnet'
        id: networkSecurityGroups_mokmjhavnet_backendsubnet_nsg_westeurope_name_AllowCorpnet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetPublic'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2700
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowSAW'
        id: networkSecurityGroups_mokmjhavnet_backendsubnet_nsg_westeurope_name_AllowSAW.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetSaw'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2701
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_resource 'Microsoft.Network/networkSecurityGroups@2023-06-01' = {
  name: networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name
  location: 'westeurope'
  properties: {
    securityRules: [
      {
        name: 'AllowGatewayManager'
        id: networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_AllowGatewayManager.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'Allow GatewayManager'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '65200-65535'
          sourceAddressPrefix: 'GatewayManager'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2702
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowCorpnet'
        id: networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_AllowCorpnet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetPublic'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2700
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowSAW'
        id: networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_AllowSAW.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetSaw'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2701
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource privateDnsZones_privatelink_blob_core_windows_net_name_resource 'Microsoft.Network/privateDnsZones@2018-09-01' = {
  name: privateDnsZones_privatelink_blob_core_windows_net_name
  location: 'global'
  properties: {
    maxNumberOfRecordSets: 25000
    maxNumberOfVirtualNetworkLinks: 1000
    maxNumberOfVirtualNetworkLinksWithRegistration: 100
    numberOfRecordSets: 2
    numberOfVirtualNetworkLinks: 1
    numberOfVirtualNetworkLinksWithRegistration: 0
    provisioningState: 'Succeeded'
  }
}

resource publicIPAddresses_JUMBMOIM_ip_name_resource 'Microsoft.Network/publicIPAddresses@2023-06-01' = {
  name: publicIPAddresses_JUMBMOIM_ip_name
  location: 'westeurope'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: [
    '1'
  ]
  properties: {
    ipAddress: '74.234.174.143'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource publicIPAddresses_moimhagateway_name_resource 'Microsoft.Network/publicIPAddresses@2023-06-01' = {
  name: publicIPAddresses_moimhagateway_name
  location: 'westeurope'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '52.174.167.171'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource storageAccounts_moimhossain123_name_resource 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccounts_moimhossain123_name
  location: 'westeurope'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Disabled'
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
    accessTier: 'Hot'
  }
}

resource virtualMachines_JUMBMOIM_name_resource 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachines_JUMBMOIM_name
  location: 'westeurope'
  zones: [
    '1'
  ]
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D4s_v3'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'microsoftwindowsdesktop'
        offer: 'windows-11'
        sku: 'win11-21h2-pro'
        version: 'latest'
      }
      osDisk: {
        osType: 'Windows'
        name: '${virtualMachines_JUMBMOIM_name}_OsDisk_1_83f2069f09884940857acaed623c7dc5'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_JUMBMOIM_name}_OsDisk_1_83f2069f09884940857acaed623c7dc5')
        }
        deleteOption: 'Delete'
        diskSizeGB: 127
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_JUMBMOIM_name
      adminUsername: 'moimhossain'
      windowsConfiguration: {
        provisionVMAgent: true
        enableAutomaticUpdates: true
        patchSettings: {
          patchMode: 'AutomaticByOS'
          assessmentMode: 'ImageDefault'
          enableHotpatching: false
        }
        enableVMAgentPlatformUpdates: false
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    securityProfile: {
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: 'TrustedLaunch'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_jumbmoim908_z1_name_resource.id
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
    licenseType: 'Windows_Client'
  }
}

resource networkSecurityGroups_mokmjhavnet_backendsubnet_nsg_westeurope_name_AllowCorpnet 'Microsoft.Network/networkSecurityGroups/securityRules@2023-06-01' = {
  name: '${networkSecurityGroups_mokmjhavnet_backendsubnet_nsg_westeurope_name}/AllowCorpnet'
  properties: {
    description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetPublic'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2700
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_mokmjhavnet_backendsubnet_nsg_westeurope_name_resource
  ]
}

resource networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_AllowCorpnet 'Microsoft.Network/networkSecurityGroups/securityRules@2023-06-01' = {
  name: '${networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name}/AllowCorpnet'
  properties: {
    description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetPublic'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2700
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_resource
  ]
}

resource networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_AllowGatewayManager 'Microsoft.Network/networkSecurityGroups/securityRules@2023-06-01' = {
  name: '${networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name}/AllowGatewayManager'
  properties: {
    description: 'Allow GatewayManager'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '65200-65535'
    sourceAddressPrefix: 'GatewayManager'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2702
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_resource
  ]
}

resource networkSecurityGroups_mokmjhavnet_backendsubnet_nsg_westeurope_name_AllowSAW 'Microsoft.Network/networkSecurityGroups/securityRules@2023-06-01' = {
  name: '${networkSecurityGroups_mokmjhavnet_backendsubnet_nsg_westeurope_name}/AllowSAW'
  properties: {
    description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetSaw'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2701
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_mokmjhavnet_backendsubnet_nsg_westeurope_name_resource
  ]
}

resource networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_AllowSAW 'Microsoft.Network/networkSecurityGroups/securityRules@2023-06-01' = {
  name: '${networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name}/AllowSAW'
  properties: {
    description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetSaw'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2701
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_resource
  ]
}

resource privateDnsZones_privatelink_blob_core_windows_net_name_moimhossain123 'Microsoft.Network/privateDnsZones/A@2018-09-01' = {
  parent: privateDnsZones_privatelink_blob_core_windows_net_name_resource
  name: 'moimhossain123'
  properties: {
    ttl: 3600
    aRecords: [
      {
        ipv4Address: '10.2.1.4'
      }
    ]
  }
}

resource Microsoft_Network_privateDnsZones_SOA_privateDnsZones_privatelink_blob_core_windows_net_name 'Microsoft.Network/privateDnsZones/SOA@2018-09-01' = {
  parent: privateDnsZones_privatelink_blob_core_windows_net_name_resource
  name: '@'
  properties: {
    ttl: 3600
    soaRecord: {
      email: 'azureprivatedns-host.microsoft.com'
      expireTime: 2419200
      host: 'azureprivatedns.net'
      minimumTtl: 10
      refreshTime: 3600
      retryTime: 300
      serialNumber: 1
    }
  }
}

resource virtualNetworks_mokmjhavnet_name_backendsubnet 'Microsoft.Network/virtualNetworks/subnets@2023-06-01' = {
  name: '${virtualNetworks_mokmjhavnet_name}/backendsubnet'
  properties: {
    addressPrefix: '10.2.1.0/24'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_mokmjhavnet_name_resource
  ]
}

resource storageAccounts_moimhossain123_name_default 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
  parent: storageAccounts_moimhossain123_name_resource
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    changeFeed: {
      enabled: false
    }
    restorePolicy: {
      enabled: false
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
    isVersioningEnabled: false
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_moimhossain123_name_default 'Microsoft.Storage/storageAccounts/fileServices@2023-01-01' = {
  parent: storageAccounts_moimhossain123_name_resource
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource storageAccounts_moimhossain123_name_storageAccounts_moimhossain123_name_59026252_0c69_4e93_aff0_82bea1d4ecc3 'Microsoft.Storage/storageAccounts/privateEndpointConnections@2023-01-01' = {
  parent: storageAccounts_moimhossain123_name_resource
  name: '${storageAccounts_moimhossain123_name}.59026252-0c69-4e93-aff0-82bea1d4ecc3'
  properties: {
    provisioningState: 'Succeeded'
    privateEndpoint: {}
    privateLinkServiceConnectionState: {
      status: 'Approved'
      description: 'Auto-Approved'
      actionRequired: 'None'
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_moimhossain123_name_default 'Microsoft.Storage/storageAccounts/queueServices@2023-01-01' = {
  parent: storageAccounts_moimhossain123_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_moimhossain123_name_default 'Microsoft.Storage/storageAccounts/tableServices@2023-01-01' = {
  parent: storageAccounts_moimhossain123_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource applicationGateways_moimhaxy124_name_resource 'Microsoft.Network/applicationGateways@2023-06-01' = {
  name: applicationGateways_moimhaxy124_name
  location: 'westeurope'
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        id: '${applicationGateways_moimhaxy124_name_resource.id}/gatewayIPConfigurations/appGatewayIpConfig'
        properties: {
          subnet: {
            id: virtualNetworks_mokmjhavnet_name_default.id
          }
        }
      }
    ]
    sslCertificates: []
    trustedRootCertificates: []
    trustedClientCertificates: []
    sslProfiles: []
    frontendIPConfigurations: [
      {
        name: 'appGwPublicFrontendIpIPv4'
        id: '${applicationGateways_moimhaxy124_name_resource.id}/frontendIPConfigurations/appGwPublicFrontendIpIPv4'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_moimhagateway_name_resource.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port_80'
        id: '${applicationGateways_moimhaxy124_name_resource.id}/frontendPorts/port_80'
        properties: {
          port: 80
        }
      }
      {
        name: 'port_8080'
        id: '${applicationGateways_moimhaxy124_name_resource.id}/frontendPorts/port_8080'
        properties: {
          port: 8080
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'STORAGEACCOUNT-BACKENDPOOL'
        id: '${applicationGateways_moimhaxy124_name_resource.id}/backendAddressPools/STORAGEACCOUNT-BACKENDPOOL'
        properties: {
          backendAddresses: [
            {
              fqdn: 'moimhossain123.blob.core.windows.net'
            }
          ]
        }
      }
    ]
    loadDistributionPolicies: []
    backendHttpSettingsCollection: [
      {
        name: 'STORAGE-BACKEND-SETTINGS'
        id: '${applicationGateways_moimhaxy124_name_resource.id}/backendHttpSettingsCollection/STORAGE-BACKEND-SETTINGS'
        properties: {
          port: 443
          protocol: 'Https'
          cookieBasedAffinity: 'Disabled'
          pickHostNameFromBackendAddress: true
          affinityCookieName: 'ApplicationGatewayAffinity'
          requestTimeout: 20
          probe: {
            id: '${applicationGateways_moimhaxy124_name_resource.id}/probes/STORAEHEALTHPROBE'
          }
        }
      }
    ]
    backendSettingsCollection: []
    httpListeners: [
      {
        name: 'FRONTEND-LISTENER'
        id: '${applicationGateways_moimhaxy124_name_resource.id}/httpListeners/FRONTEND-LISTENER'
        properties: {
          frontendIPConfiguration: {
            id: '${applicationGateways_moimhaxy124_name_resource.id}/frontendIPConfigurations/appGwPublicFrontendIpIPv4'
          }
          frontendPort: {
            id: '${applicationGateways_moimhaxy124_name_resource.id}/frontendPorts/port_8080'
          }
          protocol: 'Http'
          hostNames: []
          requireServerNameIndication: false
          customErrorConfigurations: []
        }
      }
    ]
    listeners: []
    urlPathMaps: []
    requestRoutingRules: [
      {
        name: 'ROUTINGTOSTROPAGE'
        id: '${applicationGateways_moimhaxy124_name_resource.id}/requestRoutingRules/ROUTINGTOSTROPAGE'
        properties: {
          ruleType: 'Basic'
          priority: 2
          httpListener: {
            id: '${applicationGateways_moimhaxy124_name_resource.id}/httpListeners/FRONTEND-LISTENER'
          }
          backendAddressPool: {
            id: '${applicationGateways_moimhaxy124_name_resource.id}/backendAddressPools/STORAGEACCOUNT-BACKENDPOOL'
          }
          backendHttpSettings: {
            id: '${applicationGateways_moimhaxy124_name_resource.id}/backendHttpSettingsCollection/STORAGE-BACKEND-SETTINGS'
          }
        }
      }
    ]
    routingRules: []
    probes: [
      {
        name: 'STORAEHEALTHPROBE'
        id: '${applicationGateways_moimhaxy124_name_resource.id}/probes/STORAEHEALTHPROBE'
        properties: {
          protocol: 'Https'
          path: '/gaga/index.txt'
          interval: 30
          timeout: 30
          unhealthyThreshold: 3
          pickHostNameFromBackendHttpSettings: true
          minServers: 0
          match: {
            statusCodes: [
              '409'
            ]
          }
        }
      }
    ]
    rewriteRuleSets: []
    redirectConfigurations: []
    privateLinkConfigurations: []
    enableHttp2: true
    autoscaleConfiguration: {
      minCapacity: 0
      maxCapacity: 4
    }
  }
}

resource privateDnsZones_privatelink_blob_core_windows_net_name_w77anlo7gwgqw 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2018-09-01' = {
  parent: privateDnsZones_privatelink_blob_core_windows_net_name_resource
  name: 'w77anlo7gwgqw'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: virtualNetworks_mokmjhavnet_name_resource.id
    }
  }
}

resource privateEndpoints_pvtEndpointMoimHossain_name_resource 'Microsoft.Network/privateEndpoints@2023-06-01' = {
  name: privateEndpoints_pvtEndpointMoimHossain_name
  location: 'westeurope'
  properties: {
    privateLinkServiceConnections: [
      {
        name: '${privateEndpoints_pvtEndpointMoimHossain_name}_f785ecbc-70ab-4390-915d-f497ff4bc0d6'
        id: '${privateEndpoints_pvtEndpointMoimHossain_name_resource.id}/privateLinkServiceConnections/${privateEndpoints_pvtEndpointMoimHossain_name}_f785ecbc-70ab-4390-915d-f497ff4bc0d6'
        properties: {
          privateLinkServiceId: storageAccounts_moimhossain123_name_resource.id
          groupIds: [
            'blob'
          ]
          privateLinkServiceConnectionState: {
            status: 'Approved'
            description: 'Auto-Approved'
            actionsRequired: 'None'
          }
        }
      }
    ]
    manualPrivateLinkServiceConnections: []
    subnet: {
      id: virtualNetworks_mokmjhavnet_name_backendsubnet.id
    }
    ipConfigurations: []
    customDnsConfigs: [
      {
        fqdn: 'moimhossain123.blob.core.windows.net'
        ipAddresses: [
          '10.2.1.4'
        ]
      }
    ]
  }
}

resource virtualNetworks_mokmjhavnet_name_resource 'Microsoft.Network/virtualNetworks@2023-06-01' = {
  name: virtualNetworks_mokmjhavnet_name
  location: 'westeurope'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.2.0.0/16'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'default'
        id: virtualNetworks_mokmjhavnet_name_default.id
        properties: {
          addressPrefix: '10.2.0.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_resource.id
          }
          applicationGatewayIPConfigurations: [
            {
              id: '${applicationGateways_moimhaxy124_name_resource.id}/gatewayIPConfigurations/appGatewayIpConfig'
            }
          ]
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'backendsubnet'
        id: virtualNetworks_mokmjhavnet_name_backendsubnet.id
        properties: {
          addressPrefix: '10.2.1.0/24'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource storageAccounts_moimhossain123_name_default_gaga 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  parent: storageAccounts_moimhossain123_name_default
  name: 'gaga'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [

    storageAccounts_moimhossain123_name_resource
  ]
}

resource networkInterfaces_jumbmoim908_z1_name_resource 'Microsoft.Network/networkInterfaces@2023-06-01' = {
  name: networkInterfaces_jumbmoim908_z1_name
  location: 'westeurope'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${networkInterfaces_jumbmoim908_z1_name_resource.id}/ipConfigurations/ipconfig1'
        etag: 'W/"a295fa43-7149-478b-98ac-f1b8934a6143"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.2.1.5'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_JUMBMOIM_ip_name_resource.id
            properties: {
              deleteOption: 'Delete'
            }
          }
          subnet: {
            id: virtualNetworks_mokmjhavnet_name_backendsubnet.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: true
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_JUMBMOIM_nsg_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

resource virtualNetworks_mokmjhavnet_name_default 'Microsoft.Network/virtualNetworks/subnets@2023-06-01' = {
  name: '${virtualNetworks_mokmjhavnet_name}/default'
  properties: {
    addressPrefix: '10.2.0.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_mokmjhavnet_default_nsg_westeurope_name_resource.id
    }
    applicationGatewayIPConfigurations: [
      {
        id: '${applicationGateways_moimhaxy124_name_resource.id}/gatewayIPConfigurations/appGatewayIpConfig'
      }
    ]
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_mokmjhavnet_name_resource

  ]
}
