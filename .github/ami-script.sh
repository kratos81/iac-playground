#! /bin/bash
export TF_VAR_ami_id=$(jq -r '.builds[-1].artifact_id' manifest.json | cut -d ":" -f2)
cd infra
