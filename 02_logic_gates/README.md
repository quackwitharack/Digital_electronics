# Logic Gates

This section contains the basic digital logic gates implemented in Verilog and verified using simulation in **Vivado 2024.1**.

The gates covered are:

1. AND
2. OR
3. NOT
4. NAND
5. NOR
6. XOR
7. XNOR

Each gate includes:

* Boolean expression
* Truth table
* Verilog implementation
* Testbench
* Behavioral simulation

---

# 1. AND Gate

## What is an AND Gate?

An AND gate produces an output of `1` only when **all of its inputs are `1`**.

For a 2-input AND gate:

* Inputs: `A`, `B`
* Output: `Y`

### Boolean Expression

```text
Y = A · B
```

### Verilog Operator

```verilog
&
```

### Truth Table

| A | B | Y |
| - | - | - |
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

### Verilog Implementation

```verilog
module and_gate(
    input A,
    input B,
    output Y
);

assign Y = A & B;

endmodule
```

### Key Idea

The output is HIGH only when **both A and B are HIGH**.

---

# 2. OR Gate

## What is an OR Gate?

An OR gate produces an output of `1` when **at least one of its inputs is `1`**.

For a 2-input OR gate:

* Inputs: `A`, `B`
* Output: `Y`

### Boolean Expression

```text
Y = A + B
```

Here, `+` represents the **Boolean OR operation**, not ordinary arithmetic addition.

### Verilog Operator

```verilog
|
```

### Truth Table

| A | B | Y |
| - | - | - |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

### Verilog Implementation

```verilog
module or_gate(
    input A,
    input B,
    output Y
);

assign Y = A | B;

endmodule
```

### Key Idea

The output is LOW only when **both A and B are LOW**.

---

# 3. NOT Gate

## What is a NOT Gate?

A NOT gate has only **one input** and produces the **opposite** of the input.

It is also called an **inverter**.

* Input: `A`
* Output: `Y`

### Boolean Expression

```text
Y = A'
```

or

```text
Y = NOT A
```

### Verilog Operator

```verilog
~
```

### Truth Table

| A | Y |
| - | - |
| 0 | 1 |
| 1 | 0 |

### Verilog Implementation

```verilog
module not_gate(
    input A,
    output Y
);

assign Y = ~A;

endmodule
```

### Key Idea

A NOT gate simply **inverts** the input.

```text
0 → 1
1 → 0
```

---

# 4. NAND Gate

## What is a NAND Gate?

A NAND gate is an **AND gate followed by a NOT operation**.

The name comes from:

```text
NOT + AND = NAND
```

It produces `0` only when **both inputs are `1`**.

### Boolean Expression

```text
Y = (A · B)'
```

### Verilog Operator

```verilog
~(A & B)
```

### Truth Table

| A | B | A · B | Y = (A · B)' |
| - | - | ----- | ------------ |
| 0 | 0 | 0     | 1            |
| 0 | 1 | 0     | 1            |
| 1 | 0 | 0     | 1            |
| 1 | 1 | 1     | 0            |

### Verilog Implementation

```verilog
module nand_gate(
    input A,
    input B,
    output Y
);

assign Y = ~(A & B);

endmodule
```

### Key Idea

NAND is simply:

```text
AND → NOT
```

The output is LOW only for:

```text
A = 1, B = 1
```

### Important

NAND is known as a **universal gate** because NAND gates alone can be used to construct other basic logic gates and complete digital circuits.

---

# 5. NOR Gate

## What is a NOR Gate?

A NOR gate is an **OR gate followed by a NOT operation**.

The name comes from:

```text
NOT + OR = NOR
```

It produces `1` only when **both inputs are `0`**.

### Boolean Expression

```text
Y = (A + B)'
```

### Verilog Operator

```verilog
~(A | B)
```

### Truth Table

| A | B | A + B | Y = (A + B)' |
| - | - | ----- | ------------ |
| 0 | 0 | 0     | 1            |
| 0 | 1 | 1     | 0            |
| 1 | 0 | 1     | 0            |
| 1 | 1 | 1     | 0            |

### Verilog Implementation

```verilog
module nor_gate(
    input A,
    input B,
    output Y
);

assign Y = ~(A | B);

endmodule
```

### Key Idea

NOR is:

```text
OR → NOT
```

The output is HIGH only when:

```text
A = 0, B = 0
```

### Important

Like NAND, NOR is also a **universal gate**.

---

# 6. XOR Gate

## What is an XOR Gate?

XOR stands for **Exclusive OR**.

An XOR gate produces `1` when its inputs are **different**.

For two inputs:

```text
A ≠ B → Y = 1
A = B → Y = 0
```

### Boolean Expression

```text
Y = A ⊕ B
```

XOR can also be expressed using AND, OR, and NOT:

```text
Y = A'B + AB'
```

### Verilog Operator

```verilog
^
```

### Truth Table

| A | B | Y |
| - | - | - |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

### Verilog Implementation

```verilog
module xor_gate(
    input A,
    input B,
    output Y
);

assign Y = A ^ B;

endmodule
```

### Key Idea

**XOR = 1 when inputs are different.**

This is particularly important in digital design because XOR is used in circuits such as:

* Half Adders
* Full Adders
* Parity circuits
* Comparators
* Error detection circuits

For example, the Half Adder uses:

```text
Sum = A XOR B
```

---

# 7. XNOR Gate

## What is an XNOR Gate?

XNOR stands for **Exclusive NOR**.

It is the complement of XOR.

An XNOR gate produces `1` when its inputs are **the same**.

```text
A = B → Y = 1
A ≠ B → Y = 0
```

### Boolean Expression

```text
Y = (A ⊕ B)'
```

It can also be written as:

```text
Y = AB + A'B'
```

### Verilog Operator

There is no separate basic XNOR operator that we need to use here, so we can write:

```verilog
~(A ^ B)
```

### Truth Table

| A | B | XOR | XNOR |
| - | - | --- | ---- |
| 0 | 0 | 0   | 1    |
| 0 | 1 | 1   | 0    |
| 1 | 0 | 1   | 0    |
| 1 | 1 | 0   | 1    |

### Verilog Implementation

```verilog
module xnor_gate(
    input A,
    input B,
    output Y
);

assign Y = ~(A ^ B);

endmodule
```

### Key Idea

**XNOR = 1 when inputs are the same.**

It is commonly associated with **equality checking**.

---

# Gate Comparison

| Gate | Boolean Expression | Verilog     | Output = 1 when...      |
| ---- | ------------------ | ----------- | ----------------------- |
| AND  | `A · B`            | `A & B`     | Both inputs are 1       |
| OR   | `A + B`            | `A \| B`    | At least one input is 1 |
| NOT  | `A'`               | `~A`        | Input is 0              |
| NAND | `(A · B)'`         | `~(A & B)`  | At least one input is 0 |
| NOR  | `(A + B)'`         | `~(A \| B)` | Both inputs are 0       |
| XOR  | `A ⊕ B`            | `A ^ B`     | Inputs are different    |
| XNOR | `(A ⊕ B)'`         | `~(A ^ B)`  | Inputs are the same     |

---

# Complete Truth Table Comparison

| A | B | AND | OR | NAND | NOR | XOR | XNOR |
| - | - | --- | -- | ---- | --- | --- | ---- |
| 0 | 0 | 0   | 0  | 1    | 1   | 0   | 1    |
| 0 | 1 | 0   | 1  | 1    | 0   | 1   | 0    |
| 1 | 0 | 0   | 1  | 1    | 0   | 1   | 0    |
| 1 | 1 | 1   | 1  | 0    | 0   | 0   | 1    |

For the NOT gate:

| A | NOT |
| - | --- |
| 0 | 1   |
| 1 | 0   |

---

# Important Relationships

Understanding the relationships between gates is more useful than simply memorizing them.

### NAND

```text
NAND = NOT(AND)
```

```text
Y = ~(A & B)
```

### NOR

```text
NOR = NOT(OR)
```

```text
Y = ~(A | B)
```

### XNOR

```text
XNOR = NOT(XOR)
```

```text
Y = ~(A ^ B)
```

---

# Universal Gates

Two gates are particularly important:

## NAND

NAND is a **universal gate**.

Using only NAND gates, we can construct:

* NOT
* AND
* OR
* NAND
* NOR
* XOR
* XNOR
* Larger digital circuits

## NOR

NOR is also a **universal gate**.

Using only NOR gates, we can construct the other basic logic functions as well.

This becomes particularly important when studying **NAND-only and NOR-only implementations**.

---

# Verilog Operators Used

The basic operators used in these implementations are:

| Operator | Operation   | Example  |
| -------- | ----------- | -------- |
| `&`      | Bitwise AND | `A & B`  |
| `\|`     | Bitwise OR  | `A \| B` |
| `~`      | Bitwise NOT | `~A`     |
| `^`      | Bitwise XOR | `A ^ B`  |

These operators are used in the continuous assignments:

```verilog
assign Y = expression;
```

For these simple gates, the assignment continuously drives the output based on the current input values.

---

# Testbench

Each two-input gate is tested with all four possible input combinations:

```text
00
01
10
11
```

A NOT gate has one input, so it has two possible combinations:

```text
0
1
```

The testbenches apply these input combinations with delays and observe the resulting output.

Example:

```verilog
initial begin

    A = 0; B = 0;
    #10;

    A = 0; B = 1;
    #10;

    A = 1; B = 0;
    #10;

    A = 1; B = 1;
    #10;

    $finish;

end
```

---

# Simulation

All logic gates were implemented and tested using **Verilog**.

Behavioral simulations were performed using **Vivado 2024.1**.

The simulation waveforms were checked against the corresponding truth tables.

---


