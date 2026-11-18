// ============================================================================
// Module Name: polygonal_numbers
// Description: Prints the first 10 triangular, square, pentagonal, hexagonal,
//              and heptagonal numbers.
// Starting index: n = 1 (the first positive term of each sequence)
// ============================================================================

module polygonal_numbers;

    integer n;
    integer triangular, square, pentagonal, hexagonal, heptagonal;

    initial begin
        $display("n triangular square pentagonal hexagonal heptagonal");

        for (n = 1; n <= 10; n = n + 1) begin
            triangular = (n * (n + 1)) / 2;
            square = n * n;
            pentagonal = (n * ((3 * n) - 1)) / 2;
            hexagonal = n * ((2 * n) - 1);
            heptagonal = (n * ((5 * n) - 3)) / 2;

            $display("%0d %0d %0d %0d %0d %0d",
                     n, triangular, square, pentagonal, hexagonal, heptagonal);
        end
    end

endmodule

