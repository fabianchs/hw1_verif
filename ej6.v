sss

module shift_der_32 (
    input  wire        clk,
    input  wire        reset,      // reset asincrónico activo en alto
    input  wire        shift_in,
    output reg  [31:0] q
);

always @(negedge clk or posedge reset) begin
    if (reset)
        q <= 32'b0;
    else// el bit más significativo recibe shift in
        q <= {shift_in, q[31:1]};  // desplazamiento a la derecha, es una concatenación 
end

endmodule