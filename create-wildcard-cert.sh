#!/usr/bin/bash

if [[ $# -ne 2 ]]; then
    echo >&2 "usage: create-wildcard-cert.sh <domain> <root-ca>"
    exit 128
fi

DOMAIN="$1"
ROOTCA="$2"

KEYFILE=".private/$DOMAIN.key.pem"
CSRFILE="csr/$DOMAIN.csr.pem"
CACERTFILE="certs/$ROOTCA.cert.pem"
CAKEYFILE=".private/$ROOTCA.key.pem"

openssl req -config openssl.cnf -newkey rsa:2048 -keyout "$KEYFILE" -nodes -new -sha256 -out "$CSRFILE"

openssl ca -verbose -cert "$CACERTFILE" -keyfile "$CAKEYFILE" -extensions server_cert -days 365 -notext -md sha256 -in "$CSRFILE" -out "certs/$DOMAIN.cert.pem" -config <(cat openssl.cnf <<-EOF -
[ alt_names ]
DNS.1 = $DOMAIN
DNS.2 = *.$DOMAIN

EOF
)

