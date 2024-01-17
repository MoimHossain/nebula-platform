

param principalId string
param roleDefinitionId string

resource keyVaultWebsiteUser 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid('SecretsUser', principalId)  
  properties: {
    principalId: principalId
    roleDefinitionId: roleDefinitionId
  }
}
