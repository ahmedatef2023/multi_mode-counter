module count_up_dwn(count_if countif);
					
logic [3:0] count,cnt_loser , cnt_winner;
logic WINNER,LOSER;

always @(posedge countif.rst) begin
	if(countif.rst)  
		count <= 0;
end

always @(posedge countif.clk) begin
	
		if(countif.clear)  
			count <= 0;
		else if(countif.INIT)
			count <= countif.initial_value;
		else if(!countif.rst) begin

				case(countif.control)  
					2'b01   : count <= count +2;       // Count up by 2’s 
					2'b10   : count <= count -1;      // Count down by 1’s 
					2'b11   : count <= count -2;      // Count down by 2’s  
					default : count <= count +1;      //Count up by 1’s
				endcase  

		end
	
end

assign WINNER = (count == 15) ? 1 : 0;
assign LOSER  = (count == 0) ? 1 : 0; 

always @(WINNER , LOSER , countif.clear) begin
	if(countif.clear) begin 
		cnt_loser <= 0;
		cnt_winner <= 0;
	end 
	else if(WINNER)
		cnt_winner <= cnt_winner + 1;
	else if(LOSER)
		cnt_loser  <= cnt_loser + 1;
end
assign countif.GAMEOVER=((cnt_winner==15)||(cnt_loser==15)) ? 1 : 0;
assign countif.WHO = (cnt_winner == 15) ? 2'b10 : (cnt_loser == 15) ? 2'b01 : 2'b00;

always @(posedge countif.clk) begin
	if(countif.GAMEOVER) begin
		count<=0;
		cnt_loser<=0;
		cnt_winner<=0;
	end
		
end


endmodule 