`timescale 1ns / 1ps

module nutseg( seg, num );
output [27:0]seg;
input [13:0]num;
wire [15:0]hex;

wire [3:0]bcdin[3:0];
wire [6:0]segop[3:0];

assign hex = {3'b0,num};


assign bcdin[0] = hex[3:0];
assign bcdin[1] = hex[7:4];
assign bcdin[2] = hex[11:8];
assign bcdin[3] = hex[15:12];


genvar i;
generate
    for( i = 0; i<4; i = i+1)
        begin: hea
            anseg ven( .seg(segop[i]), .bcd(bcdin[i]));
        end
endgenerate


assign seg[6:0]   = segop[0];
assign seg[13:7]  = segop[1];
assign seg[20:14] = segop[2];
assign seg[27:21] = segop[3];



endmodule
