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
	