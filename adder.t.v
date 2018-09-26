// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFourBit();

    reg[3:0] a;
    reg[3:0 ] b;
    reg carryin;
    wire[3:0] sum;
    wire  carryout, overflow;

    FullAdder4bit adder (sum, carryout, overflow, a, b); // Swap after testing

    initial begin
        $dumpfile("fourbitadder.vcd");
        $dumpvars();
        $display("A3210  B3210 | S3210 | C-Out | OF | E3210 C O");
        a[3:0] = 4'b0000;b[3:0]=4'b0000; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0000 0 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b1111; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1110 1 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b0000; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1111 0 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b0000;b[3:0]=4'b1111; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1111 0 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b0001; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0000 1 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b0010; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0001 1 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b0100; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0011 1 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1111;b[3:0]=4'b1000; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0111 1 1", a, b, sum, carryout, overflow);
        a[3:0] = 4'b0001;b[3:0]=4'b1111; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0000 1 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b0010;b[3:0]=4'b1111; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0001 1 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b0100;b[3:0]=4'b1111; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0011 1 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1000;b[3:0]=4'b1111; #1000
        $display(" %b   %b |  %b | %b     | %b  |  0111 1 1", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1000;b[3:0]=4'b0001; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1001 0 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1000;b[3:0]=4'b0011; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1011 0 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1000;b[3:0]=4'b0111; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1111 0 0", a, b, sum, carryout, overflow);
        a[3:0] = 4'b1010;b[3:0]=4'b1111; #1000
        $display(" %b   %b |  %b | %b     | %b  |  1001 1 0", a, b, sum, carryout, overflow);

        $finish();
        end
endmodule
