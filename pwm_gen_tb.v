module pwm_gen_tb;
    reg clk, reset;
    reg [7:0] duty;
    wire pwm_out;

    pwm_gen uut (clk, reset, duty, pwm_out);
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; duty = 0;
        #10 reset = 0;
        duty = 8'd25; #2000; // 10% Duty Cycle (25/255)
        duty = 8'd127; #2000; // 50% Duty Cycle
        duty = 8'd230; #2000; // 90% Duty Cycle
        $finish;
    end
endmodule
