# Local setup guide

This guide will walk you through setting up your local development environment. This guide assumes that you have a basic understanding of how to use the command line and a basic understanding of git.

## Prerequisites

* [Docker](https://docs.docker.com/install/)
* [Docker Compose](https://docs.docker.com/compose/install/)
* [dev container](https://containers.dev/)
* [Git](https://git-scm.com/downloads)

## Setup

There are two ways to set up your local development environment. Both supported methods are based on [dev container](https://containers.dev/).

### Emacs + SSH

Using emacs + SSH is a command-line-driven method for setting up your local development environment. This method is great for those who are comfortable with the command line and want to use emacs as their editor.

#### dev container + docker settings

1. Have the `sshd` [feature enabled](https://github.com/infratographer/dmv/blob/b2909882baf1c9042e8a8a802b58724172ed0c23/.devcontainer/devcontainer.json#L15) in the dev container.
1. Port forward the `sshd` port to your local machine in the [docker-compose.yml](https://github.com/infratographer/dmv/blob/main/.devcontainer/docker-compose.yml#L10-L11)
1. Mount your authorized keys into the dev container in the [docker-compose.yml](https://github.com/infratographer/dmv/blob/main/.devcontainer/docker-compose.yml#L16-L19)
1. Ensure `~/.ssh` is owned by the `vscode` user in the [Dockerfile](https://github.com/infratographer/dmv/blob/main/.devcontainer/Dockerfile#L5-L7).

#### Manually setting up SSH agent forwarding

The provided dev container listens for SSH connections on port 2222 and bind mounts `~/.ssh/authorized_keys` from the host to facilitate SSH. In order to perform Git operations (i.e., committing code in the container), you will need to enable SSH agent forwarding from your machine to the dev container. While VS Code handles this automatically, for other editors you will need to set this up manually.

To do so, update your `~/.ssh/config` to support agent forwarding. The following config snippet should accomplish this for you:

```
Host dmv-devcontainer
  ProxyJump YOUR_HOST_HERE
  Port 2222
  User vscode
  ForwardAgent yes
Host YOUR_HOST_HERE
  User YOUR_USER_HERE
  ForwardAgent yes
```

### VS Code + Remote Containers

1. Install [VS Code](https://code.visualstudio.com/)
1. Install the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
1. Open the project in VS Code
1. Click the green button in the lower-left corner of the window that says "Reopen in Container"
1. Wait for the container to build and start


