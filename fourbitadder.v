// Adder circuit
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

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
    output sum, 
    output carryout,
    input a0,a1,a2,a3,
    input b0,b1,b2,b3,
    input carryin
);

    wire sum1,sum2,sum3,c1,c2,c3;

    FullAdder add1(sum1,c1,a0,b0,carryin);
    FullAdder add2(sum2,c2,a1,b1,c1);
    FullAdder add3(sum3,c3,a2,b2,c2);
    FullAdder add4(sum,carryout,a3,b3,c3);

endmodule
