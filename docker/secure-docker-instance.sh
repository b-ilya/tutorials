#!/bin/bash
sudo dockerd --tlsverify --tlscacert ca.pem --tlscert server-cert.pem --tlskey server-key.pem -H 0.0.0.0
