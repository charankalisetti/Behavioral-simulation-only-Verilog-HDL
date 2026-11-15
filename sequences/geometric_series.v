module geometric_series;
integer n=6,starting_term=2,common_ratio=3;

initial
	begin:block
		integer i,series;
		series=starting_term;
		for(i=0;i<6;i=i+1)
			begin 
				$write("%d,",series);
				series=series*3;
			end
	end
endmodule	