#!/usr/bin/bash

if [[ $# -ne 1 ]]; then
    echo >&2 "usage: create-root-ca.sh <name>"
    exit 128
fi

NAME="$1"
KEYFILE=".private/$NAME.key.pem"

openssl genrsa -aes256 -out "$KEYFILE" 4096
openssl req -config openssl.cnf -key "$KEYFILE" -new -x509 -days 1000 -sha256 -extensions v3_ca -out "certs/$NAME.cert.pem"



