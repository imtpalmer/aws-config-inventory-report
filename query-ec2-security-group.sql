SELECT
    resourceId,
    resourceName,
    resourceType,
    resourceCreationTime,
    configuration.description,
    configuration.groupId,
    configuration.groupName,
    configuration.ipPermissions.fromPort,
    configuration.ipPermissions.ipProtocol,
    configuration.ipPermissions.ipRanges,
    configuration.ipPermissions.toPort,
    configuration.ipPermissionsEgress.fromPort,
    configuration.ipPermissionsEgress.ipProtocol,
    configuration.ipPermissionsEgress.ipRanges
WHERE
    resourceType = 'AWS::EC2::SecurityGroup'