module factorial;
integer fact;	
	
initial
	begin:block	
		integer i;
		fact=1;
		for(i=1;i<=5;i=i+1)
			begin
				fact=fact*i;
			end
		$display("factorial_of 5=%d",fact);
	end
endmodule
	