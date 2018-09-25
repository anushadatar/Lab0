// Adder testbench
`timescale 1 ns / 1 ps
`include "fourbitadder.v"

module testFourBit();

    reg[3:0] a;
    reg[3:0 ] b;
    reg carryin;
    wire[3:0] sum;
    wire  carryout, overflow;

    fourbitAdder adder (sum, carryout, overflow, a, b, carryin); // Swap after testing

    initial begin
        $dumpfile("fourbitadder.vcd");
        $dumpvars();
        $display("A3210  B3210 | S3210 | C-Out | OF | E3210 C O");
        a[3:0] = 4'b0000;b[3:0]=4'b0000;carryin=0; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0000 0 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b1111;carryin=0; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1110 1 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b0000;carryin=0; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1111 0 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b0000;b[3:0]=4'b1111;carryin=0; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1111 0 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b0001;carryin=0; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0000 1 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b0010;carryin=0; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0001 1 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b0100;carryin=0; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0011 1 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b1000;carryin=0; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0111 1 1", a, b, sum, carryout, overflow);
        $display("WHAAATTTT EMPTTTYYYY SPACEEEE");
        a[3:0] = 4'b1000;b[3:0]=4'b0001;carryin=0; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1001 0 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1000;b[3:0]=4'b0111;carryin=0; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1111 0 0", a, b, sum, carryout, overflow);

        $finish();
        end
endmodule
