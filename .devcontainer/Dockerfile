# Utiliser une image de base Ubuntu
#FROM ubuntu:latest
FROM mcr.microsoft.com/devcontainers/base:jammy

# Mettre à jour le système et installer les outils de base
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y httpie

# Installer k3s, helm et kustomize
# Vous devrez obtenir les fichiers d'installation ou URL pour ces outils depuis leurs sources officielles
# Par exemple, vous pouvez utiliser curl ou wget pour télécharger les fichiers d'installation.
# RUN curl -LO <URL_K3S> && sh <INSTALL_SCRIPT_K3S>
# RUN curl -LO <URL_HELM> && tar -zxvf <HELM_ARCHIVE> && mv linux-amd64/helm /usr/local/bin/helm
# RUN curl -LO <URL_KUSTOMIZE> && tar -zxvf <KUSTOMIZE_ARCHIVE> && mv kustomize /usr/local/bin/kustomize

# Copier le fichier .zshrc personnalisé dans le répertoire utilisateur
COPY .zshrc /home/vscode/.zshrc

# Exécuter un shell Bash au démarrage
ENTRYPOINT ["/bin/zsh"]
