# self-signed-ssl
A collection of scripts to generate self-signed root and normal certificates.

## Step 0: Run the init script (once only)

```bash
bash init.sh
```

## Create a Root Certificate

```bash
bash create-root-ca.sh example-root-ca
```

## Create a wildcard self-signed certificate from the Root CA

Generate a valid Self-Signed certificate for `top-level-domain.com` and `*.top-level-domain.com`

```bash
bash create-wildcard-cert.sh top-level-domain.com example-root-ca
```

