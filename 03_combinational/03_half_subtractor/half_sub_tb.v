`timescale 1ns / 1ps

module half_sub_tb;

    reg A;
    reg B;

    wire Diff;
    wire Borrow;

    half_sub uut(
        .A(A),
        .B(B),
        .Diff(Diff),
        .Borrow(Borrow)
    );

    initial begin

        A = 0;
        B = 0;
        #10;

        A = 0;
        B = 1;
        #10;

        A = 1;
        B = 0;
        #10;

        A = 1;
        B = 1;
        #10;

        $finish;

    end

endmodule

