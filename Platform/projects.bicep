targetScope = 'resourceGroup'

@description('Dev Center Name.')
param devCenterName string

param userPrincipalId string = '015f84bd-2d24-43d8-a03a-32349d1e2148'


resource devCenter 'Microsoft.DevCenter/devcenters@2023-04-01' existing = {
  name: devCenterName
}

module project 'modules/dev-centers/projects/project.bicep' = {
  name: 'project-athena' 
  scope: resourceGroup()

  params: {
    tags: {
      'dev-center': devCenterName
    }
    location: devCenter.location
    devCenterName: devCenter.name
    environmentTypes: [
      {
        name: 'Sandbox'        
        deploymentTargetId: '/subscriptions/7f2413b7-93b1-4560-a932-220c34c9db29'
        tags: {
          'dev-center': devCenterName
        }
        roles: [ 'Contributor' ]
        members: [
          {
            user: userPrincipalId
            role: 'DevCenter Project Admin'
          }
        ]
      }
    ]
    members: [
      {
        user: userPrincipalId
        role: 'DevCenter Project Admin'
      }
    ]
    name: 'project-athena-x'
  }
}
