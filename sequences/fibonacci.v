module fibonacci;
integer a,b,next;

initial 
	begin:block
		integer i;
		a=0;
		b=1;
		for(i=0;i<10;i=i+1)
			begin
				next=a+b;
				a=b;
				b=next;
				$write("%d,",next);
			end
	end	
endmodule
	/*
===================================================================================================================
                         FIBONACCI SEQUENCE: DEFAULT VALUES & VARIABLE SHIFT VISUAL GUIDE
===================================================================================================================

1. SEQUENCE & SLIDING POINTERS (a, b, c)
-------------------------------------------------------------------------------------------------------------------
   Default Values : a = 0, b = 1  (The first two seed numbers of the Fibonacci sequence)
   Sequence       : 0, 1, 1, 2, 3, ...

   How the window [ a,  b ] -> c slides forward across the sequence:

     Initial Seed :   [  0  ,  1  ]  -->  c = 0 + 1 = 1
                         a     b

     Next Shift   :      0  , [  1  ,  1  ]  -->  c = 1 + 1 = 2
                                 a     b

     Next Shift   :      0  ,    1  , [  1  ,  2  ]  -->  c = 1 + 2 = 3
                                         a     b


2. STEP-BY-STEP DIAGONAL SHIFT DIAGRAM (MATCHING YOUR HANDWRITTEN TRACE)
-------------------------------------------------------------------------------------------------------------------
   In every loop iteration:
     1) Compute next term  :  c = a + b
     2) Shift `b` into `a` :  a = b      (diagonal arrow down-left)
     3) Shift `c` into `b` :  b = c      (diagonal arrow down-left)


        a  +  b  =  c
       ---------------

        0  +  1  =  1          <-- Step 1: Start with default values (a = 0, b = 1) -> c = 1
             /     /
            /     /            <-- Diagonal Shift: old `b` becomes new `a`, old `c` becomes new `b`
           v     v
		   1  +  1  =  2          <-- Step 2: Now (a = 1, b = 1) -> c = 2
             /     /
            /     /            <-- Diagonal Shift: old `b` becomes new `a`, old `c` becomes new `b`
           v     v
           1  +  2  =  3          <-- Step 3: Now (a = 1, b = 2) -> c = 3


*/
