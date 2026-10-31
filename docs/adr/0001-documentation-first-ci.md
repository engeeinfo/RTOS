# ADR 0001: Keep CI useful before implementation exists

- **Status:** Accepted
- **Date:** 2026-10-31

## Context

RTOS currently contains only a README. A conventional firmware build, linter,
and hardware test suite cannot run without source code, a target, or a
toolchain. Leaving CI absent would allow the repository structure and
documentation to regress silently.

## Decision

Add a small, dependency-free `Makefile` and GitHub Actions workflow. The
workflow runs `make build`, `make lint`, and `make test`; these targets verify
the documented repository contract and whitespace integrity. Replace these
checks with real compilation, static analysis, and tests when implementation
code is added.

## Consequences

The repository gets immediate, reproducible maintenance checks without
pretending that firmware is already buildable. The checks intentionally do not
validate hardware behavior; that requires a published target and toolchain.
