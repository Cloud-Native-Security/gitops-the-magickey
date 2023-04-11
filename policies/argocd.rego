package main

import input

# METADATA
# schemas:
# - input: schema["argocd"]
# custom:
#   severity: HIGH
allow {
    input.kind = "Application" 
    input.metadata.namespace = "argocd"
    input.spec.destination.server = "https://kubernetes.default.svc"
}