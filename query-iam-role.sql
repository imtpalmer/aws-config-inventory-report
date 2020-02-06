SELECT
	accountId,
	arn,
	availabilityZone,
	awsRegion,
	configuration.arn,
	configuration.attachedManagedPolicies.policyArn,
	configuration.attachedManagedPolicies.policyName,
	configuration.createDate,
	configuration.instanceProfileList.arn,
	configuration.instanceProfileList.createDate,
	configuration.instanceProfileList.instanceProfileId,
	configuration.instanceProfileList.instanceProfileName,
	configuration.instanceProfileList.path,
	configuration.instanceProfileList.roles.arn,
	configuration.instanceProfileList.roles.createDate,
	configuration.instanceProfileList.roles.path,
	configuration.instanceProfileList.roles.roleId,
	configuration.instanceProfileList.roles.roleName,
	configuration.path,
	configuration.roleId,
	configuration.roleName,
	configuration.rolePolicyList.policyName,
	configurationItemCaptureTime,
	configurationItemStatus,
	configurationStateId,
	relationships.resourceId,
	relationships.resourceName,
	relationships.resourceType,
	resourceCreationTime,
	resourceId,
	resourceName,
	resourceType,
	tags
WHERE
    resourceType = 'AWS::IAM::Role'
