# Utiliser une image de base Ubuntu
FROM mcr.microsoft.com/devcontainers/base:jammy

# Définir une variable HOME personnalisée
ENV HOME /home/vscode

# Mettre à jour le système et installer les outils de base
RUN apt-get update && apt-get install -y httpie

# Personnaliser le prompt avec nos dotfiles sur GitHub
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k && \
    wget -O $HOME/.p10k.zsh https://raw.githubusercontent.com/tiamat-azure/dotfiles/main/.p10k.zsh && \
    wget -O $HOME/.zshrc https://raw.githubusercontent.com/tiamat-azure/dotfiles/main/.zshrc

# Installer k3s avec etcd
# RUN curl -sfL https://get.k3s.io | K3S_TOKEN=SECRET sh -s - server --cluster-init
# k3d cluster create mycluster
# NON sudo apt update && sudo apt install snapd
# NON installer homebrew : /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# NON brew install kubectl

# Installer kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl  && \
    sudo mv ./kubectl /usr/local/bin/kubectl
    

#RUN wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash  

#RUN k3d cluster create

# Vous devrez obtenir les fichiers d'installation ou URL pour ces outils depuis leurs sources officielles
# Par exemple, vous pouvez utiliser curl ou wget pour télécharger les fichiers d'installation.
# RUN curl -LO <URL_K3S> && sh <INSTALL_SCRIPT_K3S>
# RUN curl -LO <URL_HELM> && tar -zxvf <HELM_ARCHIVE> && mv linux-amd64/helm /usr/local/bin/helm
# RUN curl -LO <URL_KUSTOMIZE> && tar -zxvf <KUSTOMIZE_ARCHIVE> && mv kustomize /usr/local/bin/kustomize

# Exécuter un shell Zsh au démarrage
ENTRYPOINT ["/bin/zsh"]
