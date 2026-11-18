# Behavioral (simulation-only) Verilog HDL

A collection of standalone behavioral Verilog examples for mathematical sequences and algorithms.

> **Simulation only:** These examples use procedural initial blocks, integer variables, loops, and the $display / $write system tasks. They are intended for functional simulation and algorithm practice, not synthesis as RTL hardware.

## Repository layout

- sequences/ — progression, recurrence, and polygonal-number examples. Add new sequence files here using descriptive lowercase snake_case names.
- number_checks/ — perfect-square and perfect-cube checks.
- factorials/ — factorial and superfactorial examples.

## Programs

### Sequences

| File | Sequence / algorithm |
|---|---|
| sequences/arithmetic_progression.v | Arithmetic progression |
| sequences/bell_triangle.v | Bell numbers generated with the Bell Triangle |
| sequences/collatz_sequence.v | Collatz sequence |
| sequences/fibonacci.v | Fibonacci sequence |
| sequences/geometric_series.v | Geometric series |
| sequences/heptagonal_numbers.v | Heptagonal numbers |
| sequences/juggler_sequence.v | Juggler sequence |
| sequences/lucas.v | Lucas sequence |
| sequences/padovan.v | Padovan sequence |
| sequences/polygonal_numbers.v | Triangular, square, pentagonal, hexagonal, and heptagonal numbers |
| sequences/triangular.v | Triangular numbers |
| sequences/tribonacci.v | Tribonacci sequence |

### Number checks

| File | Check |
|---|---|
| number_checks/check_cube.v | Whether an integer is a perfect cube |
| number_checks/check_square.v | Whether an integer is a perfect square |

### Factorials

| File | Algorithm |
|---|---|
| factorials/factorial.v | Factorial |
| factorials/superfactorial.v | Superfactorial |

## Run a simulation

From the repository root, compile and run the polygonal-number example with Icarus Verilog:

    iverilog -o polygonal_numbers.vvp sequences/polygonal_numbers.v
    vvp polygonal_numbers.vvp

The same source files can be opened in EDA Playground, QuestaSim, ModelSim, or Vivado Simulator.

## Topics

verilog, verilog-hdl, behavioral-verilog, simulation, vlsi, digital-design, number-theory, algorithms, hdl
