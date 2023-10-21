#!/bin/bash

# Fonction pour afficher la version d'une commande
show_version() {
    command="$1"
    version_flag="$2"
    version_output="$($command $version_flag 2>&1)"
    if [ $? -eq 0 ]; then
        echo "Version de $command :"
        echo "$version_output"
    else
        echo "Impossible de récupérer la version de $command."
    fi
}

# Afficher un message de bienvenue avec figlet
figlet "Dev Container - Bienvenue"

# Afficher la version de l'image de base
uname -a

# Afficher les versions des commandes
show_version "http" "--version"
show_version "kubectl" "version --client=true"
show_version "helm" "version --short"
show_version "kustomize" "version --short"
show_version "k3d" "version"


