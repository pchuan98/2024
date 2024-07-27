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