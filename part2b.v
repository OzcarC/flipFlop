`timescale 1ns/1ps
module register(
    input new_D, clock, en, 
    output reg Q);

    always @(posedge clock) begin
        Q<= en? new_D : Q;
    end
endmodule