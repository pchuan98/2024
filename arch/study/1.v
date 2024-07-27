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
 * ==============================
 * ==============================
 *            Gate
 * Source -----------> Drain
 * nmos (Drain, Source, Gate);
 * 
 * gate = 0 ==> nmos is off
 * gate = 1 ==> nmos is on
 */

module TEST1 ();
    reg gate, source;
    wire drain_p, drain_n;

    pmos p1 (drain_p, source, gate);
    nmos n1 (drain_n, source, gate);
    initial begin
        $display("Time\tSource\tGate\tPMOS\tNMOS");
        $monitor("%g\t\t%b\t\t%b\t\t%b\t\t%b", $time, source, gate, drain_p, drain_n);

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

