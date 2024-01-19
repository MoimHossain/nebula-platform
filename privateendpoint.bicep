param privateEndpointName string
param privateEndpointConnectionId string
param privateEndpointConnectionName string
param privateLinkServiceId string
param privateEndpointId string
param privateEndpointApiVersion string
param groupId string
param subnetId string
param location string
param tags object

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2019-04-01' = {
  name: privateEndpointName
  location: location
  properties: {
    privateLinkServiceConnections: [
      {
        id: privateEndpointConnectionId
        name: privateEndpointConnectionName
        properties: {
          privateLinkServiceId: privateLinkServiceId
          groupIds: [
            groupId
          ]
        }
      }
    ]
    manualPrivateLinkServiceConnections: []
    subnet: {
      id: subnetId
    }
  }
  tags: tags
}

output networkInterfaceId string = reference(privateEndpointId, privateEndpointApiVersion).networkInterfaces[0].id
