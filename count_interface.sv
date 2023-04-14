interface count_if(input bit clk);
    bit clear ,rst, INIT,GAMEOVER ;
	logic [1:0] control;
	logic [3:0] initial_value;
	logic [1:0] WHO;

    modport design (
    input clear ,rst, INIT,control,initial_value,
    output WHO,GAMEOVER
    );

    modport test (
    output clear ,rst, INIT,control,initial_value,
    input WHO,GAMEOVER
    );
endinterface 