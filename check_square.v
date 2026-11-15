module check_square;
integer flag,num=26;

initial
	begin:block
		integer i;
		for(i=1;(i*i)<=num;i=i+1)
			begin
				if(i*i==num)
					flag=1;
					else
						flag=0;
			end
			
		if(flag)
			$display("%d is a perfect square",num);
			else
				$display("%d is a not perfect square",num);
	end
endmodule	