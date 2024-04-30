`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/30 16:37:14
// Design Name: 
// Module Name: LED_STREAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LED_STREAM(
    output reg [3:0] LED, // LED4 to LED1, 1 on, 0 off
    input CLK,            // FPGA PL clock, 50 MHz
    input RST_N           // FPGA reset pin
    );

reg [31:0] CNT;
reg [1:0] LED_ON_NUMBER;

//clock input 50000000
parameter CLOCK_FREQ =50000000;
parameter COUNTER_MAX_CNT=CLOCK_FREQ/2-1;//change time 0.5s

always @(posedge CLK, negedge RST_N) begin
    if(!RST_N)begin
        CNT <= 32'D0;
        LED_ON_NUMBER <= 2'd0;
    end
    else begin
        CNT <= CNT + 1'b1;
        if(CNT == COUNTER_MAX_CNT) begin
            CNT <= 32'd0;
            LED_ON_NUMBER <= LED_ON_NUMBER + 1'b1;
        end
    end
end    
    
always @(LED_ON_NUMBER) begin
	case(LED_ON_NUMBER)
		0: LED <= 4'b0001;
		1: LED <= 4'b0010;
		2: LED <= 4'b0100;
		3: LED <= 4'b1000;
		ｄｅｆａｕｌｔ： ＬＥＤ ＜＝ ４’ｂ０００；
	endcase
end
endmodule
