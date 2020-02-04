SELECT
    resourceId,
    resourceType,
    resourceName,
    resourceCreationTime,
    configuration.createdDate,
    awsRegion,
    configuration.name,
    configuration.description,
    configuration.endpointConfiguration.types
WHERE
    resourceType = 'AWS::ApiGateway::RestApi'