BASE_DIR := .

.PHONY: fmt dry apply destroy deploy init
.DEFAULT_GOAL := dry

fmt:
	terragrunt hclfmt

init: fmt
	terragrunt run-all init

dry: init
	terragrunt run-all plan --terragrunt-parallelism 4

deploy: dry
	terragrunt run-all apply --terragrunt-non-interactive --terragrunt-parallelism 4

destroy:
	terragrunt run-all destroy --terragrunt-non-interactive --terragrunt-parallelism 4