module water_chip_ai(

    input wire clk,
    input wire rst,

    input wire [7:0] lead_sensor,
    input wire [7:0] arsenic_sensor,
    input wire [7:0] cadmium_sensor,
    input wire [7:0] chromium_sensor,
    input wire [7:0] mercury_sensor,

    output wire contamination_alarm

);

//--------------------------------------------------
// Internal Wires
//--------------------------------------------------

wire [7:0] lead_data;
wire [7:0] arsenic_data;
wire [7:0] cadmium_data;
wire [7:0] chromium_data;
wire [7:0] mercury_data;

wire [7:0] lead_norm;
wire [7:0] arsenic_norm;
wire [7:0] cadmium_norm;
wire [7:0] chromium_norm;
wire [7:0] mercury_norm;

wire [9:0] average;
wire [10:0] total;
wire [7:0] maximum;

wire contamination;

//--------------------------------------------------
// Sensor Interface
//--------------------------------------------------

sensor_interface sensor_if (

    .clk(clk),
    .rst(rst),

    .lead_sensor(lead_sensor),
    .arsenic_sensor(arsenic_sensor),
    .cadmium_sensor(cadmium_sensor),
    .chromium_sensor(chromium_sensor),
    .mercury_sensor(mercury_sensor),

    .lead_data(lead_data),
    .arsenic_data(arsenic_data),
    .cadmium_data(cadmium_data),
    .chromium_data(chromium_data),
    .mercury_data(mercury_data)

);

//--------------------------------------------------
// Preprocessing
//--------------------------------------------------

preprocessing prep (

    .clk(clk),
    .rst(rst),

    .lead_in(lead_data),
    .arsenic_in(arsenic_data),
    .cadmium_in(cadmium_data),
    .chromium_in(chromium_data),
    .mercury_in(mercury_data),

    .lead_norm(lead_norm),
    .arsenic_norm(arsenic_norm),
    .cadmium_norm(cadmium_norm),
    .chromium_norm(chromium_norm),
    .mercury_norm(mercury_norm)

);

//--------------------------------------------------
// Feature Extraction
//--------------------------------------------------

feature_extractor feature (

    .clk(clk),
    .rst(rst),

    .lead(lead_norm),
    .arsenic(arsenic_norm),
    .cadmium(cadmium_norm),
    .chromium(chromium_norm),
    .mercury(mercury_norm),

    .average(average),
    .total(total),
    .maximum(maximum)

);

//--------------------------------------------------
// AI Classifier
//--------------------------------------------------

ai_classifier ai (

    .clk(clk),
    .rst(rst),

    .lead(lead_norm),
    .arsenic(arsenic_norm),
    .cadmium(cadmium_norm),
    .chromium(chromium_norm),
    .mercury(mercury_norm),

    .contamination(contamination)

);

//--------------------------------------------------
// Decision Unit
//--------------------------------------------------

decision_unit decision (

    .contamination(contamination),

    .alarm(contamination_alarm)

);

endmodule