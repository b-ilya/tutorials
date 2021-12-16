#!/bin/bash
openssl genrsa -out server-key.pem 4096
openssl req -subj "/CN=$HOST" -sha256 -new -key server-key.pem -out server-request.csr
echo subjectAltName = IP:$HOST_IP,IP:127.0.0.1 >> extfile.cnf
echo extendedKeyUsage = serverAuth >> extfile.cnf
openssl x509 -req -days 365 -sha256 -in server-request.csr -CA $CA_CERT_PATH -CAkey $CA_CERT_KEY_PATH -CAcreateserial -out server-cert.pem -extfile extfile.cnf
