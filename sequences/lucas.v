module lucas;
integer a,b,next;

initial
	begin:block
		integer i;
		a=2;
		b=1;
		for(i=1;i<=10;i=i+1)
			begin
				next=a+b;
				a=b;
				b=next;
				$write("%0d",next);
				if(i<=9)
					$write(",");
			end
	end
endmodule
	
				
		

/*
4. FIBONACCI VS. LUCAS AT A GLANCE
  -----------------------------------------------------------------------------------------------------------------
     +--------------------+---------------------------+---------------------------+
     | Feature            | Fibonacci Sequence        | Lucas Sequence            |
     +--------------------+---------------------------+---------------------------+
     | Starting Values    | 0, 1                      | 2, 1                      |
     | Addition Rule      | Previous two added        | Previous two added        |
     | First 8 Terms      | 0, 1, 1, 2, 3, 5, 8, 13   | 2, 1, 3, 4, 7, 11, 18, 29 |
     +--------------------+---------------------------+---------------------------+


	 */
