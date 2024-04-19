`timescale 1ns/1ps
`include "part1a.v"

module register(
    input new_D, clock, en, 
    output Q);

    wire D, en_bar, w1,w2;
    not(en_bar, en);
    and(w1,en_bar, Q);
    and(w2,en, new_D);
    or(D,w1,w2);
    flipFlop ff(.d(D),.clock(clock),.q(Q));

endmodule