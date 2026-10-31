.PHONY: build lint test

build:
	@test -f README.md
	@test -f docs/ARCHITECTURE.md
	@echo "No runtime source or target is published; structure check passed."

lint:
	@git diff --check
	@echo "Whitespace check passed."

test:
	@grep -q '^# Modernization record$$' docs/MODERNIZATION.md
	@grep -q '^# Architecture$$' docs/ARCHITECTURE.md
	@echo "Documentation contract checks passed."
