`timescale 1ns/1ps

module tb_flipFlop;
    wire q,q_bar;
    reg d, clock,reset;
    integer i,j;

    flipFlop dat(.d(d),.clock(clock),.q(q),.q_bar(q_bar),.reset(reset));
    initial
        begin
            $dumpfile("wave_flipFlopRest.vcd");
            $dumpvars(0,tb_flipFlop);
            clock = 0;
                for(i=0; i<30;i=i+1) begin
                    #10 clock = ~clock;
                end
            reset = 1;
        end
    initial 
        begin
            d = 0;
            reset = 1;
            for(j=0;j<4;j=j+1)begin
                #25 d = ~ d;
            end
            reset = 0;
            for(j=0;j<4;j=j+1)begin
                #25 d = ~ d;
            end
            reset = 1;
            for(j=0;j<4;j=j+1)begin
                #25 d = ~ d;
            end
            
        end
    always @ (d)
        begin
          $display("D = %d, clock = %d", d, clock);
        end
endmodule
