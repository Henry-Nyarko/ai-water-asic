module preprocessing (
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

// Simple normalization (identity scaling for now)
always @(posedge clk or posedge rst) begin

    if (rst) begin
        lead_norm     <= 8'd0;
        arsenic_norm  <= 8'd0;
        cadmium_norm  <= 8'd0;
        chromium_norm <= 8'd0;
        mercury_norm  <= 8'd0;
    end
    else begin
        // In real ASIC: scaling / filtering would happen here
        lead_norm     <= lead_in;
        arsenic_norm  <= arsenic_in;
        cadmium_norm  <= cadmium_in;
        chromium_norm <= chromium_in;
        mercury_norm  <= mercury_in;
    end

end

endmodule
module feature_extractor(

    input wire clk,
    input wire rst,

    input wire [7:0] lead,
    input wire [7:0] arsenic,
    input wire [7:0] cadmium,
    input wire [7:0] chromium,
    input wire [7:0] mercury,

    output reg [9:0] average,
    output reg [10:0] total,
    output reg [7:0] maximum

);

reg [10:0] sum;

always @(posedge clk or posedge rst) begin

    if (rst) begin

        sum <= 11'd0;
        total <= 11'd0;
        average <= 10'd0;
        maximum <= 8'd0;

    end
    else begin

        sum = lead + arsenic + cadmium + chromium + mercury;

        total <= sum;

        average <= sum / 5;

        maximum <= lead;

        if (arsenic > maximum)
            maximum <= arsenic;

        if (cadmium > maximum)
            maximum <= cadmium;

        if (chromium > maximum)
            maximum <= chromium;

        if (mercury > maximum)
            maximum <= mercury;

    end

end

endmodule