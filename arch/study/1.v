/**
 * The logic simulation circuit
 */

/**
 *            Gate
 * Source -----------> Drain
 * pmos (Drain, Source, Gate);
 * 
 * gate = 0 ==> pmos is on
 * gate = 1 ==> pmos is off
 */
module TEST1 ();
    reg gate, source;
    wire drain;

    pmos p1 (drain, source, gate);

    initial begin
        $display("Time\tSource\tGate\tDrain");
        $monitor("%g\t\t%b\t\t%b\t\t%b", $time, source, gate, drain);

        // init
        gate   = 0;
        source = 0;

        #10 source = 1;

        #10;
        gate   = 1;
        source = 0;
        #10 source = 1;
    end
endmodule

/**
 *            Gate
 * Source -----------> Drain
 * nmos (Drain, Source, Gate);
 * 
 * gate = 0 ==> nmos is off
 * gate = 1 ==> nmos is on
 */
module TEST2 ();
    reg gate, source;
    wire drain;

    nmos n1 (drain, source, gate);

    initial begin
        $display("Time\tSource\tGate\tDrain");
        $monitor("%g\t\t%b\t\t%b\t\t%b", $time, source, gate, drain);

        // init
        gate   = 0;
        source = 0;

        #10 source = 1;

        #10;
        gate   = 1;
        source = 0;
        #10 source = 1;
    end
endmodule
