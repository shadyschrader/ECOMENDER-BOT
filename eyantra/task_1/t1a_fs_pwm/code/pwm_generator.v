// EcoMender Bot : Task 1A : PWM Generator
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design a module which will scale down the 1MHz Clock Frequency to 500Hz and perform Pulse Width Modulation on it.

Recommended Quartus Version : 20.1
The submitted project file must be 20.1 compatible as the evaluation will be done on Quartus Prime Lite 20.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

//PWM Generator
//Inputs : clk_1MHz, pulse_width
//Output : clk_500Hz, pwm_signal

module pwm_generator(
    input clk_1MHz,
    input [3:0] pulse_width,
    output reg clk_500Hz, pwm_signal
);

initial begin
    clk_500Hz = 1; pwm_signal = 1;
end

//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE//////////////////

//frequency scaling logic
reg[10:0] counter = 11'd0;

always @ (posedge clk_1MHz) begin
   if(counter == 1000)begin
	  clk_500Hz <= ~clk_500Hz;
	  counter <= 10'b1;
	end
	else begin
	  counter <= counter + 1;
	end	
end



//pwm logic
reg[6:0]   duty_cycle;
reg[10:0]  pwm_counter = 0;


always@(*) begin
   case (pulse_width)
        4'd8  : duty_cycle = 40;
        4'd11 : duty_cycle = 55;
        4'd4  : duty_cycle = 20;
        4'd12 : duty_cycle = 60;
        4'd5  : duty_cycle = 25;
        4'd9  : duty_cycle = 45;
        4'd13 : duty_cycle = 65;
        default: duty_cycle = 0; 
    endcase
end


always@(posedge clk_1MHz)begin
   if(pwm_counter == 1999)begin
      pwm_counter <= 0;
   end
   else begin
      pwm_counter <= pwm_counter + 1;
   end	
	
	if (pwm_counter < duty_cycle*20) begin
	    pwm_signal <= 1;
	end
	else begin
	    pwm_signal <= 0;
	end
end



//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////

endmodule
