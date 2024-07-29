## Study

| index | description |
| --- | --- |
| 1 | pmos and nmos |
| 2 | LOGIC |

### logic

| 中文    | Eng  | Symbol |
|--------|-----| ------ |
| 与门    | AND  | 圆梯形 |
| 或门    | OR   | 圆三角形 |
| 非门    | NOT  | 三角形+圆圈 |
| 与非门  | NAND | 圆梯形+圆圈 |
| 或非门  | NOR  | 圆三角形+圆圈 |
| 异或门  | XOR  | 弧形+圆三角形 |
| 同或门  | XNOR | 弧形+圆三角形+圆圈 |

Here is the truth table for a basic logic gate (inputs and outputs represented by 0 and 1):

| A | B | AND (A·B) | OR (A+B) | NOT A | NOT B | NAND (A·B)' | NOR (A+B)' | XOR (A ⊕ B) | XNOR (A ⊙ B) |
|---|---|-----------|----------|-------|-------|-------------|------------|-------------|--------------|
| 0 | 0 |     0     |    0     |   1   |   1   |      1      |     1      |      0      |      1       |
| 0 | 1 |     0     |    1     |   1   |   0   |      1      |     0      |      1      |      0       |
| 1 | 0 |     0     |    1     |   0   |   1   |      1      |     0      |      1      |      0       |
| 1 | 1 |     1     |    1     |   0   |   0   |      0      |     0      |      0      |      1       |

- **AND (A·B)**: The result is 1 only if both A and B are 1.
- **OR (A+B)**: The result is 1 if at least one of A or B is 1.
- **NOT A**: The negation of A; the result is 0 if A is 1, and 1 if A is 0.
- **NOT B**: The negation of B; the result is 0 if B is 1, and 1 if B is 0.
- **NAND (A·B)'**: The negation of AND; the result is 0 if both A and B are 1, and 1 in all other cases.
- **NOR (A+B)'**: The negation of OR; the result is 0 if at least one of A or B is 1, and 1 if both A and B are 0.
- **XOR (A ⊕ B)**: The result is 1 if A and B are different, and 0 if they are the same.
- **XNOR (A ⊙ B)**: The result is 1 if A and B are the same, and 0 if they are different.

加法器是一种用于二进制数相加的电路，通常分为半加器（Half Adder）和全加器（Full Adder）。

### 半加器 (Half Adder)
半加器是最简单的加法器，能够对两个单个位进行相加，输出和（Sum）和进位（Carry）。

#### 逻辑门实现：
- **输入**：A, B（两个单个位）
- **输出**：Sum, Carry

**真值表**：

| A | B | Sum | Carry |
|---|---|-----|-------|
| 0 | 0 |  0  |   0   |
| 0 | 1 |  1  |   0   |
| 1 | 0 |  1  |   0   |
| 1 | 1 |  0  |   1   |

**逻辑表达式**：
- Sum = A XOR B
- Carry = A AND B

**逻辑电路**：

```plaintext
A -----|    |----- Sum (A XOR B)
       | XOR|
B -----|    |


A -----|    |----- Carry (A AND B)
       | AND|
B -----|    |
```

### 全加器 (Full Adder)
全加器能够对三个单个位进行相加，输入包括两个加数位（A和B）和一个来自低位的进位（Cin），输出和（Sum）和进位（Cout）。

#### 逻辑门实现：
- **输入**：A, B, Cin（两个加数位和一个进位）
- **输出**：Sum, Cout（和与进位）

**真值表**：

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 |  0  |  0  |   0  |
| 0 | 0 |  1  |  1  |   0  |
| 0 | 1 |  0  |  1  |   0  |
| 0 | 1 |  1  |  0  |   1  |
| 1 | 0 |  0  |  1  |   0  |
| 1 | 0 |  1  |  0  |   1  |
| 1 | 1 |  0  |  0  |   1  |
| 1 | 1 |  1  |  1  |   1  |

**逻辑表达式**：
- Sum = A XOR B XOR Cin
- Cout = (A AND B) OR (CIN AND (A XOR B))

**逻辑电路**：

```plaintext
A -----|    |-----|    |----- Sum (A XOR B XOR Cin)
       | XOR|     | XOR|
B -----|    |     |    |
             |    |
Cin ---------|----|

A -----|    |-----|    |----- Cout
       | AND|     | OR |
B -----|    |     |    |
             |    |
Cin ---------|----|
```

这就是半加器和全加器的基本实现原理和逻辑电路图。半加器可以处理单个位的相加，而全加器可以处理包含进位的位相加。多个全加器可以级联起来形成一个多位的加法器。