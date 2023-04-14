module top;

	bit clk ;
	always #1 clk=~clk;
	count_if countif(clk);
	count_up_dwn count1(countif.design);					
	count_up_dwn_tb count_t1(countif.test);

	initial begin
		$dumpfile("multi_mode_counter.vcd");
		$dumpvars;
		#700 $finish;
	end

endmodule