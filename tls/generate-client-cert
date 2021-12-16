#!/bin/bash
openssl genrsa -out client-key.pem 4096
openssl req -subj '/CN=client' -new -key client-key.pem -out client-request.csr
echo extendedKeyUsage = clientAuth > extfile.cnf
openssl x509 -req -days 365 -sha256 -in client-request.csr -CA $CA_CERT_PATH -CAkey $CA_CERT_KEY_PATH -CAcreateserial -out client-cert.pem -extfile extfile.cnf
