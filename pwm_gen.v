module pwm_gen #(
    parameter MAX_COUNT = 255 // 8-bit resolution
)(
    input clk,
    input reset,
    input [7:0] duty_cycle, // 0 to 255
    output reg pwm_out
);
    reg [7:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            pwm_out <= 0;
        end else begin
            if (counter >= MAX_COUNT) 
                counter <= 0;
            else 
                counter <= counter + 1;

            if (counter < duty_cycle)
                pwm_out <= 1;
            else
                pwm_out <= 0;
        end
    end
endmodule
