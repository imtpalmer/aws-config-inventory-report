SELECT
  resourceId,
  resourceName,
  resourceType,
  configuration.instanceType,
  availabilityZone,
  configuration.state.name,
  configuration.privateIpAddress,
  configuration.subnetId,
  configuration.keyName,
  configuration.eC2SecurityGroups,
  tags
WHERE
  resourceType = 'AWS::EC2::Instance'