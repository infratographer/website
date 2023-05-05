# Concepts

## Resource Providers

Resource providers in the Infratographer ecosystem are a mechanism for enabling/disabling resource management on a particular [tenant]: identity-and-access-management/tenancy.md and in a particular location. Enabling a resource provider, grants that resource provider, generally through a service account, access to act on behalf of the tenant.

### Example Resource Provider

An example of a resource provider is the `load-balancer` resource provider. When this provider is enabled on a tenant, in a given location, the service account associated with that provider is granted access to create and mutate objects in that tenant heirarchy.
