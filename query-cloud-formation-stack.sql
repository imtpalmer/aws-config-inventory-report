SELECT
    resourceId,
    resourceType,
    resourceName,
    resourceCreationTime,
    configuration.stackName,
    configuration.stackStatus,
    configuration.createdDate,
    configuration.description,
    awsRegion,
    availabilityZone
WHERE
    resourceType = 'AWS::CloudFormation::Stack'