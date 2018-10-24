`timescale 1ns / 1ps

module top(save, reset, toggle, sw, out);
    input save, reset;
    input toggle;
    input [12:0] sw;
    output [12:0] out;
    
    reg sign1, sign2;
    reg [3:0] exp1, exp2;
    reg [7:0] frac1, frac2;
    
    always @(posedge save, posedge reset) begin
        if (reset) begin
            sign1   <= 0;
            exp1    <= 0;
            frac1   <= 0;
            sign2   <= 0;
            exp2    <= 0;
            frac2   <= 0;
        end
        else begin
            if (toggle) begin
                sign1   <= sign1;
                exp1    <= exp1;
                frac1   <= frac1;
                sign2   <= sw[12];
                exp2    <= sw[11:8];
                frac2   <= sw[7:0];
            end
            else begin
                sign1   <= sw[12];
                exp1    <= sw[11:8];
                frac1   <= sw[7:0];
                sign2   <= sign2;
                exp2    <= exp2;
                frac2   <= frac2;
            end
        end
    end
    
    fp_adder u_fp_adder1(
        .sign1(sign1), .sign2(sign2),
        .exp1(exp1), .exp2(exp2),
        .frac1(frac1), .frac2(frac2),
        .sign_out(out[12]),
        .exp_out(out[11:8]),
        .frac_out(out[7:0]));
    
endmodule
