.PHONY: test validate plan-test examples-test

test: validate plan-test examples-test

validate:
	terraform fmt -check -recursive
	terraform init -backend=false
	terraform validate

plan-test:
	@EXIT_CODE=0; \
	for dir in examples/*/; do \
		echo "==> Plan testing $$dir"; \
		(cd "$$dir" && terraform init -backend=false && terraform validate && terraform plan) || EXIT_CODE=$$?; \
	done; \
	exit $$EXIT_CODE

examples-test:
	@EXIT_CODE=0; \
	for dir in examples/*/; do \
		echo "==> Apply/Destroy testing $$dir"; \
		( \
			cd "$$dir" || exit 1; \
			terraform init || exit 1; \
			terraform apply -auto-approve; \
			APPLY_EXIT=$$?; \
			DESTROY_EXIT=1; \
			for i in 1 2 3; do \
				echo "==> Destroy attempt $$i for $$dir"; \
				if terraform destroy -auto-approve; then \
					DESTROY_EXIT=0; \
					break; \
				fi; \
				echo "==> Destroy failed (attempt $$i), waiting 60s before retry..."; \
				sleep 60; \
			done; \
			if [ $$APPLY_EXIT -ne 0 ] || [ $$DESTROY_EXIT -ne 0 ]; then exit 1; fi \
		) || EXIT_CODE=$$?; \
	done; \
	exit $$EXIT_CODE
