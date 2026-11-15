module triangular;
integer tri_num;
 
initial
	begin:block
		integer i;
		for(i=1;i<=10;i=i+1)
			begin
				tri_num=(i*(i+1))/2;
				$display("tri_num[%0d]=%0d",i,tri_num);
			end
	end
endmodule	
		