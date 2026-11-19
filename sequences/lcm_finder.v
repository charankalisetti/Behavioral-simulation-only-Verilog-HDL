// ============================================================================
// Module Name: lcm_finder
// Description: Computes the LCM of two integers (a, b) by starting at `max`
//              (the larger of the two inputs) and stepping by +max until both
//              numbers divide `lcm` with remainder 0.
// ============================================================================

module lcm_finder;

    integer a, b;
    integer max, lcm;

    initial begin
        a = 3;
        b = 7;

        // Handle zero edge case: LCM(a, 0) = 0
        if (a == 0 || b == 0) begin
            lcm = 0;
        end else begin
            // Start at the greater number between a and b
            max = (a > b) ? a : b;
            lcm = max;

            // Keep adding `max` until `lcm` is evenly divisible by both `a` and `b`
            while ((lcm % a != 0) || (lcm % b != 0)) begin
                lcm = lcm + max;
            end
        end

        $display("LCM of %0d and %0d = %0d", a, b, lcm);
    end

endmodule