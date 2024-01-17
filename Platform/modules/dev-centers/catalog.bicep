

param devCenterName string
param catalogName string
param repoUri string
param path string = ''
param branchName string = 'main'
param patRefernceUri string


resource devCenter 'Microsoft.DevCenter/devcenters@2023-04-01' existing = {
  name: devCenterName
}


resource catalog 'Microsoft.DevCenter/devcenters/catalogs@2023-04-01' = {
  name: catalogName
  parent: devCenter
  properties: {
    adoGit: {
      branch: branchName
      path: path
      secretIdentifier: patRefernceUri
      uri: repoUri
    }
  }
}
