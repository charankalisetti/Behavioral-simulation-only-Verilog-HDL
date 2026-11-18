// ============================================================================
// Module Name: heptagonal_numbers
// Description: Generates and prints the first 10 Heptagonal numbers starting
//              from the standard mathematical index i = 1.
// Formula    : H(i) = (i * (5*i - 3)) / 2
// ============================================================================

module heptagonal_numbers;

    integer n, hep, i;

    initial begin
        n = 10;                             // Total number of terms to generate

        // Start loop at i = 1 (standard starting index for polygonal numbers)
        for (i = 1; i <= n; i = i + 1) begin
            hep = (i * ((5 * i) - 3)) / 2;  // Compute i-th heptagonal number
            $display("%0d", hep);           // Print result to console
        end
    end

endmodule

/*
===================================================================================================================
                         HEPTAGONAL & HEXAGONAL STARTING INDEX REFERENCE GUIDE
===================================================================================================================

1. SHOULD YOU START AT `i = 0` OR `i = 1`?
-------------------------------------------------------------------------------------------------------------------
   - ALWAYS start at `i = 1` for standard polygonal number sequences.
   - Geometrically, `i` represents the number of dots along each outer edge of the polygon:
       * i = 1 -> 1 dot  (Base vertex)  -> Result = 1
       * i = 2 -> 2 dots per side       -> Result = 7  (Heptagonal) / 6 (Hexagonal)
       * i = 3 -> 3 dots per side       -> Result = 18 (Heptagonal) / 15 (Hexagonal)
   - Setting `i = 0` gives `0`, which is only a mathematical boundary placeholder (0th term), not part of the
     standard sequence.


2. EXECUTION TRACE TABLE (`i = 1` to `10`)
-------------------------------------------------------------------------------------------------------------------
   +-----+-----------------------------+---------------------+-----------------------------+-------------------+
   |  i  | Heptagonal: i*(5i - 3) / 2  | Heptagonal Value    | Hexagonal: i*(2i - 1)       | Hexagonal Value   |
   +-----+-----------------------------+---------------------+-----------------------------+-------------------+
   |  1  | 1 * (5 - 3) / 2             |         1           | 1 * (2 - 1)                 |         1         |
   |  2  | 2 * (10 - 3) / 2            |         7           | 2 * (4 - 1)                 |         6         |
   |  3  | 3 * (15 - 3) / 2            |        18           | 3 * (6 - 1)                 |        15         |
   |  4  | 4 * (20 - 3) / 2            |        34           | 4 * (8 - 1)                 |        28         |
   |  5  | 5 * (25 - 3) / 2            |        55           | 5 * (10 - 1)                |        45         |
   |  6  | 6 * (30 - 3) / 2            |        81           | 6 * (12 - 1)                |        66         |
   |  7  | 7 * (35 - 3) / 2            |       112           | 7 * (14 - 1)                |        91         |
   |  8  | 8 * (40 - 3) / 2            |       148           | 8 * (16 - 1)                |       120         |
   |  9  | 9 * (45 - 3) / 2            |       189           | 9 * (18 - 1)                |       153         |
   | 10  | 10 * (50 - 3) / 2           |       235           | 10 * (20 - 1)               |       190         |
   +-----+-----------------------------+---------------------+-----------------------------+-------------------+

===================================================================================================================
however, $1$ is universally defined as the 1st term ($n = 1$) of every polygonal sequence 
(triangular, square, pentagonal, hexagonal, heptagonal) 
because of how nested polygons grow from a shared anchor corner
*/