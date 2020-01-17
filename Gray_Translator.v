/**
    Author: Phan Gia Anh
    Updated: 16/1/2020

    Gray_Translator translate a vector into its gray-code form
    The size of the vector can be specified through parameter SIZE
**/

module Gray_Translator( vector_in, vector_gray_out );

    parameter   SIZE = 4;

    input   [SIZE - 1 : 0]  vector_in;

    output  [SIZE - 1 : 0]  vector_gray_out;

    wire    [SIZE - 2 : 0]  temp_result;
    
    assign  temp_result = vector_in[SIZE - 1 : 1] ^ vector_in[SIZE - 2 : 0];
    assign  vector_gray_out = {vector_in[SIZE - 1], temp_result};

endmodule