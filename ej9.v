/*
Tarea 1: 
Fabian Chacon Solano - 2018135154
Ejercicio 9: Reg de desplazamiento a la izquierda de 32 bits
Instituto Tecnologico de Costa Rica
*/

module shift_izq32 (
    input  wire        clk,
    input  wire        reset,      // reset asincrónico activo en alto
    input  wire        shift_in,
    output reg  [31:0] q
);

always @(negedge clk or posedge reset) begin
    if (reset)
        q <= 32'b0;
    else
        q <= {q[30:0], shift_in};  // desplazamiento a la izquierda
end

endmodule