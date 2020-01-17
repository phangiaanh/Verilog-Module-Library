/**
    Author: Phan Gia Anh
    Updated: 15/1/2020

    Half_Adder takes two bits and add them together 
**/

module Half_Adder( bit_one, bit_two, bit_sum, bit_carry );

    input   bit_one, bit_two;

    output  bit_sum, bit_carry;

    xor     bit_sum_calculate( bit_sum, bit_one, bit_two );
    
    and     bit_carry_calculate( bit_carry, bit_one, bit_two );

endmodule