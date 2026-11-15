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