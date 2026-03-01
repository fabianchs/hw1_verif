/*
Tarea 1: 
Fabian Chacon Solano - 2018135154
Ejercicio 8: Reg de desplazamiento a la derecha de 32 con shift in, enable, y carga paralela
Instituto Tecnologico de Costa Rica
*/

//En este caso se utlizará uin mux y un registro de 32bits

module shift_der32_en_paralelo (
    input  wire        clk,
    input  wire        reset,
    input  wire        enable,
    input  wire        select,        // 1 = carga paralela, 0 = shift
    input  wire        shift_in,
    input  wire [31:0] parallel_in,
    output wire [31:0] q
);

wire [31:0] shift_data;
wire [31:0] mux_out;

// Lógica de desplazamiento
assign shift_data = {shift_in, q[31:1]};

// MUX 2x1 de 32 bits
mux_2in_32bits mux_inst (
    .in0(shift_data),
    .in1(parallel_in),
    .sel(select),
    .out(mux_out)
);

// Registro con enable
reg32_neg_async_reset_en reg_inst (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .d(mux_out),
    .q(q)
);

endmodule