// Verilog code for Full Adder
// Define Full Adder module
module full_adder (
    input a, b, c_in, // Define input ports a, b and c_in
    output sum , c_out // Define output ports sum and c_out
);

assign sum =   a?(b?(c_in?1:0):(c_in?0:1)):(b?(c_in?0:1):(c_in?1:0));       
assign c_out = a?(b?(c_in?1:1):(c_in?1:0)):(b?(c_in?1:0):(c_in?0:0)); 

endmodule
