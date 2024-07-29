/**
 * TODO: adder
 * and or not nand nor xor
 */

/**
 * sum = a xor b
 * carry = a and b
 */
module HALF_ADDER (
    input  a,
    input  b,
    output sum,
    output carry
);

    xor x1 (sum, a, b);
    and a1 (carry, a, b);
endmodule


/**
 * sum = a xor b xor cin
 * carry = (a and b) or ((a xor b) and cin)
 */
module FULL_ADDER (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    xor x1 (w1, a, b);
    xor x2 (sum, w1, cin);

    and a1 (w2, a, b);
    and a2 (w3, w1, cin);

    or o1 (cout, w2, w3);
endmodule

module ADDER16 (
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] out
);

    wire [15:0] sum, carry;

    FULL_ADDER f0 (
        a[0],
        b[0],
        1'b0,
        sum[0],
        carry[0]
    );

    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin : gen
            FULL_ADDER fu (
                a[i],
                b[i],
                carry[i-1],
                sum[i],
                carry[i]
            );
        end
    endgenerate

    assign out = sum;
endmodule

module TEST3 ();

    reg [15:0] a, b;
    wire [15:0] out;

    ADDER16 add (
        a,
        b,
        out
    );


    initial begin
        $monitor("%h + %h = %h | %d + %d = %5d", a, b, out, a, b, out);

        a = 16'b0000000000000000;
        b = 16'b0000000000000000;

        repeat (10) begin
            #10 a = $urandom_range(0, 65535);
            b = $urandom_range(0, 65535);
        end

        #10 a = 16'b1000000000000000;
        b = 16'b1000000000000000;

        #10 a = 16'b1111000011110000;
        b = 16'b0000111100001111;

        #10 a = 16'b1111111111111111;
        b = 16'b0000000000000001;

        #10 a = 16'b1111111111111111;
        b = 16'b1111111111111111;

        #10 a = 16'b1010101010101010;
        b = 16'b0101010101010101;

        #10 a = 16'b1111000011110000;
        b = 16'b1111000011110000;
    end
endmodule
