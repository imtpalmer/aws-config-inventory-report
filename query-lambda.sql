SELECT
    resourceId,
    resourceType,
    resourceName,
    configuration.functionName,
    configuration.handler,
    configuration.runtime,
    configuration.lastModified,
    configuration.description,
    configuration.vpcConfig.securityGroupIdsa,
    configuration.codeSize
WHERE
    resourceType = 'AWS::Lambda::Function'