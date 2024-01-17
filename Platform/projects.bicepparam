using 'projects.bicep'

var platformName = readEnvironmentVariable('PLATFORM')

var projectAdminPrincipalId = 'd1724c62-a3be-416f-8735-77262fa93b9c'

param devCenterName = 'DC-${platformName}'
param projectName = 'Project-Rome'
param deploymentTargetId = '/subscriptions/c5b22afb-96db-4354-99a4-5f808d5221c6'
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
