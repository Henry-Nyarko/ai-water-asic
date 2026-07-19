`timescale 1ns/1ps

module tb_water_chip_ai;

reg clk;
reg rst;

reg [7:0] lead_sensor;
reg [7:0] arsenic_sensor;
reg [7:0] cadmium_sensor;
reg [7:0] chromium_sensor;
reg [7:0] mercury_sensor;

wire contamination_alarm;

// Device Under Test
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

// Clock
always #5 clk = ~clk;

initial begin

    $dumpfile("water_chip_ai.vcd");
    $dumpvars(0, tb_water_chip_ai);

    clk = 0;
    rst = 1;

    lead_sensor = 0;
    arsenic_sensor = 0;
    cadmium_sensor = 0;
    chromium_sensor = 0;
    mercury_sensor = 0;

    #20;
    rst = 0;

    // Safe water
    lead_sensor = 10;
    arsenic_sensor = 8;
    cadmium_sensor = 5;
    chromium_sensor = 7;
    mercury_sensor = 6;

    #50;

    // Contaminated water
    lead_sensor = 180;
    arsenic_sensor = 150;
    cadmium_sensor = 120;
    chromium_sensor = 160;
    mercury_sensor = 140;

    #100;

    $finish;

end

endmodule
