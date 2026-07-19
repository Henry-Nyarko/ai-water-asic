module sensor_interface (

    input wire clk,
    input wire rst,

    input wire [7:0] lead_sensor,
    input wire [7:0] arsenic_sensor,
    input wire [7:0] cadmium_sensor,
    input wire [7:0] chromium_sensor,
    input wire [7:0] mercury_sensor,

    output reg [7:0] lead_data,
    output reg [7:0] arsenic_data,
    output reg [7:0] cadmium_data,
    output reg [7:0] chromium_data,
    output reg [7:0] mercury_data

);

always @(posedge clk or posedge rst) begin

    if (rst) begin

        lead_data      <= 8'd0;
        arsenic_data   <= 8'd0;
        cadmium_data   <= 8'd0;
        chromium_data  <= 8'd0;
        mercury_data   <= 8'd0;

    end
    else begin

        lead_data      <= lead_sensor;
        arsenic_data   <= arsenic_sensor;
        cadmium_data   <= cadmium_sensor;
        chromium_data  <= chromium_sensor;
        mercury_data   <= mercury_sensor;

    end

end

endmodule
