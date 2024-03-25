`timescale 1ns / 1ps
module dff(
    input clk,
    input d,
    output reg q,
    input rstn
    );
    
  
    
    always @(posedge clk)
    begin
    
    if (rstn)
    q <= 0;
    else
    q <= d;
    end

endmodule

module clock_div(
input clk,
output reg [24:0] out
);

reg [24:0] count;
always @(posedge clk) begin
count <= count + 1;
out <= count[24];
end

endmodule


module shift_reg (
input [3:0] btn,
input CLK12MHZ,
output [3:0] led,
output led0_r
);


wire [3:0] q_net;
wire myCLK;
assign led = q_net;
assign led0_r = myCLK;

clock_div c0 (.clk(CLK12MHZ),.out(myCLK));
dff u0 (.d(btn[0]),.clk(myCLK),.rstn(btn[1]),.q(q_net[0]));
dff u1 (.d(q_net[0]),.clk(myCLK),.rstn(btn[1]),.q(q_net[1]));
dff u2 (.d(q_net[1]),.clk(myCLK),.rstn(btn[1]),.q(q_net[2]));
dff u3 (.d(q_net[2]),.clk(myCLK),.rstn(btn[1]),.q(q_net[3]));


endmodule
