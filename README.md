# Behavioral Verilog: Number Sequences & Math Algorithms

A collection of 20 classic mathematical sequences and number-theoretic algorithms planned as standalone behavioral Verilog HDL simulations.

> **Simulation only:** These examples use procedural initial blocks, integer variables, loops, and the $display system task. They are intended for functional simulation and algorithm practice, not synthesis as RTL hardware.

The supplied project outline lists the programs below. Their .v source files were not included in the supplied material and can be added individually.

## Programs

| # | File name | Sequence / algorithm | Description |
|---:|---|---|---|
| 01 | 01_palindrome.v | Palindrome number | Reverses digits with modulo and integer division to check symmetry. |
| 02 | 02_fibonacci.v | Fibonacci series | Each term is the sum of the two preceding terms. |
| 03 | 03_tribonacci.v | Tribonacci series | Each term is the sum of the three preceding terms. |
| 04 | 04_factorial.v | Factorial | Computes n! iteratively. |
| 05 | 05_triangular_number.v | Triangular numbers | Computes T_n = n(n + 1) / 2. |
| 06 | 06_lucas_number.v | Lucas numbers | Fibonacci-style recurrence initialized with 2 and 1. |
| 07 | 07_padovan_sequence.v | Padovan sequence | Computes P_n = P_(n-2) + P_(n-3), starting with 1, 1, 1. |
| 08 | 08_cube_number.v | Cube numbers | Generates perfect cubes, n^3. |
| 09 | 09_square_numbers.v | Square numbers | Generates perfect squares, n^2. |
| 10 | 10_collatz_sequence.v | Collatz sequence | Applies n / 2 for even terms or 3n + 1 for odd terms until reaching 1. |
| 11 | 11_juggler_sequence.v | Juggler sequence | Uses floor(sqrt(n)) for even terms and floor(sqrt(n^3)) for odd terms. |
| 12 | 12_recaman_sequence.v | Recamán's sequence | Subtracts the step index when the result stays positive and is unvisited; otherwise adds it. |
| 13 | 13_look_and_say_sequence.v | Look-and-say sequence | Builds each term by counting consecutive digits in the previous term. |
| 14 | 14_ulam_sequence.v | Ulam sequence | Finds values expressible as the sum of two distinct earlier terms in exactly one way. |
| 15 | 15_happy_numbers.v | Happy numbers | Repeatedly sums squared digits until reaching 1 or the unhappy 4-cycle. |
| 16 | 16_heptagonal_numbers.v | Heptagonal numbers | Computes H_n = n(5n - 3) / 2. |
| 17 | 17_bell_numbers.v | Bell numbers | Counts set partitions using a Bell triangle. |
| 18 | 18_superfactorial.v | Superfactorial | Computes the product of the first n factorials. |
| 19 | 19_arithmetic_progression.v | Arithmetic progression | Generates terms with a constant common difference. |
| 20 | 20_geometric_progression.v | Geometric progression | Generates terms with a constant common ratio. |

## Run a simulation

With Icarus Verilog installed, compile and run an individual source file:

    iverilog -o sim.vvp 01_palindrome.v
    vvp sim.vvp

Each source file should provide a top-level module and print its results with $display. You can also run the files in EDA Playground, QuestaSim, ModelSim, or Vivado Simulator.

## Topics

verilog, verilog-hdl, behavioral-verilog, simulation, vlsi, digital-design, number-theory, algorithms, hdl