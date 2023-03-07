# Tenancy

## Scope

Tenancy is the concept of providing isolated access to resources. In the context of the infratographer ecosystem, we are talking about the isolation of data and the ability to provide a single application to multiple tenants. The scope of this document is to provide a shared understanding and a working model for developing multi-tenant applications within the infratographer ecosystem. It is outside the scope to discuss multi-tenancy in other systems beyond infratographer except where drawing comparison helps to clarify our intent.

## Principles of Tenancy

### Tenants are Isolated

Tenants provide isolated access to data. Access to data within a tenant needs to be explicitly granted.

#### Rationale

Tenant isolation allows for granular access control.

#### Implications

Access to a tenant does not imply access to child or parent tenants.

### Tenants are Hierarchical

Tenants form a tree structure, and are not limited to a single level.

#### Rationale

Experience with multiple large projects (kubernetes, openstack, etc) has shown that many ecosystems start with single level tenancy and then migrate to hierarchical tenancy in the future. This migration is often fraught with peril, bugs and dragons.

#### Implications

Tenants can have sub-tenants that can have sub-tenants, etc. Recursion needs to be accounted for in services built for the infratographer ecosystem.

### Services in the ecosystem are Multi-Tenant

Services and applications in the infratographer ecosystem will need to interact with multiple tenants. This will be done securely and with awareness. 

#### Rationale

To support multitenancy, ecosystem services need to be tenant aware or have an instance deployed for every tenant. The former is preferable to the later.

#### Implications

The services that form the infratographer ecosystem are aware of the tenants and provide the means of segmenting resources owned by those tenants. This allows for a single application to be provided to multiple tenants. Resource segmentation must be explicit.

### Resources are owned by Tenants

A resources is owned by a single tenant, not multiple tenants.

#### Rationale

Granular access control will provide for a more secure environment. Identities can be given access to individual resources or tenants. Tracking an arbitrary number of tenants for a resource adds unecessary complexity.

#### Implications

Services in the infratographer ecosystem must track a single tenant association for each resource they manage.
