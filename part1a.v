`timescale 1ns/1ps

module flipFlop(
    input d,clock,
    output q);
    wire mD, mD_bar, mTop, mBot, mQ,mQ_bar, clock_bar,
    sD, sD_bar, sTop, sBot, sQ, sQ_bar;

    not(clock_bar,clock);
    not(mD_bar,mD);
    notif1(mD,d,clock_bar);
    nand(mTop,mD,clock_bar);
    nand(mBot,mD_bar,clock_bar);
    nand(mQ,mTop,mQ_bar);
    nand(mQ_bar,mBot,mQ);

    not(sD_bar,sD);
    notif1(sD,mQ,clock);
    nand(sTop,sD,clock);
    nand(sBot,sD_bar,clock);
    nand(sQ,sTop,sQ_bar);
    nand(sQ_bar,sBot,sQ);
    buf(q,sQ);

endmodule
