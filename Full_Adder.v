/**
    Author: Phan Gia Anh
    Updated: 15/1/2020

    Full_Adder takes two bits and add them together but with an extra bit as input (same as takes three bits and add them together)
**/

module Full_Adder( bit_one, bit_two, bit_in, bit_sum, bit_carry );

    input   bit_one, bit_two, bit_in;

    output  bit_sum, bit_carry;

    wire    temp_result, temp_carry_one, temp_carry_two;

    Half_Adder  first_add(.bit_one(bit_one), .bit_two(bit_two), .bit_sum(temp_result), .bit_carry(temp_carry_one));
    Half_Adder  second_add(.bit_one(temp_result), .bit_two(bit_in), .bit_sum(bit_sum), .bit_carry(temp_carry_two));

    or  carry_calculate(bit_carry, temp_carry_one, temp_carry_two);

endmodule