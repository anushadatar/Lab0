// Adder circuit
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50
`define ADD FullAdder #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule


module FullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire out1,out2,out3;

    `XOR xor1(out1,a,b);
    `XOR xor2(sum,out1,carryin);

    `AND and1(out2,out1,carryin);
    `AND and2(out3,a,b);

    `OR or1(carryout,out2,out3);

endmodule

module fourbitAdder
(
    output[0:3] sum, 
    output carryout,
    output overflow,
    input[0:3] a,
    input[0:3] b
);

    wire sum0,sum1,sum2,c0,c1,c2;
    
    ADD add0(sum[0],c0,a[0],b[0],0);
    ADD add1(sum[1],c1,a[1],b[1],c0);
    ADD add2(sum[2],c2,a[2],b[2],c1);
    ADD add3(sum[3],carryout,a[3],b[3],c2);

    XOR flag(overflow, carryout, c2);

endmodule
