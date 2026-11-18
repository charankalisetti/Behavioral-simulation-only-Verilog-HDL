/*
===================================================================================================================
                                      HAPPY NUMBERS MASTER STUDY GUIDE
===================================================================================================================

1. DEFINITION & CORE RULES
-------------------------------------------------------------------------------------------------------------------
   - A Happy Number is a positive integer that eventually reaches 1 when you repeatedly replace the number with
     the sum of the squares of its digits.
   - How It Works:
       1) Take any positive integer.
       2) Square each of its digits and add them together.
       3) Repeat the process with the new sum.
       4) HAPPY          : If the sequence reaches 1.
       5) UNHAPPY (SAD)  : If the sequence enters an endless repeating cycle that never includes 1:
                           (4 -> 16 -> 37 -> 58 -> 89 -> 145 -> 42 -> 20 -> 4)

   - First 10 Happy Numbers : 1, 7, 10, 13, 19, 23, 28, 31, 32, 44

   - Example 1 (Happy Number: 19):
       1^2 + 9^2       = 1 + 81     = 82
       8^2 + 2^2       = 64 + 4     = 68
       6^2 + 8^2       = 36 + 64    = 100
       1^2 + 0^2 + 0^2 = 1 + 0 + 0  = 1   --> HAPPY!

   - Example 2 (Unhappy Number: 4):
       4^2       = 16
       1^2 + 6^2 = 37
       3^2 + 7^2 = 58 -> 89 -> 145 -> 42 -> 20 -> 4  --> Loops endlessly without reaching 1 (UNHAPPY!)


2. Q&A SUMMARY: QUESTIONS & ANSWERS
-------------------------------------------------------------------------------------------------------------------
   Q1: Does "unhappy" mean the starting number itself has to repeat in the sequence?
   A1: Almost! The starting number itself does not have to come back—it just means ANY number in the sequence
       repeats, trapping it in an endless cycle.
       - For example, starting at 2 gives: 2 -> 4 -> 16 -> 37 -> ... -> 4. The number 2 never returns,
         but 4 repeats forever, so 2 is unhappy.
       - (Note: 1 also repeats because 1^2 = 1, which is the special winning condition.)

   Q2: Why is "hitting 4" a special condition / shortcut for unhappy numbers?
   A2: In standard base-10 math, every single unhappy number eventually falls into the exact same 8-number loop:
         4 -> 16 -> 37 -> 58 -> 89 -> 145 -> 42 -> 20 -> 4
       - Because all unhappy paths merge into this single trap, you do not need to track every past number.
         The moment you hit 4 (or any of the other 7 numbers in that loop), you know it will never reach 1.
       - Example starting at 3:
         3^2 = 9 -> 9^2 = 81 -> 8^2+1^2 = 65 -> 6^2+5^2 = 61 -> 6^2+1^2 = 37 -> 58 -> 89 -> 145 -> 42 -> 20 -> 4.

   Q3: What does "standard base-10 math" mean?
   A3: Standard base-10 (decimal) is the normal everyday counting system using 10 digits (0 through 9), where
       each place value increases by powers of 10 (ones, tens, hundreds, thousands).
       - Mathematicians specify "base-10" because changing the number base changes the loops:
         * Base-2 (Binary, digits 0 & 1)       : Every positive integer is happy.
         * Base-3 (Ternary, digits 0, 1, & 2) : Unhappy numbers fall into different loops (e.g., 2 -> 11 -> 2
                                                or 5 -> 22 -> 12 -> 5) instead of the base-10 4-loop.


3. VERILOG IMPLEMENTATION USING THE `4` SHORTCUT
-------------------------------------------------------------------------------------------------------------------
*/

// ============================================================================
// Module Name: check_happy_numbers
// Description: Checks whether a given positive integer `num` is a Happy Number
//              or an Unhappy (Sad) Number using the base-10 `1` and `4` rules.
// ============================================================================

module check_happy_numbers;

    integer num = 19;               // Input number to test
    integer temp, sum, digit;

    initial 
		begin : block
			temp = num;                 // Copy input so original `num` is preserved for $display

        // Continue repeating until sequence reaches 1 (Happy) or 4 (Unhappy trap)
        while (temp != 1 && temp != 4 && temp > 0) 
			begin
				sum = 0;                // CRITICAL FIX: Reset `sum` to 0 before every new pass!

            // Extract each digit of `temp` and accumulate the sum of squares
            while (temp > 0) 
				begin
					digit = temp % 10;
					temp  = temp / 10;
					sum   = sum + (digit ** 2);
				end

            temp = sum;             // Load the newly computed sum for the next iteration
        end

        // Final check based on the settled value of `temp`
        if (temp == 1)
            $display("%0d is a happy number", num);
        else
            $display("%0d is an unhappy (sad) number", num);

        #10;
        $finish;
    end

endmodule

/*
===================================================================================================================
                                      BUG ANALYSIS & EXECUTION TRACE (`num = 19`)
===================================================================================================================

1. WHY YOUR ORIGINAL CODE HUNG IN AN INFINITE LOOP
-------------------------------------------------------------------------------------------------------------------
   - Missing `sum = 0;` inside `while (sum != 1 && sum != 4)`:
       * Pass 1 (temp = 19) : sum = 0 + 9^2 + 1^2 = 82   --> temp becomes 82
       * Pass 2 (temp = 82) : sum = 82 + 2^2 + 8^2 = 150 --> WRONG! Should have started from 0 to get 68!
       * Because `sum` kept accumulating without resetting, it never hit 1 or 4 and hung forever.


2. CORRECT EXECUTION TRACE WITH `sum = 0;` ADDED (`num = 19`)
-------------------------------------------------------------------------------------------------------------------
   - Initial State : temp = 19
   - Outer Pass 1  : sum reset to 0 -> 9^2 + 1^2 = 82          -> temp = 82
   - Outer Pass 2  : sum reset to 0 -> 2^2 + 8^2 = 68          -> temp = 68
   - Outer Pass 3  : sum reset to 0 -> 8^2 + 6^2 = 100         -> temp = 100
   - Outer Pass 4  : sum reset to 0 -> 0^2 + 0^2 + 1^2 = 1     -> temp = 1
   - Loop Exits    : `temp == 1` is TRUE -> Prints: "19 is a happy number"

===================================================================================================================
*/
	