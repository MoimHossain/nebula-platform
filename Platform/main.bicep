targetScope = 'subscription'

@description('Resource Group Name.') 
param resourceGroupName string
@description('User assigned managed identity name.')
param uamiName string
@description('Dev Center Name.')
param devCenterName string
@description('Catalog Name.')
param catalogName string
@description('Key Vault Name.')
param keyVaultName string
@description('Location.')
param location string
@description('Resource Tags.')
param resourceTags object
@description('Azure DevOps Personal Access Token.')
param PAT string
@description('Repository Uri.')
param repoUri string
@description('Catalog Path.')
param catalogPath string

// create role assignment
var KEY_VAULT_SECRETS_USER_ROLE_GUID = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')


resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
  tags: resourceTags
}

module uami 'modules/managed-identities/user-assigned-identity.bicep' = {
  name: uamiName
  scope: resourceGroup
  params: {
    uamiName: uamiName
    location: location    
  }
}

module keyVault 'modules/key-vaults/vault.bicep' = {
  scope: resourceGroup
  name: keyVaultName
  params: {
    keyVaultName: keyVaultName
    location: location
    objectId: uami.outputs.principalId    
  }
}

module secretEntry 'modules/key-vaults/secret.bicep' = {
  scope: resourceGroup
  name: 'AzDO-PAT' 
  params: {
    keyVaultName: keyVault.name 
    secretName: 'AzDOPAT'
    secretValue: PAT
  }
}

module keyVaultRoleAssignment 'modules/common/role-assignment.bicep' = {
  scope: resourceGroup
  name: 'KeyVaultSecretsUserRoleAssignment'
  params: {
    principalId: uami.outputs.principalId
    roleDefinitionId: KEY_VAULT_SECRETS_USER_ROLE_GUID
  }
}

module devCenter 'modules/dev-centers/dev-center.bicep' = {
  scope: resourceGroup
  name: devCenterName
  params: {
    devCenterName: devCenterName
    uamiName: uamiName
    location: location
    resourceTags: resourceTags
  }
}


module catalog 'modules/dev-centers/catalog.bicep' = {
  scope: resourceGroup
  name: catalogName
  params: {
    catalogName: catalogName
    devCenterName: devCenterName
    patRefernceUri: secretEntry.outputs.secretUri
    repoUri: repoUri
    path: catalogPath    
  }
}


module sandboxEnvType 'modules/dev-centers/environment-type.bicep' = {
  scope: resourceGroup
  name: 'Sandbox'
  params: {
    devCenterName: devCenterName
    name: 'Sandbox'
    tags: resourceTags
  }
}

module devEnvType 'modules/dev-centers/environment-type.bicep' = {
  scope: resourceGroup
  name: 'Development'
  params: {
    devCenterName: devCenterName
    name: 'Development'
    tags: resourceTags
  }
}

module stagingEnvType 'modules/dev-centers/environment-type.bicep' = {
  scope: resourceGroup
  name: 'Staging'
  params: {
    devCenterName: devCenterName
    name: 'Staging'
    tags: resourceTags
  }
}

module productionEnvType 'modules/dev-centers/environment-type.bicep' = {
  scope: resourceGroup
  name: 'Production'
  params: {
    devCenterName: devCenterName
    name: 'Production'
  }
}
