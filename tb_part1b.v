`timescale 1ns/1ps

module tb_flipFlop;
    wire q,q_bar;
    reg d, clock,reset;
    integer i;

    flipFlop dat(.d(d),.clock(clock),.q(q),.q_bar(q_bar));
    initial
        begin
            $dumpfile("wave_flipFlopRest.vcd");
            $dumpvars(0,tb_flipFlop);
            clock = 0;
                for(i=0; i<30;i=i+1) begin
                    #10clock = ~clock;
                end
        end
    initial 
        begin
            reset = 0;
            d = 0;
            #55 reset = 0;
            d = 1;
            #55 reset = 0;

            d = 0;
            #55 reset = 1;
            d = 1;
            #55 reset = 1;
        end
    always @ (d)
        begin
          $display("D = %d, clock = %d", d, clock);
        end
endmodule
