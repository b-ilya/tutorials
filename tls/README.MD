# TLS setup commands
## generate-own-ca generate-server-cert generate-client-cert
#### source: https://docs.docker.com/engine/security/protect-access/
Generate self-signed CA key and certificate
```
openssl genrsa -aes256 -out ca-key.pem 4096
openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca-cert.pem
```
Generate key and server certificate request and sign it with CA
```
openssl genrsa -out server-key.pem 4096
openssl req -subj "/CN=$HOST" -sha256 -new -key server-key.pem -out server-request.csr
echo subjectAltName = IP:$HOST_IP,IP:127.0.0.1 >> extfile.cnf
echo extendedKeyUsage = serverAuth >> extfile.cnf
openssl x509 -req -days 365 -sha256 -in server-request.csr -CA $CA_CERT_PATH -CAkey $CA_CERT_KEY_PATH -CAcreateserial -out server-cert.pem -extfile extfile.cnf
```
Generate key and client certificate request and sign it
```
openssl genrsa -out client-key.pem 4096
openssl req -subj '/CN=client' -new -key client-key.pem -out client-request.csr
echo extendedKeyUsage = clientAuth > extfile.cnf
openssl x509 -req -days 365 -sha256 -in client-request.csr -CA $CA_CERT_PATH -CAkey $CA_CERT_KEY_PATH -CAcreateserial -out client-cert.pem -extfile extfile.cnf
```
