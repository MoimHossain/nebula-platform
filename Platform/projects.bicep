targetScope = 'resourceGroup'

@description('Dev Center Name.')
param devCenterName string
@description('Project Name.')
param projectName string
@description('Resource Tags.')
param resourceTags object

@description('The target subscription id for the project.')
param deploymentTargetId string
@description('The members to give access to the project')
param projectMembers memberRoleAssignment[]


type memberRoleAssignment = {
  user: string
  role: ('Deployment Environments User' | 'DevCenter Project Admin')
}

resource devCenter 'Microsoft.DevCenter/devcenters@2023-04-01' existing = {
  name: devCenterName
}

module project 'modules/dev-centers/projects/project.bicep' = {
  name: projectName
  scope: resourceGroup()
  params: {
    tags: resourceTags
    location: devCenter.location
    devCenterName: devCenter.name
    environmentTypes: [
      {
        name: 'Sandbox'        
        deploymentTargetId: deploymentTargetId
        tags: resourceTags        
        roles: [ 'Contributor' ]
        members: projectMembers
      }
    ]
    members: projectMembers
    name: projectName
  }
}
