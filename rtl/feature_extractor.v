module feature_extractor(

    input wire clk,
    input wire rst,

    input wire [7:0] lead,
    input wire [7:0] arsenic,
    input wire [7:0] cadmium,
    input wire [7:0] chromium,
    input wire [7:0] mercury,

    output reg [10:0] total,
    output reg [9:0] average,
    output reg [7:0] maximum

);

wire [10:0] sum;

assign sum = lead + arsenic + cadmium + chromium + mercury;

always @(posedge clk or posedge rst) begin

    if (rst) begin
        total   <= 11'd0;
        average <= 10'd0;
        maximum <= 8'd0;
    end
    else begin
        total   <= sum;
        average <= sum / 5;

        if ((lead >= arsenic) &&
            (lead >= cadmium) &&
            (lead >= chromium) &&
            (lead >= mercury))
            maximum <= lead;
        else if ((arsenic >= cadmium) &&
                 (arsenic >= chromium) &&
                 (arsenic >= mercury))
            maximum <= arsenic;
        else if ((cadmium >= chromium) &&
                 (cadmium >= mercury))
            maximum <= cadmium;
        else if (chromium >= mercury)
            maximum <= chromium;
        else
            maximum <= mercury;
    end

end

endmodule
