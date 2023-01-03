FROM mcr.microsoft.com/devcontainers/base:bullseye

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends python3 python3-pip bash-completion


# [Optional] Uncomment this line to install global pip packages.
RUN pip3 install --no-cache-dir \
    mkdocs-awesome-pages-plugin \
    mkdocs-git-authors-plugin \
    mkdocs-git-committers-plugin-2 \
    mkdocs-git-revision-date-localized-plugin \
    mkdocs-git-revision-date-plugin \
    mkdocs-include-markdown-plugin \
    mkdocs-localsearch \
    mkdocs-material \
    mkdocs-material-extensions \
    mkdocs-mermaid2-plugin \
    mkdocs-minify-plugin \
    mkdocs-redirects \
    mkdocs-tooltips \
    pymdown-extensions \
    Pygments

USER vscode
RUN git config --global --add safe.directory /workspace

WORKDIR /workspace