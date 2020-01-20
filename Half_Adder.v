/**
    Author: Phan Gia Anh
    Updated: 15/1/2020

    Half_Adder takes two bits and add them together 
**/

module Half_Adder( i_BIT_ONE, i_BIT_TWO, o_BIT_SUM, o_BIT_CARRY );

    input   i_BIT_ONE, i_BIT_TWO;

    output  o_BIT_SUM, o_BIT_CARRY;

    xor     bit_sum_calculate( o_BIT_SUM, i_BIT_ONE, i_BIT_TWO );
    
    and     bit_carry_calculate( o_BIT_CARRY, i_BIT_ONE, i_BIT_TWO );

endmodule