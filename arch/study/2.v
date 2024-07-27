/**
 * TODO: logic simulation circuit
 * and or not nand nor xor
 */

/**
 *                           |pmos(a) gnd
 *  vdd nmos(b) nmos(a) out  |
 *                           |pmos(b) gnd
 */
module AND (
    output out,
    input  a,
    input  b
);
    nmos n1 (w1, 1, b);
    nmos n2 (out, w1, a);

    pmos p1 (out, 0, a);
    pmos p2 (out, 0, b);
endmodule

/**
 *                           |nmos(a) vdd
 *  vdd pmos(b) pmos(a) out  |
 *                           |nmos(b) vdd
 */
module OR (
    output out,
    input  a,
    input  b
);

    nmos n1 (out, 1, a);
    nmos n2 (out, 1, b);

    pmos p1 (out, w1, a);
    pmos p2 (w1, 0, b);
endmodule

/**
 * vdd pmos(a) out nmos(a) gnd
 */
module NOT (
    output out,
    input  a
);
    pmos p1 (out, 1, a);
    nmos n1 (out, 0, a);
endmodule

/**
 *                           |pmos(a) vdd
 * gnd nmos(b) nmos(a) out
 *                           |pmos(b) vdd
 */
module NAND (
    output out,
    input  a,
    input  b
);
    pmos p1 (out, 1, a);
    pmos p2 (out, 1, b);

    nmos n1 (out, w1, a);
    nmos n2 (w1, 0, b);
endmodule

/** 
 *                           |nmos(a) gnd
 * vdd pmos(b) pmos(a) out
 *                           |nmos(b) gnd
 */
module NOR (
    output out,
    input  a,
    input  b
);
    nmos n1 (out, 0, a);
    nmos n2 (out, 0, b);

    pmos p1 (out, w1, a);
    pmos p2 (w1, 1, b);
endmodule

/**
 *                     vdd
 *                    pmos(b)
 *                    nmos(a)
 * gnd pmos(b) pmos(a) out nmos(a) nmos(b) gnd
 *                    pmos(a)
 *                    nmos(b)
 *                     vdd
 */
module XOR (
    output out,
    input  a,
    input  b
);
    pmos (w1, 0, b);
    pmos (out, w1, a);

    nmos (w2, 0, b);
    nmos (out, w2, a);

    nmos (w3, 1, b);
    pmos (out, w3, a);

    pmos (w4, 1, b);
    nmos (out, w4, a);
endmodule

/**
 *                     gnd
 *                    pmos(b)
 *                    nmos(a)
 * vdd pmos(b) pmos(a) out nmos(a) nmos(b) vdd
 *                    pmos(a)
 *                    nmos(b)
 *                     gnd
 */
module XNOR (
    output out,
    input  a,
    input  b
);
    pmos (w1, 1, b);
    pmos (out, w1, a);

    nmos (w2, 1, b);
    nmos (out, w2, a);

    nmos (w3, 0, b);
    pmos (out, w3, a);

    pmos (w4, 0, b);
    nmos (out, w4, a);
endmodule

module TEST2 ();

    reg a, b;
    wire o_and, o_or, o_not, o_nand, o_nor, o_xor, o_xnor;

    AND and1 (
        o_and,
        a,
        b
    );
    OR or1 (
        o_or,
        a,
        b
    );
    NOT not1 (
        o_not,
        a
    );
    NAND nand1 (
        o_nand,
        a,
        b
    );
    NOR nor1 (
        o_nor,
        a,
        b
    );
    XOR xor1 (
        o_xor,
        a,
        b
    );
    XNOR xnor1 (
        o_xnor,
        a,
        b
    );

    initial begin

        $display("time\ta\tb\tAND\tOR\tNOT\tNAND\tNOR\tXOR\tXNOR");
        $monitor("%g\t\t%b\t%b\t%b\t%b\t%b\t%b\t\t%b\t%b\t%b", $time, a, b, o_and, o_or, o_not,
                 o_nand, o_nor, o_xor, o_xnor);

        // init
        a = 0;
        b = 0;
        #10 b = 1;
        #10 a = 1;
        b = 0;
        #10 b = 1;
    end
endmodule
