module tribonacci;
integer a,b,c,next;

initial
	begin:block
		integer i;
		a=0;
		b=1;
		c=1;
		for(i=0;i<10;i=i+1)
			begin
				next=a+b+c;
				a=b;
				b=c;
				c=next;
				$write("%d,",next);
			end
	end
endmodule	