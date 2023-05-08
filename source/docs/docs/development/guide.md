# Development guidelines

## Development environment

Infratographer projects will use [dev containers](https://containers.dev) for local development. This will ensure that all contributors are using the same development environment. This will also ensure that the development environment is portable and can be used in CI/CD.

Contributors can use the dev container locally through an editor or the command line. For more information on how to use dev containers. the goal is to create the local environment not dictate a specific tool. Well, other than `docker` or `docker-compose` :wink:. Priority should be given equally to both the in-editor experience and the command-line experience.

## Development tools

Infratographer is (largely) a Golang-based project, however. this may change as the project grows. However, there are some preexisting tool choices that we will use for the time being:

* `make` is used for running tasks in the repository.
* CockroachDB is the defacto database.
* Authzed/SpiceDB for authentication.
* Nats is the message queueing system.
* Kubernetes as a deployment platform.
* `docker` and `docker-compose` for local development and CI/CD runtime.


These tools are not set in stone and may change as the project grows. However, we will try to avoid changing these tools unless absolutely necessary.

## Development workflow

The development workflow is as follows:

* Fork the repository
* Do some changes
* Create a pull request
* Iterate on feedback
* Celebrate when the pull request is merged :tada:

## CI/CD

Infratographer projects will use GitHub Actions for CI/CD. This allows contributors to run tests on their forks without requiring maintainer involvement. It also enables us to automate builds, tests, and releases based on various triggers, such as pull requests, tags, or commits to specific branches.

We aim to have a fast and reliable CI/CD pipeline that helps us catch issues early and enables us to release changes with confidence. We will continuously improve and iterate on our CI/CD setup as the project evolves and new requirements emerge.
