using 'projects.bicep'

var platformName = readEnvironmentVariable('PLATFORM')

var projectAdminPrincipalId = 'd1724c62-a3be-416f-8735-77262fa93b9c'

param devCenterName = 'DC-${platformName}'
param projectName = 'Project-Rome'
param deploymentTargetId = '/subscriptions/5db218ce-c9b4-4cca-9d16-058d3354c640'
param projectMembers = [
  {
    user: projectAdminPrincipalId
    role: 'DevCenter Project Admin'
  }
]
param resourceTags = {
  CostCenter: '12345'
  Environment: 'Dev'
}
