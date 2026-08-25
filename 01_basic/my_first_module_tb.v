`timescale 1ns / 1ps

module my_first_module_tb;

    reg A;
    wire Y;

    my_first_module uut (
        .A(A),
        .Y(Y)
    );

    initial begin

        A = 0;
        #10;

        A = 1;
        #10;

        A = 0;
        #10;

        $finish;

    end

endmodule