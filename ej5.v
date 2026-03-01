/*
Tarea 1: 
Fabian Chacon Solano - 2018135154
Ejercicio 5: Reg 32 bits de flanco negativo con reset asincrónico y Enable
Instituto Tecnologico de Costa Rica
*/


module reg32_neg_async_reset_en (
    input  wire        clk,
    input  wire        reset,     // reset asincrónico activo en alto
    input  wire        enable,
    input  wire [31:0] d,
    output reg  [31:0] q
);

always @(negedge clk or posedge reset) begin
    if (reset)
        q <= 32'b0;
    else if (enable)
        q <= d;
    // else: mantiene valor automáticamente
end

endmodule