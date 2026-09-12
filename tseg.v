`timescale 1ns / 1ps


module anseg(seg, bcd);
output reg [6:0]seg;
input [3:0]bcd;

    parameter ZERO   = 7'b100_0000;
    parameter ONE    = 7'b111_1001;
    parameter TWO    = 7'b010_0100;
    parameter THREE  = 7'b011_0000;
    parameter FOUR   = 7'b001_1001;
    parameter FIVE   = 7'b001_0010;
    parameter SIX    = 7'b000_0010;
    parameter SEVEN  = 7'b111_1000;
    parameter EIGHT  = 7'b000_0000;
    parameter NINE   = 7'b001_0000;
    parameter A = 7'b000_1000;
    parameter B = 7'b000_0011;
    parameter C = 7'b100_0110;
    parameter D = 7'b010_0001;
    parameter E =  7'b000_0110;
    parameter F = 7'b000_1110;
    
    always @(*) begin 
    

     case(bcd)
       4'h0: seg = ZERO;
       4'h1: seg = ONE;
       4'h2: seg = TWO;
       4'h3: seg = THREE;
       4'h4: seg = FOUR;
       4'h5: seg = FIVE;
       4'h6: seg = SIX;
       4'h7: seg = SEVEN;
       4'h8: seg = EIGHT;
       4'h9: seg = NINE;
       4'hA: seg = A;
       4'hB: seg = B;
       4'hC: seg = C;
       4'hD: seg = D;
       4'hE: seg = E;
       4'hF: seg = F;
       default: seg = 7'b111_1111;

  endcase
    end
      


endmodule
