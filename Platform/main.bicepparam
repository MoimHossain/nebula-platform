using 'main.bicep'

var platformName = readEnvironmentVariable('PLATFORM')
var azdoPat = readEnvironmentVariable('AZDOPAT')

param resourceGroupName = 'RGP-${platformName}'
param uamiName = 'UAMI-${platformName}'
param devCenterName = 'DC-${platformName}'
param catalogName = 'CAT-${platformName}'
param keyVaultName = 'kv${platformName}${uniqueString(resourceGroupName)}'
param location = 'westeurope' 
param resourceTags = { 
  CostCenter: 'PERSONAL'
  PURPOSE: 'DEMO' 
}
param PAT = '${azdoPat}'
param repoUri = 'https://dev.azure.com/moim/Contoso/_git/nebula-catalog'
param catalogPath = '/infrastructure-templates'
