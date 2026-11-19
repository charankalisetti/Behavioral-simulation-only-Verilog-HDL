# Behavioral (simulation-only) Verilog HDL

A collection of standalone behavioral Verilog examples for mathematical sequences and algorithms.

> **Simulation only:** These examples use procedural initial blocks, integer variables, loops, and the $display / $write system tasks. They are intended for functional simulation and algorithm practice, not synthesis as RTL hardware.

## Repository layout

- sequences/ — progression and recurrence examples. Add new sequence files here using descriptive lowercase snake_case names.
- sequences/polygon_numbers/ — polygon-number Verilog modules and their SVG diagrams.
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
| sequences/juggler_sequence.v | Juggler sequence |
| sequences/lucas.v | Lucas sequence |
| sequences/padovan.v | Padovan sequence |
| sequences/tribonacci.v | Tribonacci sequence |

### Polygon numbers

| File | Sequence / algorithm |
|---|---|
| sequences/polygon_numbers/polygon_numbers.v | Prints triangular, square, pentagonal, hexagonal, and heptagonal numbers |
| sequences/polygon_numbers/triangular.v | Standalone triangular-number example |
| sequences/polygon_numbers/heptagonal_numbers.v | Standalone heptagonal-number example |

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

## Polygon-number images

The SVGs contain dot counts matching the fifth term of each sequence: 15 triangular, 25 square, 35 pentagonal, 45 hexagonal, and 55 heptagonal dots.

| Image | Sequence |
|---|---|
| sequences/polygon_numbers/images/triangular_numbers.svg | Triangular |
| sequences/polygon_numbers/images/square_numbers.svg | Square |
| sequences/polygon_numbers/images/pentagonal_numbers.svg | Pentagonal |
| sequences/polygon_numbers/images/hexagonal_numbers.svg | Hexagonal |
| sequences/polygon_numbers/images/heptagonal_numbers.svg | Heptagonal |

## Sequence diagrams

| Image | Sequence |
|---|---|
| sequences/fibonacci_sequence.svg | Fibonacci sequence and variable shift |
| sequences/tribonacci_sequence.svg | Tribonacci sequence and variable shift |
## Run a simulation

From the repository root, compile and run the combined polygon-number example with Icarus Verilog:

    iverilog -o polygon_numbers.vvp sequences/polygon_numbers/polygon_numbers.v
    vvp polygon_numbers.vvp

The same source files can be opened in EDA Playground, QuestaSim, ModelSim, or Vivado Simulator.

## Topics

verilog, verilog-hdl, behavioral-verilog, simulation, vlsi, digital-design, number-theory, algorithms, hdl