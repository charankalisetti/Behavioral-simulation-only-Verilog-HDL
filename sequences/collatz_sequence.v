module collatz_sequence;
integer num=6;

initial 
	begin
		while(num!=1)
			begin
				$write("%d,",num);
				if(num%2==0)
					num=num/2;
					else 
						num=(3*num)+1;
			end
		$write("%d",num);
	end
endmodule	

/*
===================================================================================================================
                                      WHAT IS THE COLLATZ SEQUENCE? (3n + 1)
===================================================================================================================

  1. DEFINITION & TWO RULES
  -----------------------------------------------------------------------------------------------------------------
     - The Collatz sequence (also known as the 3n + 1 problem) starts with any positive integer `n`
       and repeatedly applies two rules until it reaches `1`:

         * Rule 1 (If `n` is EVEN) : n = n / 2
         * Rule 2 (If `n` is ODD)  : n = (3 * n) + 1

  2. STEP-BY-STEP TRACE EXAMPLE (Starting with n = 6)
  -----------------------------------------------------------------------------------------------------------------
     +------+-------------+----------+--------------------------+-------------+
     | Step | Current `n` | Parity   | Operation Applied        | Next `n`    |
     +------+-------------+----------+--------------------------+-------------+
     |  0   |      6      |   --     | Starting Seed            |      6      |
     |  1   |      6      |   EVEN   | 6 / 2                    |      3      |
     |  2   |      3      |   ODD    | (3 * 3) + 1              |     10      |
     |  3   |     10      |   EVEN   | 10 / 2                   |      5      |
     |  4   |      5      |   ODD    | (3 * 5) + 1              |     16      |
     |  5   |     16      |   EVEN   | 16 / 2                   |      8      |
     |  6   |      8      |   EVEN   | 8 / 2                    |      4      |
     |  7   |      4      |   EVEN   | 4 / 2                    |      2      |
     |  8   |      2      |   EVEN   | 2 / 2                    |      1      |
     +------+-------------+----------+--------------------------+-------------+

     - Full Sequence for 6 : 6 -> 3 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1 (Total = 8 steps)

  3. WHY IT IS FAMOUS
  -----------------------------------------------------------------------------------------------------------------
     - Every positive integer tested so far eventually falls into the `4 -> 2 -> 1` loop,
       though it remains an unsolved mathematical conjecture for all numbers up to infinity.

===================================================================================================================
*/
