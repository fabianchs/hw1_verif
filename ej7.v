/*
Tarea 1: 
Fabian Chacon Solano - 2018135154
Ejercicio 7: Reg de desplazamiento a la derecha de 32 bits con una señal de entrada shift?in
Instituto Tecnologico de Costa Rica
*/

module shift_der32_en (
    input  wire        clk,
    input  wire        reset,      // reset asincrónico activo en alto
    input  wire        enable,
    input  wire        shift_in,
    output reg  [31:0] q
);

always @(negedge clk or posedge reset) begin
    if (reset)
        q <= 32'b0;
    else if (enable)
        q <= {shift_in, q[31:1]}; // el bit más significativo recibe shift in, desplazamiento a la derecha, es una concatenación, se descarta el menos significativo
    // else: mantiene valor
end

endmodule