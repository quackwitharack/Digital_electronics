`timescale 1ns / 1ps

module full_sub_tb;
    
    reg A;
    reg B;
    reg Bin;

    wire Diff;
    wire Borrow;

    full_sub uut(
        .A(A),
        .B(B),
        .Bin(Bin),
        .Diff(Diff),
        .Borrow(Borrow)
    );

    initial begin

        A = 0; B = 0; Bin = 0;
        #10;

        A = 0; B = 0; Bin = 1;
        #10;

        A = 0; B = 1; Bin = 0;
        #10;

        A = 0; B = 1; Bin = 1;
        #10;

        A = 1; B = 0; Bin = 0;
        #10;

        A = 1; B = 0; Bin = 1;
        #10;

        A = 1; B = 1; Bin = 0;
        #10;

        A = 1; B = 1; Bin = 1;
        #10;

        $finish;

    end

endmodule