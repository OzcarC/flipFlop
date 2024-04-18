`timescale 10ps/1ps

module flipFlop(
    input d,clock,reset,
    output q, q_bar);
    reg q,q_bar;

    always @ (posedge clock or negedge reset)
        begin
        if(reset == 0) begin
            q<=0;
            q_bar<= 1;
        end
        else begin
            q<=d;
            q_bar <= ~d;
        end
    end
endmodule