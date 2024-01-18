param reference_privateEndpoints_0_4796863476231379_outputs_networkInterfaceId_value object

resource privatelink_blob_core_windows_net 'Microsoft.Network/privateDnsZones@2018-09-01' = {
  name: string('privatelink.blob.core.windows.net')
  location: 'global'
  tags: {}
  properties: {}
}

resource privatelink_blob_core_windows_net_subscriptions_7f2413b7_93b1_4560_a932_220c34c9db29_resourceGroups_rainbow_providers_Microsoft_Network_virtualNetworks_vnet_rainbow 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2018-09-01' = {
  name: '${string('privatelink.blob.core.windows.net')}/${uniqueString(string('/subscriptions/7f2413b7-93b1-4560-a932-220c34c9db29/resourceGroups/rainbow/providers/Microsoft.Network/virtualNetworks/vnet-rainbow'))}'
  location: 'global'
  properties: {
    virtualNetwork: {
      id: string('/subscriptions/7f2413b7-93b1-4560-a932-220c34c9db29/resourceGroups/rainbow/providers/Microsoft.Network/virtualNetworks/vnet-rainbow')
    }
    registrationEnabled: false
  }
  dependsOn: [
    privatelink_blob_core_windows_net
  ]
}

module EndpointDnsRecords_0_1198248247372895 'https://storage.hosting.portal.azure.net/storage/Content/5.13.393.1403/DeploymentTemplates/PrivateDnsForPrivateEndpoint.json' = {
  name: 'EndpointDnsRecords-0.1198248247372895'
  params: {
    privateDnsName: string('privatelink.blob.core.windows.net')
    privateEndpointNicResourceId: reference_privateEndpoints_0_4796863476231379_outputs_networkInterfaceId_value.outputs.networkInterfaceId.value
    nicRecordsTemplateUri: 'https://storage.hosting.portal.azure.net/storage/Content/5.13.393.1403/DeploymentTemplates/PrivateDnsForPrivateEndpointNic.json'
    ipConfigRecordsTemplateUri: 'https://storage.hosting.portal.azure.net/storage/Content/5.13.393.1403/DeploymentTemplates/PrivateDnsForPrivateEndpointIpConfig.json'
    uniqueId: '0.1198248247372895'
    existingRecords: {}
  }
  dependsOn: [
    privatelink_blob_core_windows_net
  ]
}
