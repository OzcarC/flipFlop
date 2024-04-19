`timescale 1ns/1ps

module tb_register;
    wire Q;
    reg new_D, clock, en;
    integer i,j;

    register dat(.new_D(new_D),.clock(clock),.Q(Q),.en(en));
    initial
        begin
            $dumpfile("wave_register.vcd");
            $dumpvars(0,tb_register);
            clock = 0;
                for(i=0; i<30;i=i+1) begin
                    #10 clock = ~clock;
                end
        end
    initial 
        begin
            new_D = 0;
            en = 1;
            for(j=0;j<12;j=j+1)begin
                #25 new_D = ~ new_D;
                if(j%2==0&&j>0)
                    #5 en = ~ en;
            end
        end
    always @ (new_D)
        begin
          $display("D = %d, clock = %d", new_D, clock);
        end
endmodule
