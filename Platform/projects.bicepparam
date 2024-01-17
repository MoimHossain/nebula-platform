using 'projects.bicep'

var platformName = readEnvironmentVariable('PLATFORM')

var projectAdminPrincipalId = 'd1724c62-a3be-416f-8735-77262fa93b9c'

param devCenterName = 'DC-${platformName}'
param projectName = 'Project-Rome'
param deploymentTargetId = '/subscriptions/7f2413b7-93b1-4560-a932-220c34c9db29'
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
