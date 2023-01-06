# SSH + Dev Containers

Using SSH is a command-line-driven method for setting up your local development environment. This method is great for those who are comfortable with the command line and want to use emacs, for example,  as their editor. This method is a little more advanced and might require some additional setup.

#### dev container + docker settings

1. Ensure the `sshd` [feature is enabled](https://github.com/infratographer/dmv/blob/b2909882baf1c9042e8a8a802b58724172ed0c23/.devcontainer/devcontainer.json#L15) in the dev container.
1. Port forward the `sshd` port to your local machine in the [docker-compose.yml](https://github.com/infratographer/dmv/blob/main/.devcontainer/docker-compose.yml#L10-L11)
1. Mount your authorized keys into the dev container in the [docker-compose.yml](https://github.com/infratographer/dmv/blob/main/.devcontainer/docker-compose.yml#L16-L19)
1. Ensure `~/.ssh` is owned by the `vscode` user in the [Dockerfile](https://github.com/infratographer/dmv/blob/main/.devcontainer/Dockerfile#L5-L7).

#### Manually setting up SSH agent forwarding

The provided dev container listens for SSH connections on port 2222 and bind mounts `~/.ssh/authorized_keys` from the host to facilitate SSH. In order to perform Git operations (i.e., committing code in the container), you will need to enable SSH agent forwarding from your machine to the dev container. While VS Code handles this automatically, for other editors you will need to set this up manually.

To do so, update your `~/.ssh/config` to support agent forwarding. The following config snippet should accomplish this for you:

```
Host losthost
  HostName localhost
  Port 2222
  User vscode
  ForwardAgent yes
```

Now to connect to the dev container, you can use the following command:

```
ssh localhost
```

### Additional setup

The goal of this project is to use `dev containers` as the primary environment for local development. There are several examples using `vim` and several of its variants, along with `emacs`. This is considered the advanced approach to local development, and your mileage may vary. It's expected that you would need to modify these examples to suit your needs.
