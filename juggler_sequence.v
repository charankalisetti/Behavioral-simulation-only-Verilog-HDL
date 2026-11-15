// ============================================================================
// Module Name: juggler_sequence
// Description: Generates the Juggler sequence starting from n = 7 using
//              Verilog's power operator (**) and $rtoi() floor truncation.
// ============================================================================

module juggler_sequence;

    integer n; // 32-bit signed integer to hold the current sequence term

    initial begin
        // 1. Initialize the starting number of the Juggler sequence
        n = 7;

        // 2. Continue generating terms until the sequence reaches 1
        while (n != 1) begin
            $display("%0d", n); // Print the current term

            if ((n % 2) == 0) begin
                // EVEN RULE: floor( n^(1/2) ) -> square root of n
                // Use 0.5 (real) instead of (1/2), and $rtoi() to drop decimals
                n = $rtoi(n ** 0.5);
            end else begin
                // ODD RULE:  floor( n^(3/2) ) -> square root of n^3
                // Use 1.5 (real) instead of (3/2), and $rtoi() to drop decimals
                n = $rtoi(n ** 1.5);
            end
        end

        // 3. Print the final terminating value (1) after exiting the loop
        $display("%0d", n);
    end

endmodule

/*
===================================================================================================================
                     VERILOG JUGGLER SEQUENCE MASTER GUIDE: `**` OPERATOR, TRAPS & `$rtoi()`
===================================================================================================================

1. WHAT IS THE JUGGLER SEQUENCE?
-------------------------------------------------------------------------------------------------------------------
   Starting with a positive integer n, each next term is calculated as:
     - If n is EVEN : floor( n^(1/2) )  = floor( sqrt(n) )
     - If n is ODD  : floor( n^(3/2) )  = floor( sqrt(n^3) )
   The sequence always terminates when n reaches 1.


2. TWO COMMON MISTAKES WITH `num ** (1/2)` AND `num ** (2/1)`
-------------------------------------------------------------------------------------------------------------------
   Mistake A: Wrong Exponent Direction (2/1 vs. 1/2)
     - The Juggler sequence requires fractional roots: n^(1/2) for even and n^(3/2) for odd.
     - Writing `num ** (2/1)` raises n to the power of 2 (n^2, squaring it) instead of taking the square root.

   Mistake B: Verilog Integer Division Trap
     - Verilog evaluates expressions inside parentheses FIRST based on operand data types.
     - Because `1` and `2` are both integers, `1 / 2` performs integer division and truncates to `0`.
     - As a result, `num ** (1/2)` silently becomes `num ** 0`, which ALWAYS equals `1` and ends the loop
       on the very first iteration!
     - Similarly, `(3/2)` truncates to `1` (`num ** 1 = num`), creating an infinite loop.


3. HOW TO USE THE `**` OPERATOR CORRECTLY
-------------------------------------------------------------------------------------------------------------------
   Write exponents as floating-point (real) literals so Verilog performs real-number power math:
     - Even numbers : `n ** 0.5`   (computes sqrt(n))
     - Odd numbers  : `n ** 1.5`   (computes sqrt(n^3))


4. ROUNDING vs. FLOOR (`$rtoi()` EXPLAINED)
-------------------------------------------------------------------------------------------------------------------
   - The Juggler formula strictly requires the FLOOR (dropping the decimal part, NOT rounding).
   - In Verilog, assigning a `real` result directly to an `integer` rounds to the NEAREST integer.

   Example at n = 7 (Odd):
     - Exact value           : 7 ** 1.5 = sqrt(343) = 18.5203...
     - Direct assignment     : `n = n ** 1.5;`        --> Rounds 18.5203 UP to 19 (WRONG!)
     - Using `$rtoi()`       : `n = $rtoi(n ** 1.5);` --> Truncates decimal to 18  (CORRECT!)
       (`$rtoi` stands for Real-to-Integer and always drops the fractional part toward zero.)


5. STEP-BY-STEP EXECUTION TRACE FOR `n = 7`
-------------------------------------------------------------------------------------------------------------------
   +------+-----------+---------------+--------------------+-----------------------+----------+
   | Step | Current n | Parity        | Exact Real Power   | $rtoi() Floor Result  | Printed  |
   +------+-----------+---------------+--------------------+-----------------------+----------+
   |  1   |     7     | Odd  (7%2!=0) | 7 ** 1.5 = 18.5203 | $rtoi(18.5203) = 18   |    7     |
   |  2   |    18     | Even (18%2=0) | 18 ** 0.5 = 4.2426 | $rtoi(4.2426)  = 4    |   18     |
   |  3   |     4     | Even (4%2=0)  | 4 ** 0.5  = 2.0000 | $rtoi(2.0000)  = 2    |    4     |
   |  4   |     2     | Even (2%2=0)  | 2 ** 0.5  = 1.4142 | $rtoi(1.4142)  = 1    |    2     |
   | Exit |     1     | Loop ends     | (n == 1)           | --                    |    1     |
   +------+-----------+---------------+--------------------+-----------------------+----------+

   Final Console Output:
     7
     18
     4
     2
     1


6. COMPARISON: `**` WITH `$rtoi()` vs. INTEGER SQUARE-ROOT LOOP
-------------------------------------------------------------------------------------------------------------------
   +---------------------+-----------------------------------------+---------------------------------------------+
   | Aspect              | Using `**` (`$rtoi(n ** 1.5)`)          | Using Integer Square-Root Loop              |
   +---------------------+-----------------------------------------+---------------------------------------------+
   | Code Length         | Shorter; directly mirrors math formula  | Longer; uses an inner loop to find floor    |
   |                     |                                         | of sqrt(n^3)                                |
   +---------------------+-----------------------------------------+---------------------------------------------+
   | Precision/Overflow  | Uses 64-bit IEEE double-precision real  | `val = n * n * n` overflows a 32-bit signed |
   |                     | internally (avoids 32-bit n^3 overflow) | integer whenever n > 1290                   |
   +---------------------+-----------------------------------------+---------------------------------------------+
   | Rounding Behavior   | MUST wrap in `$rtoi(...)` or decimals   | Naturally computes the exact integer floor  |
   |                     | >= 0.5 will round up                    | without floating-point rounding             |
   +---------------------+-----------------------------------------+---------------------------------------------+
   | Hardware / RTL      | Strictly simulation-only (`real` and    | Can be converted into a synthesizable       |
   |                     | fractional `**` are not synthesizable)  | clocked FSM with an integer sqrt datapath   |
   +---------------------+-----------------------------------------+---------------------------------------------+

===================================================================================================================
Juggler Sequence Using $sqrtSince $\sqrt{n^3} = n\sqrt{n}$, 
you can compute both branches of the Juggler sequence directly with $sqrt
 and truncate the decimal part using $rtoi() (real-to-integer):Verilogmodule juggler_sqrt;
  integer n;
  initial begin
    n = 7;
    while (n != 1) begin
      $display("%0d", n);
      if ((n % 2) == 0)
        n = $rtoi($sqrt(n));
      else
        n = $rtoi(n * $sqrt(n));
    end
    $display("%0d", n);
  end
endmodule
For n = 7, $sqrt(7) evaluates to 2.645751...,
7 * $sqrt(7) evaluates to 18.520259..., 
and $rtoi() truncates it to 18, producing 7, 18, 4, 2, 1.*/