`timescale 10ps/1ps

module flipFlop(
    input d,clock,
    output q, q_bar);
    reg q,q_bar;

    always @ (posedge clock)
        begin
            #2 q=d;
            #1 q_bar = ~d;
        end
endmodule
