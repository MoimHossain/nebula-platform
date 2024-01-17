param devCenterName string
param uamiName string
param location string = resourceGroup().location
param resourceTags object = {}

resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' existing = {
  name: uamiName
}

resource devCenter 'Microsoft.DevCenter/devcenters@2023-04-01' = {
  name: devCenterName
  location: location
  tags: resourceTags
  identity: {
    type:  'UserAssigned'
     userAssignedIdentities: {
      '${uami.id}': {}
     }
  }
  properties: {}
}
