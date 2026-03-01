/*
Tarea 1: 
Fabian Chacon Solano - 2018135154
Ejercicio 2: Mux de 2 entradas de 32 bits
Instituto Tecnologico de Costa Rica
*/

module mux_2in_32bits (
    input  wire [31:0] in0,
    input  wire [31:0] in1,
    input  wire        sel,
    output reg  [31:0] out
);

always @(*) begin
    case (sel)
        1'b0: out = in0;
        1'b1: out = in1;
        default: out = 32'b0;
    endcase
end

endmodule