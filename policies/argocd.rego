# METADATA
# title: "Applications only allowed"
# description: "Only applications are allowed to run"
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
#   recommended_action: "Identify application resource"
#   input:
#     selector:
#     - type: kubernetes

package user.argocd.ID001 

import input

allow[msg] {
	input.kind == "Application"
	msg = sprintf("Found Application '%s' resource", [input.metadata.name])
}