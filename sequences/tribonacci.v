// ============================================================================
// Module Name: tribonacci
// Description: Generates and prints the first 10 next-terms of a Tribonacci
//              sequence starting from seed values (0, 1, 1) in zero simulation
//              time using a procedural `for` loop.
// ============================================================================

module tribonacci;

    // 32-bit signed variables to hold the sliding window of 3 terms and sum
    integer a, b, c, next;

    initial begin : block
        integer i;                  // Loop counter variable (local to named block)

        // 1. Initialize the first three seed values of the Tribonacci sequence
        a = 0;
        b = 1;
        c = 1;

        // 2. Execute 10 iterations (i = 0 to 9) in zero simulation time (t = 0)
        for (i = 0; i < 10; i = i + 1) begin
            // Step A: Compute the next Tribonacci number (sum of previous 3 terms)
            next = a + b + c;

            // Step B: Shift the 3-number sliding window forward by one position
            // (Blocking '=' assignments execute sequentially in exact top-to-bottom order)
            a = b;                  // Old 'b' becomes new 'a'
            b = c;                  // Old 'c' becomes new 'b'
            c = next;               // Newly calculated 'next' becomes new 'c'

            // Step C: Print the current value to the simulator console without newline
            $write("%d", next);

            // Step D: Print a comma separator after every number except the last (i = 9)
            if (i < 9)
                $write(",");
        end
    end

endmodule

/*
===================================================================================================================
                         TRIBONACCI EXECUTION TRACE & WAVEFORM EXPLANATION GUIDE
===================================================================================================================

1. WHY THE OBJECTS / WAVEFORM WINDOW SHOWS ONLY (149, 274, 504, 504)
-------------------------------------------------------------------------------------------------------------------
   - In Verilog, a `for` loop without time delays (`#delay` or `@(posedge clk)`) executes all 10 iterations
     instantly at simulation time t = 0.
   - The simulator transcript/console captures every `$write` call during the loop, printing the full series:
     Console Output: 2, 4, 7, 13, 24, 44, 81, 149, 274, 504
   - However, the Waveform / Objects window displays the FINAL settled value of each variable at the end of
     time step t = 0 (after iteration 10 completes).


2. COMPLETE 10-ITERATION EXECUTION TRACE TABLE
-------------------------------------------------------------------------------------------------------------------
   Initial Seed State (Before Loop):  a = 0,  b = 1,  c = 1

   +-----------+-----+------+------+------+----------------+------------------+-------------------------+
   | Iteration |  i  |  a   |  b   |  c   | next = a+b+c   | Shifted (a, b, c)| Console Printed Output  |
   +-----------+-----+------+------+------+----------------+------------------+-------------------------+
   |     1     |  0  |  0   |  1   |  1   | 0 + 1 + 1 = 2  | (1,   1,   2)    | "2,"                    |
   |     2     |  1  |  1   |  1   |  2   | 1 + 1 + 2 = 4  | (1,   2,   4)    | "4,"                    |
   |     3     |  2  |  1   |  2   |  4   | 1 + 2 + 4 = 7  | (2,   4,   7)    | "7,"                    |
   |     4     |  3  |  2   |  4   |  7   | 2 + 4 + 7 = 13 | (4,   7,   13)   | "13,"                   |
   |     5     |  4  |  4   |  7   |  13  | 4 + 7 + 13= 24 | (7,   13,  24)   | "24,"                   |
   |     6     |  5  |  7   |  13  |  24  | 7 + 13+ 24= 44 | (13,  24,  44)   | "44,"                   |
   |     7     |  6  |  13  |  24  |  44  | 13+ 24+ 44= 81 | (24,  44,  81)   | "81,"                   |
   |     8     |  7  |  24  |  44  |  81  | 24+ 44+ 81=149 | (44,  81,  149)  | "149,"                  |
   |     9     |  8  |  44  |  81  |  149 | 44+ 81+149=274 | (81,  149, 274)  | "274,"                  |
   |    10     |  9  |  81  |  149 |  274 | 81+149+274=504 | (149, 274, 504)  | "504" (no comma)        |
   +-----------+-----+------+------+------+----------------+------------------+-------------------------+


3. STEP-BY-STEP BREAKDOWN OF THE FINAL ITERATION (i = 9)
-------------------------------------------------------------------------------------------------------------------
   - Entering Iteration 10 : a = 81,  b = 149, c = 274
   - Addition Step         : next = 81 + 149 + 274 = 504
   - Shift Step 1          : a = b    --> a becomes 149
   - Shift Step 2          : b = c    --> b becomes 274
   - Shift Step 3          : c = next --> c becomes 504
   - Loop Terminates       : i increments to 10 (condition `i < 10` becomes FALSE)

   Final Settled Values Visible in Waveform / Objects Window:
     a    = 149
     b    = 274
     c    = 504
     next = 504
     i    = 10


4. TIP: HOW TO SEE EVERY NUMBER IN THE WAVEFORM VIEWER
-------------------------------------------------------------------------------------------------------------------
   - Add a small simulation delay (e.g., `#10;`) inside the `for` loop after `c = next;`.
   - This spaces each iteration 10 time units apart so every intermediate value of `a`, `b`, `c`, and `next`
     appears clearly as a step on the waveform timeline.

===================================================================================================================
*/