# Solucion para el espaciado extra de starship y el bug al abrir terminal
FIRST_PROMPT=1

precmd() {
    if [[ $FIRST_PROMPT -eq 1 ]]; then
        FIRST_PROMPT=0
    elif [[ $LAST_COMMAND != "clear" ]]; then
        echo ""
    fi
}

preexec() {
    LAST_COMMAND=$1
}

eval "$(starship init zsh)"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

