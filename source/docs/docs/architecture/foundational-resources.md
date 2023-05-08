# Foundational resources

The Infratographer ecosystem is comprised of various services that enable users to manage physical servers, virtual servers, networks, and more. To ensure these services work cohesively, the ecosystem is built with a shared foundation of essential building blocks that make up our foundational resources.

## Tenants

Tenants form the foundation of Infratographer, and multi-tenancy is a core concept of the system from its inception. All resources in Infratographer, except for users, are tied to tenants.

!!! example "Tenant Structure"

    ``` mermaid
    graph TD
      A[Sarah Corp]
      A --> AA[Production]
      A --> AB[Development]

      B[Nicole Corp]

      C[Freckle Corp]
      C --> CA[Infrastructure]
      CA --> CAA[Internal]
      CA --> CAB[External]
      C --> CB[Development]
    ```

Tenants exist in a tree and multiple root tenants can exist. Root tenants can have any number of tenants under them and subtenants can also have their own subtenants. A root tenant can also have resources on it directly as would be the case with `Nicole Corp` in the example. All tenants are treated the same and can have resources assigned to them.

As shown in the above example, tenants are arranged in a tree structure, with multiple root tenants being possible. Root tenants may have any number of sub-tenants, and each sub-tenant can have its own sub-tenants. All tenants are treated equally and can have resources assigned to them, including root tenants, as is the case with `Nicole Corp` in the example.

Read more about tenancy in our [tenancy docs].

[tenancy docs]: ../identity-and-access-management/tenancy.md

## Users

While not considered a foundation of the system, users are a unique resource that exist outside of the tenant structure in Infratographer. It is worth highlighting this fact to emphasize their uniqueness in the system.

When a user makes their first successfully authenticated request, a new user resource is created which provices a unique ID to represent the user throughtout Infratographer.

After being created, a user can be granted access to a tenant, which allows them to perform operations and access resources within that tenant and all its sub-tenants. Users can be granted access to one or more tenants, as needed, and can be managed through the permissions APIs provided by Infratographer.

Read more about users and authentication in our [identity docs].

[identity docs]: ../identity-and-access-management/identity.md

## Locations

Locations in Infratographer are used as a representation of an environment in which resources can be deployed. They differ from physical facilities or other concrete places and serve as a way to represent regions, availability zones, and other logical location based groupings of resources.

Resources created within Infratographer are associated with a single location to indicate where they should be provisioned. For example, if you have data centers in New York, Los Angeles, São Paulo, London, Paris, and Hong Kong, you might have a "Global" location that includes all of the data centers, as well as locations called "North America Region", "South America Region", "Europe Region", and "Asia Region". You could also have locations that represent availability zones within a data center, such as "São Paulo - Zone 1" and "São Paulo - Zone 2".

Locations are not stored in Infratographer as a tree, even though the user's implementation will likely resemble a tree. This is because storing them as a tree would imply that there is a relationship between them for sharing resources, which might not always be the case. For example, provisioning a load balancer in the "Global" location doesn't necessarily mean it's available in the locations under it. It simply means it runs in what you call your "Global" region, which may or may not includes all of the data centers you have.

It's important to note that creating a load balancer in a specific location does not mean it is available in sub-locations. For example, if the "Global" location includes all data centers, creating a load balancer in New York does not automatically make it available in the "Global" location. Instead, you would need to create the load balancer in the "Global" location or in a location that is a direct child of the "Global" location.

## Resource Providers

Resource providers play a critical role in Infratographer's architecture by managing the provisioning, management, and lifecycle of resources. When you create an instance that needs to be provisioned on a physical server, an instance provider will facilitate this process. The instance provider uses a resource providers to request access to additional tenants.

The Instance API and the Load Balancer API manage instance providers and load balancer providers, respectively. However, the resource provider representation of them is managed by the Resource Provider API. Although there isn't a way to request a list of every resource of a given type, the "Foo" load balancer provider needs to access a list of every load balancer it is responsible for provisioning. To enable this, we require an easy way to indicate which locations the "Foo" load balancer provider is available in. We also need to ensure that this information is accessible to other tenants.

!!! example "Resource Provider ER Diagram"

    ```mermaid
    erDiagram
      Tenant-100 ||--|{ Location-LA : "belongs to"
      Tenant-100 ||--|{ Location-NY : "belongs to"
      Tenant-100 ||--|{ LB-Provider-Foo : "belongs to"
      Tenant-100 ||--|{ Resource-Provider-LoadBalancers : "belongs to"
      LB-Provider-Foo }|--|| Resource-Provider-LoadBalancers : "uses"
      LB-Provider-Bar }|--|| Resource-Provider-LoadBalancers : "uses"

      Tenant-100 ||--|{ Tenant-200 : "sub tenant"
      Resource-Provider-LoadBalancers |o--o| Location-NY : "available"
      Tenant-200 |o--o| Location-NY : "available"
      Tenant-200 |o--o| Resource-Provider-LoadBalancers : "available"
      Tenant-200 |o--o| Resource-Provider-LoadBalancers : "authorized"
    ```

To clarify the resource provider's role, we provide an example ER diagram. In this scenario, Tenant-100 has created Location-LA, Location-NY, LB-Provider-Foo, LB-Provider-Bar, and Resource-Provider-LoadBalancers. Both LB-Provider-Foo and LB-Provider-Bar use Resource-Provider-LoadBalancers to interact with tenants. Additionally, Tenant-100 has a sub-tenant of Tenant-200. Tenant-100 has marked Location-NY and Resource-Provider-LoadBalancers "available" for Tenant-200. Tenant-100 has also marked Resource-Provider-LoadBalancers as being available in "Location-NY".

Tenant-200 then authorized Resource-Provider-LoadBalancers. Tenants can complete the authorizion for all of their sub-tenants or only for their direct tenant. Once this was completed, the resource provider was granted permissions to Tenant-200. In this example, since it's a load balancer provider, Resource-Provider-LoadBalancers is configured to request all scopes to load balancer resources as well as read access to network scopes and instance scopes. As a result, Resource-Provider-LoadBalancers read network and instance information and perform any actions against the load balancers in the tenant.

## Metadata

!!! danger

    This section is incomplete.

All resources can have metadata.

Metadata provides:

  - annotations
  - statuses
  - finalizers

Heavily influenced by the K8s metadata spec.
