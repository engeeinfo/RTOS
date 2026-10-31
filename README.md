# RTOS

Experiments and reference implementations for building a small real-time
operating system from scratch with a hardware-abstraction layer (HAL).

## Status

This repository currently contains the project description only. No source
modules, supported target board, toolchain configuration, or executable tests
have been published yet.

## Repository layout

```text
.
├── docs/
│   ├── ARCHITECTURE.md
│   ├── MODERNIZATION.md
│   └── adr/
├── LICENSE
├── Makefile
└── README.md
```

When implementation code is added, keep hardware-independent kernel logic
separate from HAL and board-specific adapters. Update
[`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) with the dependency direction
before adding a new subsystem.

## Development

The repository has no runtime dependencies or build toolchain at present.
The maintenance checks can be run with:

```sh
make build
make lint
make test
```

These commands validate the published project structure and documentation
until an actual target and implementation are added.

## Contributing

Keep changes focused, document hardware assumptions, and add a regression test
for every behavior change once executable code exists. See
[`docs/MODERNIZATION.md`](docs/MODERNIZATION.md) for the current baseline and
known gaps.
