reg [1:0] buf_idx;
reg [9:0] idx;


FIRST_LINE: begin 
	if ( buf_idx==2'b10)
	begin
		buff1[idx]  <= data_in[3:0];
		address     <= address + 1; 
		buf_idx     <= 2'b00;
	end
	else if( buf_idx==2'b01 )
	begin
		buff1[idx]   <= data_in[7:4];
		buf_idx      <= 2'b10;
	end
	else
	begin
		buff1[idx]   <= data_in[11:8];
		buf_idx      <= 2'b01;
	end
	
	if( idx == 641 )
	begin
		state <= SECOND_LINE;
		idx   <= 0;
	end
	else
	begin
		idx  <= idx  + 1;
	end