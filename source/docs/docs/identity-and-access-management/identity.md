# Identity

## Scope

An identity is a collection of verifiable claims one makes about oneself. In the context of the Infratographer ecosystem, identity primarily focuses on validating the claims a subject makes about their identity, where a subject is a human user, a machine, or any other entity that can be uniquely identified.

## Principles of Identity

### Infratographer does not manage identities

Infratographer makes no assertions about what a subject is beyond their ability to present valid tokens to services and the format of those tokens. Identity management functionality - such as profile updates, password resets, and so on - is not included in the Infratographer ecosystem.

#### Rationale

Organizations often have their own identity management lifecycles and leverage external solutions for managing their users, service accounts, and other identifiable subjects. Rather than implement this functionality and require reconciliation of state between upstream identity providers and Infratographer services, it is easier to instead leverage open standards to connect identity management services to the Infratographer ecosystem.

#### Implications

Any deployment of Infratographer requires an external identity management solution. Additionally, because there is no identity management service in Infratographer, services must assume that any valid token they receive represents an existing subject in an active state.

### Identity is conveyed through JWTs and well-formed URNs

As an alternative to identity management, services authenticate subjects using JWTs from a known issuer as security tokens. Subject identifiers are conveyed using URNs in the `infratographer` namespace in JWT claims.

#### Rationale

Open standards allow for more composability of components within the Infratographer ecosystem. An administrator deploying Infratographer can choose to leverage the default suite of services for authentication or bring their own, provided they issue well-formed JWT access tokens.

#### Implications

JWTs issued to services must conform to existing specifications for Infratographer access tokens. These tokens must also contain sufficient information to make authorization decisions about subjects attempting to perform actions. Tokens should also be short-lived to prevent replay attacks.

### Identities are bound to issuers

A subject's identity provider is considered to be part of their identity. For example, if a user has the email address `foo@example.com` and is registered with two OIDC providers `https://auth.example.com` and `https://internal.example.com`, they should present with two separate subject URNs depending on the method of authentication used.

#### Rationale

When presented with two valid tokens from different identity providers, many services rely on best-effort attempts to understand when those two identities correspond to the same subject (e.g., merging subject records based on email address). This process is inherently risky and makes it difficult to implement features such as authorization policies based on the subject's originating identity provider. Rather than try to guess when one subject is the same as another, it is easier to instead consider subjects as unique based on the combination of their identity provider and internal subject ID.

#### Implications

Authorization is granted to subjects on the basis of the identity provider they authenticate against in addition to their subject identifier. There is no relationship between a subject from one identity provider and a subject from another, even if they share all of the same profile information and identifying credentials.

### All services trust a single source of identities

Within a given Infratographer deployment, all services must trust the same issuer for access tokens they consume.

#### Rationale

Configuring services to accept access tokens from multiple issuers increases the complexity of a given deployment without a marked improvement in security or reliability.

#### Implications

In cases where tokens from multiple issuers must be accepted, methods based on open standards such as OAuth 2.0 token exchange should be used instead.
