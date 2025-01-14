# Codigo para eliminar el espaciado extra del principio que pone starship
precmd() {
    if [[ $LAST_COMMAND != "clear" ]]; then
        echo ""
    fi
}

preexec() {
    LAST_COMMAND=$1
}

eval "$(starship init zsh)"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

