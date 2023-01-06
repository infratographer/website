# VS Code + Remote Containers

Using VS Code + Remote Containers is a GUI-driven method for setting up your local development environment. This method is considered the easiest way to get started with local development. This method is great for those who are new to the command line and want to use VS Code as their editor.

## Installation

1. Install [VS Code](https://code.visualstudio.com/)
1. Install the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
1. Open the project in VS Code
1. Click the button in the lower-left corner of the window that says "Reopen in Container"
1. Wait for the container to build and start

## Additional setup

### dotfiles

Many developers rely on aliases and other shell configurations to make their lives easier. If you want to use these aliases in your dev container, you can reference the VS Code documentation about [Personalizing with dotfiles](https://code.visualstudio.com/docs/devcontainers/containers#_personalizing-with-dotfile-repositories)

### VS Code extensions

If you want to use VS Code extensions in your dev container, you can reference the VS Code documentation about [Using extensions with a dev container](https://code.visualstudio.com/docs/devcontainers/containers#_managing-extensions). Not every extension is related to the project, and some would be considered personal preferences, these should be installed this way.

