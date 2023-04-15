# METADATA
# title: "Applications not allowed"
# description: "No applications are allowed to run for some reason"
# scope: package
# schemas:
# - input: schema["argocd"]
# related_resources:
# - https://google.ca
# custom:
#   id: ID001 
#   avd_id: AVD-ARGO-0001
#   severity: HIGH 
#   short_code: application-not-allowed 
#   recommended_action: "Get rid of all applications"
#   input:
#     selector:
#     - type: kubernetes

package user.argocd.ID001 

import input

deny[msg] {
	input.kind == "Application"
	msg = sprintf("Found Application '%s' but Applications are not allowed", [input.metadata.name])
}