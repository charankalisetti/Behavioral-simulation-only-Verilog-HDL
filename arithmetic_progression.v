module arithmetic_progression;
integer starting_term=2,common_difference=3,n=6;

initial
	begin:block
		integer i,series;
		series=starting_term;
		display("arithmetic_progression")
		for(i=0;i<6;i=i+1)
			begin
				$write("d%,",series);
				series=series+2;
			end
	end			
