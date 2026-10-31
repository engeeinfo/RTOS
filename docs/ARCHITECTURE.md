# Architecture

## Current state

The repository is currently a documentation-only scaffold. There are no
runtime modules or dependency edges to describe yet.

## Intended dependency direction

Future implementation should follow this one-way layering:

```text
application/examples
        ↓
kernel services and scheduling
        ↓
hardware abstraction layer (HAL)
        ↓
board and processor drivers
```

- **Application/examples** demonstrate the public API and should not access
  registers directly.
- **Kernel services** own scheduling, synchronization, timers, and lifecycle
  policy. They should depend on HAL interfaces, not a specific board.
- **HAL** provides narrow interfaces for interrupts, clocks, memory, and
  context switching.
- **Board and processor drivers** contain volatile, target-specific details.

Dependencies must point downward only. A driver must not import application
code, and kernel code must not hard-code a board implementation.

## Adding a subsystem

Before adding a new subsystem:

1. Define its ownership and public interface.
2. Identify the layer it belongs to.
3. Keep target-specific code behind a HAL boundary.
4. Add tests that can run without hardware where practical.
5. Record a decision in `docs/adr/` when the choice affects the public API,
   scheduling model, memory model, or supported targets.
