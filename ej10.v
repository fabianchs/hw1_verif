/*
Tarea 1: 
Fabian Chacon Solano - 2018135154
Ejercicio 9: Reg universal de 32 bits
Instituto Tecnologico de Costa Rica
*/

module universal_reg32 (
    input  wire        clk,
    input  wire        reset,        // reset asincrónico activo en alto
    input  wire        enable,
    input  wire [1:0]  mode,
    input  wire        shift_in,
    input  wire [31:0] parallel_in,
    output reg  [31:0] q
);

always @(negedge clk or posedge reset) begin
    if (reset)
        q <= 32'b0;
    else if (enable) begin
        case (mode)
            2'b00: q <= q;                                // mantener
            2'b01: q <= {shift_in, q[31:1]};              // shift derecha
            2'b10: q <= {q[30:0], shift_in};              // shift izquierda
            2'b11: q <= parallel_in;                      // carga paralela
            default: q <= q;
        endcase
    end
end

endmodule