using 'test.bicep'

var mnemonic = 'awapda'

param resourceGroupName = '${mnemonic}-rg'
param location = 'westeurope' 
param resourceTags = { 
  CostCenter: 'PERSONAL'
  PURPOSE: 'DEMO' 
}

param uamiName = 'uami-${mnemonic}'
param vnetName = 'vnet-${mnemonic}'
param storageAccountName = 'moim${uniqueString(resourceGroupName)}'
param appGatewayName = 'appgw-${mnemonic}'
