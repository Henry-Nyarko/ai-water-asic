module preprocessing(

    input wire clk,
    input wire rst,

    input wire [7:0] lead_in,
    input wire [7:0] arsenic_in,
    input wire [7:0] cadmium_in,
    input wire [7:0] chromium_in,
    input wire [7:0] mercury_in,

    output reg [7:0] lead_norm,
    output reg [7:0] arsenic_norm,
    output reg [7:0] cadmium_norm,
    output reg [7:0] chromium_norm,
    output reg [7:0] mercury_norm

);

always @(posedge clk or posedge rst) begin

    if (rst) begin
        lead_norm <= 8'd0;
        arsenic_norm <= 8'd0;
        cadmium_norm <= 8'd0;
        chromium_norm <= 8'd0;
        mercury_norm <= 8'd0;
    end
    else begin
        // Placeholder normalization (identity mapping)
        lead_norm <= lead_in;
        arsenic_norm <= arsenic_in;
        cadmium_norm <= cadmium_in;
        chromium_norm <= chromium_in;
        mercury_norm <= mercury_in;
    end

end

endmodule
