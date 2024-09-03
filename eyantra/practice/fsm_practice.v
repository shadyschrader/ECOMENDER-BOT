module traffic(
   input clk,
	output reg green, yellow, red
);

   parameter DEF=2'b00, GREEN=2'b01, YELLOW=2'b10, RED=2'b11;
	reg[1:0] state = DEF;
	
   always@(posedge clk)begin
      case (state)
           DEF: begin
			     state = GREEN;
				  green =0;
				  yellow=0;
				  red = 0;
			  end
			  
			  GREEN: begin
			     state = YELLOW;
				  green=1;
				  yellow =0;
				  red=0;
			  end
			  
			  YELLOW: begin
			     state = RED;
				  green=0;
				  yellow =1;
				  red=0;
			  end
			  
			  RED: begin
			     state = GREEN;
				  green=0;
				  yellow =0;
				  red=1;
			  end
			  
			  default: state = DEF;
      endcase		
   end	

endmodule