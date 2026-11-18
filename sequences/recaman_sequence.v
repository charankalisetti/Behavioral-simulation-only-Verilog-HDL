// ============================================================================
// Module Name: recaman_sequence
// Description: Generates and prints the Recamán sequence using a 1D integer
//              array `seq[0:19]` to check for previously visited values.
// Rule       : a(n) = a(n-1) - n   if (a(n-1) - n >= 0) AND not already in seq
//              a(n) = a(n-1) + n   otherwise
// ============================================================================

module recaman_sequence;

    integer seq [0:19];                 // Array storing sequence history

    initial begin : block
        integer i, j, candidate;
        reg     found;                  // 1-bit flag: 1 if candidate already exists

        // 1. Seed the first term of the Recamán sequence
        seq[0] = 0;
        $display("%0d", seq[0]);        // Prints: 0

        // 2. Generate terms from i = 1 to i = 10
        for (i = 1; i <= 10; i = i + 1) begin
            candidate = seq[i - 1] - i; // Step backward candidate
            found     = 1'b0;           // Reset flag before scanning history

            // 3. Check if candidate is valid (>= 0) and search all prior terms
            if (candidate >= 0) begin
                for (j = 0; j < i; j = j + 1) begin
                    if (seq[j] == candidate)
                        found = 1'b1;   // Mark as seen; do NOT overwrite later!
                end
            end

            // 4. Choose backward step only if >= 0 AND never seen before
            if ((candidate >= 0) && (!found))
                seq[i] = candidate;
            else
                seq[i] = seq[i - 1] + i;

            $display("%0d", seq[i]);
        end
    end

endmodule

/*
===================================================================================================================
                         RECAMÁN SEQUENCE EXECUTION TRACE & BUG COMPARISON (`i = 0` to `10`)
===================================================================================================================

1. STEP-BY-STEP EXECUTION TRACE (CORRECTED CODE)
-------------------------------------------------------------------------------------------------------------------
   +----+-----------+---------------+--------------------+----------------------------+---------------+
   | i  | seq[i-1]  | Candidate     | Status Check       | Action Taken               | Stored seq[i] |
   |    |           | (seq[i-1]-i)  |                    |                            |               |
   +----+-----------+---------------+--------------------+----------------------------+---------------+
   | 0  |    --     |      --       | Initial Seed       | seq[0] = 0                 |       0       |
   | 1  |     0     |  0 - 1 = -1   | < 0 (Negative)     | Add: 0 + 1                 |       1       |
   | 2  |     1     |  1 - 2 = -1   | < 0 (Negative)     | Add: 1 + 2                 |       3       |
   | 3  |     3     |  3 - 3 =  0   | 0 already at seq[0]| Add: 3 + 3                 |       6       |
   | 4  |     6     |  6 - 4 =  2   | >= 0 and NOT seen  | Subtract: 6 - 4            |       2       |
   | 5  |     2     |  2 - 5 = -3   | < 0 (Negative)     | Add: 2 + 5                 |       7       |
   | 6  |     7     |  7 - 6 =  1   | 1 already at seq[1]| Add: 7 + 6                 |      13       |
   | 7  |    13     | 13 - 7 =  6   | 6 already at seq[3]| Add: 13 + 7                |      20       |
   | 8  |    20     | 20 - 8 = 12   | >= 0 and NOT seen  | Subtract: 20 - 8           |      12       |
   | 9  |    12     | 12 - 9 =  3   | 3 already at seq[2]| Add: 12 + 9                |      21       |
   | 10 |    21     | 21 - 10 = 11  | >= 0 and NOT seen  | Subtract: 21 - 10          |      11       |
   +----+-----------+---------------+--------------------+----------------------------+---------------+

   Correct Sequence Output (i = 0..10):
     0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11


2. WHY YOUR ORIGINAL CODE PRODUCED WRONG VALUES AFTER `i = 2`
-------------------------------------------------------------------------------------------------------------------
   - Your original code gave : 0, 1, 3, 0, 4, 9  (WRONG at i = 3 because 0 was overwritten by the `else` branch!)
   - Rule of thumb for array searches in Verilog:
     Never make the final decision inside an `if / else` inside a search loop—always set a `found` flag inside
     the loop and assign `seq[i]` once after the loop finishes.

===================================================================================================================
*/