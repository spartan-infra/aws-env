BASE_DIR := .

.PHONY: fmt dry apply destroy deploy init
.DEFAULT_GOAL := dry

fmt:
	terragrunt hclfmt

init: fmt
	terragrunt init
	terragrunt get

dry: init
	terragrunt plan

deploy: dry
	terragrunt refresh
	terragrunt apply -auto-approve

destroy:
	terragrunt refresh
	terragrunt destroy -auto-approve