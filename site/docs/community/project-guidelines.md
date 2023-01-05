# Project guidelines

## Project naming

The Infratographer contributors will be creating a lot of projects. We feel a name says a lot about a project, and first impressions are important. So the contributors will strive to create names that are clear, concise, and approachable.

Each project in infratographer will be in it's own git repository. Here are some guidelines for naming repositories:

* Don't using words or language that could be offensive to a member of the community. Ongoing violations of this guideline will be handled in accordance with the [Code of Conduct](community/code-of-conduct.md). Some examples are:
    * `primary` or `main` is preferred over `master`
    * `allowlist` is preferred over `whitelist`
    * This is not exhaustive, but you get the idea.
* The name of the repository needs to be clear, not clever.
* Long names should be perferred over short names.
* When picking names there should be a leading noun.
* A verb should be included, although `api` is acceptable.
* Nouns should relate to the technical domain of the project. For example:
    * `hardware-inventory-api` is preferred over `filing-cabinet`.
    * `tenant-permissions-reconciler` is preferred over `permissions-maid`.
* Avoid creating new TLA's (three letter acronyms), e.g.:
    * `loadbalancer-manager-haproxy` is preferred over `lbm-haproxy`
    * `identity-manager-ldap` is preferred over `idm-ldap`
* The above guideline applies to eTLA's (extended three letter acronyms) :smile:
* If a project is a part of a collection of related projects they should be prefixed similarly. For example:
    * `identity-manager-ldap` Yup, looks good :thumbsup:
    * `identity-manager-oidc` YES! :tada:
    * `kerberos-identity-manager` :thinking: :thinking: :thinking:, something is off here.


When in doubt, ask for help! The Infratographer ecosystem will be comprised of a bunch of projects, we want those project names to be approachable to our community.

## Repository guidelines

In no particular order, these are some things to expect when working with a Infratographer repository:

* Use forks for development, not branches on the main repository. This includes contributors with write access to the repository.
*  Each project will maintain and support a `dev container` and it will be used for local development and CI/CD.
* Each project will have a `Makefile` with the following targets:
    * `make build` - build the project
    * `make test` - run tests
    * `make lint` - run linters
    * `make clean` - clean up the project
* Each project should (i.e. are optional but encouraged) have additional targets for development related to specific dependencies, such as:
    * `make dev-database` -  clean up and run migrations on the development database
    * `make run-server` - run the server
* Each project will have a `README.md` with the following sections:
    * `Getting Started` - how to get started with the project
    * `Contributing` - how to contribute to the project linking to the website
    * `Code of Conduct` - the code of conduct for the project linking to the website
    * `License` - the license for the project
    * `Contact` - how to contact the project maintainers
* Each project will have a `docs` directory with the following files:
    * `development.md` - development guidelines for the project

    * `contributing.md` - how to contribute to the project
    * `code-of-conduct.md` - the code of conduct for the project
* Each project will have a `charts` directory for Helm charts. Additional deployment artifacts welcome, but Infragrapher Contributors will only support Helm charts.

## Code guidelines

A few guidelines for code and review process. The repetition is intentional:

* Don't using words or language that could be offensive to a member of the community. Ongoing violations of this guideline will be handled in accordance with the [Code of Conduct](community/code-of-conduct.md). Some examples are:
    * `primary` or `main` is preferred over `master`
    * `allowlist` is preferred over `whitelist`
    * This is not exhaustive, but you get the idea.
* Each project will have a `CODEOWNERS` file with the following entries:
    * `* @infratographer/<project-name>-maintainers`
* Comments should be used to explain why something is done, not what is done.
* Comments should should be in plain english, not code. Being a technical project this clearly doesn't imply that the comments should be candidates for a Pulitzer, but the comments should be  language that is approachable to the community.
* Be mindful of the size of your PRs. If you are making a large change, consider breaking it up into smaller PRs. This will make it easier for reviewers to review your code.
* Be mindful that not everyone has the same level of experience. If you are making a change that is not obvious, consider adding a comment to explain why the change was made.
* Assume that if a reviewer is asking for a change that they have the best of intentions. We strive for a welcoming community, and that includes attitudes towards each other on either side of the review process.
* Assume that if a contributor asks questions about comments that they have the best of intentions.
