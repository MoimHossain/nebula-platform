using 'test.bicep'

var mnemonic = 'rainbow'

param resourceGroupName = '${mnemonic}-rg'
param location = 'westeurope' 
param resourceTags = { 
  CostCenter: 'PERSONAL'
  PURPOSE: 'DEMO' 
}

param vnetName = 'vnet-${mnemonic}'
param storageAccountName = 'sa${uniqueString(resourceGroupName)}'
param appGatewayName = 'appgw-${mnemonic}'
