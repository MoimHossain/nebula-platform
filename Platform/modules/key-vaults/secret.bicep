@description('Specifies the name of the key vault.')
param keyVaultName string

param secretName string
@secure()
param secretValue string


resource kv 'Microsoft.KeyVault/vaults@2021-11-01-preview' existing = {
  name: keyVaultName
}

resource secret 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: kv
  name: secretName
  properties: {
    value: secretValue
  }
}


output secretUri string = secret.properties.secretUri
output secretId string = secret.id
output secretUriWithVersion string = secret.properties.secretUriWithVersion
