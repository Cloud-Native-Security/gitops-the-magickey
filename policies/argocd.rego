# METADATA
# title: "Applications not allowed"
# description: "Only applications are allowed to be defined"
# scope: package
# schemas:
# - input: schema["argocd"]
# related_resources:
# - https://google.ca
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
	input.kind != "Test"
	msg = sprintf("Found ArgoCD Application '%s' but the kind is not named correctly", [input.metadata.name])
}