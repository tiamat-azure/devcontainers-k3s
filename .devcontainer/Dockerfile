# Utiliser une image de base Ubuntu
FROM mcr.microsoft.com/devcontainers/base:jammy

# Définir les métadonnées de l'image
LABEL org.opencontainers.image.source https://github.com/tiamat-azure/devcontainers-k3s

# Définir des variables d'environnement
ENV HOME=/home/vscode
ENV BIN=/usr/local/bin
ENV GHRAW=https://raw.githubusercontent.com

# Mettre à jour le système et installer les outils de base
RUN apt-get update && \
    apt-get install -y httpie dnsutils figlet && \
    apt-get clean

# Personnaliser le prompt avec nos dotfiles sur GitHub
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k && \
    wget -O $HOME/.p10k.zsh $GHRAW/tiamat-azure/dotfiles/main/.p10k.zsh && \
    wget -O $HOME/.zshrc $GHRAW/tiamat-azure/dotfiles/main/.zshrc

# Installer kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl  && \
    sudo mv ./kubectl $BIN/kubectl

# Installer Helm
RUN curl -fsSL $GHRAW/helm/helm/main/scripts/get-helm-3 | bash

# Installer Kustomize
RUN curl -s $GHRAW/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh | bash && \
    sudo mv ./kustomize $BIN/kustomize

# Exécuter un shell Zsh au démarrage
ENTRYPOINT ["/bin/zsh"]
