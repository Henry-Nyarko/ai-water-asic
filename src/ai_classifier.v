module ai_classifier(

    input wire clk,
    input wire rst,

    input wire [7:0] lead,
    input wire [7:0] arsenic,
    input wire [7:0] cadmium,
    input wire [7:0] chromium,
    input wire [7:0] mercury,

    output reg contamination

);

parameter signed W_LEAD      = 30;
parameter signed W_ARSENIC   = 25;
parameter signed W_CADMIUM   = 15;
parameter signed W_CHROMIUM  = 20;
parameter signed W_MERCURY   = 10;

parameter signed THRESHOLD = 12000;

reg signed [31:0] score;

always @(posedge clk or posedge rst) begin

    if(rst) begin

        score <= 0;
        contamination <= 0;

    end

    else begin

        score <=
            lead      * W_LEAD +
            arsenic   * W_ARSENIC +
            cadmium   * W_CADMIUM +
            chromium  * W_CHROMIUM +
            mercury   * W_MERCURY;

        if(score > THRESHOLD)
            contamination <= 1'b1;
        else
            contamination <= 1'b0;

    end

end

endmodule