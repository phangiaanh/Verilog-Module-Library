/**
    Author: Phan Gia Anh
    Updated: 19/1/2020

    Full_Adder takes two bits and add them together but with an extra bit as input (same as takes three bits and add them together)
**/

module Full_Adder( i_BIT_ONE, i_BIT_TWO, i_BIT_IN, o_BIT_SUM, o_BIT_CARRY );

    input   i_BIT_ONE, i_BIT_TWO, i_BIT_IN;

    output  o_BIT_SUM, o_BIT_CARRY;

    wire    temp_result, temp_carry_one, temp_carry_two;

    Half_Adder  first_add(.i_BIT_ONE(i_BIT_ONE), .i_BIT_TWO(i_BIT_TWO), .o_BIT_SUM(temp_result), .o_BIT_CARRY(temp_carry_one));
    Half_Adder  second_add(.i_BIT_ONE(temp_result), .i_BIT_TWO(i_BIT_IN), .o_BIT_SUM(o_BIT_SUM), .o_BIT_CARRY(temp_carry_two));

    or  carry_calculate(o_BIT_CARRY, temp_carry_one, temp_carry_two);

endmodule