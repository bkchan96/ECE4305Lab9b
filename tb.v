`timescale 1ns / 1ps

module tb();
    reg sign1, sign2;
    reg [3:0] exp1, exp2;
    reg [7:0] frac1, frac2;
    
    wire outsign;
    wire [3:0] outexp;
    wire [7:0] outfrac;
    
    fp_adder u_fp_adder1(
        .sign1(sign1),
        .sign2(sign2),
        .exp1(exp1),
        .exp2(exp2),
        .frac1(frac1),
        .frac2(frac2),
        .sign_out(outsign),
        .exp_out(outexp),
        .frac_out(outfrac));

    initial begin
        sign1 = 0;
        exp1 = 4'b0001;
        frac1 = 8'b1000_0000;
        sign2 = 1;
        exp2 = 4'b0000;
        frac2 = 8'b1100_0000;
        #1
        $finish;
    end
endmodule
