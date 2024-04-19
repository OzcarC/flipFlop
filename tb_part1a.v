`timescale 1ns/1ps

module tb_flipFlop;
    wire q;
    reg d, clock;
    integer i;

    flipFlop dat(.d(d),.clock(clock),.q(q));
    initial
        begin
            $dumpfile("wave_flipFlop.vcd");
            $dumpvars(0,tb_flipFlop);
            clock = 0;
                for(i=0; i<30;i=i+1) begin
                    #10 clock = ~clock;
                end
        end
    initial 
        begin
            d = 0;
            #50;
            d = 1;
            #50;
            d = 0;
            #50;
            d = 1;
            #50;
        end
    always @ (d)
        begin
          $display("D = %d, clock = %d", d, clock);
        end
endmodule
