#!/bin/bash

MODEL_NAME="bielik"
GGUF_FILE="bielik-7b-instruct-v0.1.Q4_K_M.gguf"
GGUF_URL="https://huggingface.co/speakleash/Bielik-7B-Instruct-v0.1-GGUF/resolve/main/bielik-7b-instruct-v0.1.Q4_K_M.gguf?download=true"

echo "Starting Bielik LLM integration for Ollama..."

# deps check
if ! command -v ollama &> /dev/null; then
    echo "[ERROR] Ollama is not installed or not in PATH."
    exit 1
fi

if ! command -v curl &> /dev/null; then
    echo "[ERROR] curl is not installed."
    exit 1
fi

# download gguf
if [ -f "$GGUF_FILE" ]; then
    echo "[INFO] Model file $GGUF_FILE already exists. Skipping download."
else
    echo "[INFO] Downloading Bielik ..,"
    curl -L -o "$GGUF_FILE" "$GGUF_URL"
    
    if [ $? -ne 0 ]; then
        echo "[ERROR] Download failed."
        exit 1
    fi
    echo "[INFO] Download complete."
fi