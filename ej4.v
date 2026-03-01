/*
Tarea 1: 
Fabian Chacon Solano - 2018135154
Ejercicio 4: Reg de 32 bits en flanco negativo con reset asincrónico
Instituto Tecnologico de Costa Rica
*/

module reg32_neg_res_async (
    input  wire        clk,
    input  wire        reset,     // reset asincrónico activo en alto
    input  wire [31:0] d,
    output reg  [31:0] q
);

always @(negedge clk or posedge reset) begin //neg edge para flanco negativo, posedge para reset asincrónico
    if (reset)
        q <= 32'b0;
    else
        q <= d;
end

endmodule