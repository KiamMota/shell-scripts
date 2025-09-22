#!/bin/bash

SWAP_DIR="$HOME/.swaps"
mkdir -p "$SWAP_DIR"

function parse_size() {
    local SIZE=$1
    # converte 20gb ou 20G para formato compatível com fallocate (ex: 20G)
    SIZE=$(echo "$SIZE" | tr '[:lower:]' '[:upper:]')
    echo "$SIZE"
}

function add_swap() {
    local NAME=$1
    local SIZE=$(parse_size "$2")
    local FILE="$SWAP_DIR/$NAME"

    echo "Starting swap '$NAME' with size $SIZE..."
    
    if command -v fallocate &>/dev/null; then
        sudo fallocate -l "$SIZE" "$FILE"
    else
        # fallback com dd
        local COUNT
        local UNIT=${SIZE: -1}
        local NUMBER=${SIZE%?}
        if [[ $UNIT == "G" ]]; then
            COUNT=$((NUMBER * 1024))
        elif [[ $UNIT == "M" ]]; then
            COUNT=$NUMBER
        else
            COUNT=$NUMBER
        fi
        sudo dd if=/dev/zero of="$FILE" bs=1M count="$COUNT" status=progress
    fi

    sudo chmod 600 "$FILE"
    sudo mkswap "$FILE"
    sudo swapon "$FILE"

    echo "Swap '$NAME' activated."
}

function list_swap() {
    echo "Active swaps:"
    swapon --show
    echo ""
    echo "Swaps managed by swamp:"
    ls -lh "$SWAP_DIR"
}

function rm_swap() {
    local NAME=$1
    local FILE="$SWAP_DIR/$NAME"

    if [ ! -f "$FILE" ]; then
        echo "Swap '$NAME' not found."
        return
    fi

    echo "Removing swap '$NAME'..."
    sudo swapoff "$FILE"
    sudo rm "$FILE"
    echo "Swap '$NAME' removed."
}

case $1 in
    add)
        add_swap "$2" "$3"
        ;;
    list)
        list_swap
        ;;
    rm)
        rm_swap "$2"
        ;;
    *)
        echo "Usage: swamp {add|list|rm} [name] [size]"
        ;;
esac
