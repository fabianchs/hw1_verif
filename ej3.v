/*
Tarea 1: 
Fabian Chacon Solano - 2018135154
Ejercicio 3: Sumador 32 bits con carry in y carry out
Instituto Tecnologico de Costa Rica
*/

module sum_32b_cin_cout (
    input  wire [31:0] a,//a,b son señales de entrada 
    input  wire [31:0] b,
    input  wire        cin,
    output wire [31:0] sum,
    output wire        cout // aquí va el bit más significativo, por ende el overflow
);

wire [32:0] temp_sum;

assign temp_sum = {1'b0, a} + {1'b0, b} + cin;

assign sum  = temp_sum[31:0];
assign cout = temp_sum[32];

endmodule