# Half Adder

## What is a Half Adder?

A Half Adder is a combinational circuit used to add two 1-bit binary numbers.

It has:
- 2 inputs: A and B
- 2 outputs: Sum and Carry

## Truth Table

| A | B | Sum | Carry |
|---|---|-----|-------|
| 0 | 0 |  0  |   0   |
| 0 | 1 |  1  |   0   |
| 1 | 0 |  1  |   0   |
| 1 | 1 |  0  |   1   |

## Boolean Expressions

Sum = A XOR B

Carry = A AND B

## Verilog Implementation

The circuit is implemented using continuous assignments:

- `Sum = A ^ B`
- `Carry = A & B`

## Testbench

The testbench checks all four possible combinations of inputs:

00, 01, 10, 11

The simulation output matches the expected truth table.

## Simulation

Behavioral simulation was performed in Vivado 2024.1.