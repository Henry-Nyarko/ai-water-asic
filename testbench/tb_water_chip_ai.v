`timescale 1ns / 1ps

module tb_water_chip_ai;

// Inputs
reg clk;
reg rst;

reg [7:0] lead_sensor;
reg [7:0] arsenic_sensor;
reg [7:0] cadmium_sensor;
reg [7:0] chromium_sensor;
reg [7:0] mercury_sensor;

// Output
wire contamination_alarm;

// DUT (Device Under Test)
water_chip_ai dut (
    .clk(clk),
    .rst(rst),
    .lead_sensor(lead_sensor),
    .arsenic_sensor(arsenic_sensor),
    .cadmium_sensor(cadmium_sensor),
    .chromium_sensor(chromium_sensor),
    .mercury_sensor(mercury_sensor),
    .contamination_alarm(contamination_alarm)
);

// Clock generation
always #5 clk = ~clk;

// Test sequence
initial begin

    $dumpfile("water_chip_ai.vcd");
    $dumpvars(0, tb_water_chip_ai);

    // Initialize
    clk = 0;
    rst = 1;

    lead_sensor = 0;
    arsenic_sensor = 0;
    cadmium_sensor = 0;
    chromium_sensor = 0;
    mercury_sensor = 0;

    #20;
    rst = 0;

    // CASE 1: Clean water
    #20;
    lead_sensor = 10;
    arsenic_sensor = 5;
    cadmium_sensor = 3;
    chromium_sensor = 8;
    mercury_sensor = 2;

    // CASE 2: Slight contamination
    #40;
    lead_sensor = 60;
    arsenic_sensor = 50;
    cadmium_sensor = 40;
    chromium_sensor = 55;
    mercury_sensor = 30;

    // CASE 3: Dangerous water
    #40;
    lead_sensor = 200;
    arsenic_sensor = 180;
    cadmium_sensor = 170;
    chromium_sensor = 190;
    mercury_sensor = 160;

    // Finish simulation
    #50;
    $finish;

end

endmodule