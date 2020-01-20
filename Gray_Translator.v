/**
    Author: Phan Gia Anh
    Updated: 19/1/2020

    Gray_Translator translate a vector into its gray-code form
    The size of the vector can be specified through parameter SIZE
**/

module Gray_Translator( i_VECTOR_IN, o_VECTOR_GRAY_OUT );

    parameter   SIZE = 4;

    input   [SIZE - 1 : 0]  i_VECTOR_IN;

    output  [SIZE - 1 : 0]  o_VECTOR_GRAY_OUT;

    wire    [SIZE - 2 : 0]  temp_result;
    
    assign  temp_result = i_VECTOR_IN[SIZE - 1 : 1] ^ i_VECTOR_IN[SIZE - 2 : 0];
    assign  o_VECTOR_GRAY_OUT = {i_VECTOR_IN[SIZE - 1], temp_result};

endmodule