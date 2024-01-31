# METADATA
# title: "Applications not allowed"
# description: "Only applications are allowed to be defined"
# scope: package
# schemas:
# - input: schema["argocd"]
# related_resources:
# - https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/
# custom:
#   id: ID001 
#   avd_id: AVD-ARGO-0001
#   severity: HIGH 
#   short_code: application-only-allowed 
#   recommended_action: "Only applications are allowed"
#   input:
#     selector:
#     - type: kubernetes

package user.argocd.ID001 

import input

deny[msg] {
	input.kind != "Application"
	msg = sprintf("Found ArgoCD Application '%s' but the kind is not named correctly", [input.metadata.name])
}

deny[msg] {
	input.metadata.name != "website"
	msg = sprintf("Found ArgoCD Application '%s' but the name is not correct", [input.metadata.name])
}