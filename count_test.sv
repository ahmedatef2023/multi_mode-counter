module count_up_dwn_tb (count_if countif);

initial begin
	
	countif.rst <= 1;
	countif.clear <= 1;
	#1
	countif.clear <= 0;
	countif.control = 2'b00;
	#2
	countif.rst <= 0;
	countif.INIT <= 0;
	#2
	countif.INIT = 1;
	countif.initial_value = 4'b1001;
	#3
	countif.INIT = 0;
	#15;
	countif.control = 2'b01;
	#15
	countif.control = 2'b10;
	#15
	countif.control = 2'b11;
	#260
	countif.control = 2'b01;
	countif.rst=1;
	#2
	countif.rst=0;
	#2
	countif.clear = 1;
	#2
	countif.clear = 0;
	countif.INIT = 1;
	countif.initial_value = 4'b1110;
	#2;
	countif.control = 2'b11;
	countif.INIT = 0;
	#250;
	countif.clear = 1;
	countif.clear = 0;
	
end


endmodule 