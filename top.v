`timescale 1ns / 1ps


module tmsc( seg,an, clk, num,pb_ip,pb );
    output reg [3:0]an;
    output reg [6:0]seg;
    input [12:0]num;
    input clk,pb_ip,pb;
    
    parameter An0 = 4'b0111, An1 = 4'b1110, An2 = 4'b1101, An3 = 4'b1011;
    parameter delay = 100_000;
    wire [27:0]segop;
    wire pb_out;
    pb kp(.pb_out(pb_out), .pb(pb), .clk(clk), .pb_ip(pb_ip));
    
    
    reg [16:0]cot;
    reg en;
    always@(posedge clk)
        begin
            if(pb_out) begin cot <= 17'b0; en <= 0; end
            else
                begin
                    if( cot == delay -1)
                        begin
                            cot <= 17'b0;
                            en <= 1;
                        end
                    else
                        begin
                            cot <= cot + 1;
                            en <= 0;
                        end
                end
        end
        
    nutseg pu(.seg(segop), .num(num));
    
    always@(posedge clk)
        begin
            if( pb_out) begin an <= An0; seg <= 7'b111_1111; end
            else if(en)
                begin
                    case(an)
                        An0: begin  an <= An1; seg <= segop[6:0]; end
                        An1: begin  an <= An2; seg <= segop[13:7]; end
                        An2: begin  an <= An3; seg <= segop[20:14]; end
                        An3: begin  an <= An0; seg <= segop[27:21]; end
                        default: begin an <= An0; seg<= 7'b111_1111; end
                    endcase
                end
        end
              
                                    
                
    
    
    
endmodule
