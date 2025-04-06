`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2025 18:41:40
// Design Name: 
// Module Name: Parking_trial
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


module Parking_trial (
    input [7:0] switches,   // 4 switches as inputs
    output reg [6:0] seg,
    output [3:0] AN    // 7-segment display output (abcdefg)
);
    reg [3:0] car_count; // To count the number of parked cars

    always @(*) begin
        // Count the number of active switches (cars parked)
        car_count = switches[0] + switches[1] + switches[2] + switches[3] + switches[4] + switches[5] + switches[6] + switches[7];

     
        // Display count on 7-segment
        case(car_count)
        4'b0000: seg = 7'b1000000; // 
        4'b0001: seg = 7'b1111001; // 1
        4'b0010: seg = 7'b0100100; // 2
        4'b0011: seg = 7'b0110000; // 3
        4'b0100: seg = 7'b0011001; // 4
        4'b0101: seg = 7'b0010010; // 5
        4'b0110: seg = 7'b0000010; // 6
        4'b0111: seg = 7'b1111000; // 7
        4'b1000: seg = 7'b0000000; // 8
        
        default: seg = 7'b0010000; // Display 9 if above range
        endcase
    end
    
    assign AN = 4'b1110;

endmodule

