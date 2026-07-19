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

parameter signed W_LEAD      = 536;
parameter signed W_ARSENIC   = 446;
parameter signed W_CADMIUM   = 266;
parameter signed W_CHROMIUM  = 357;
parameter signed W_MERCURY   = 178;
parameter signed BIAS        = -213817;

reg signed [31:0] score;

always @(posedge clk or posedge rst) begin

    if (rst) begin
        score <= 32'sd0;
        contamination <= 1'b0;
    end
    else begin

        score <=
            lead      * W_LEAD +
            arsenic   * W_ARSENIC +
            cadmium   * W_CADMIUM +
            chromium  * W_CHROMIUM +
            mercury   * W_MERCURY +
            BIAS;

        contamination <= (score >= 0);

    end

end

endmodule
