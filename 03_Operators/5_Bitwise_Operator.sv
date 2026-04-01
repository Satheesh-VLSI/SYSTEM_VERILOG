
module bitwise;

  logic [3:0] a=2;
  logic [3:0]  b=4;
  initial begin 

    $display("\n-----------------------------------");
    $display("            BITWISE OPERATORS      ");
    $display("----------------------------------\n");
    $display("%b Bitwise AND %b   : %b",a,b,a&b);
    $display("%b Bitwise OR %b    : %b",a,b,a|b);
    $display("Bitwise NOT %b      :%b",a,~a); 
    $display("%b Bitwise EXOR %b  :%b",a,b,a^b);
    $display("%b Bitwise EX-NOR %b:%0b",a,b,a^~b);
    
    
    
    a=6;
    a=5;
    
 
    $display("----------------------------------\n");
    $display("%b Bitwise AND %b   : %b",a,b,a&b);
    $display("%b Bitwise OR %b    : %b",a,b,a|b);
    $display("Bitwise NOT %b      :%b",a,~a); 
    $display("%b Bitwise EXOR %b  :%b",a,b,a^b);
    $display("%b Bitwise EX-NOR %b:%0b",a,b,a^~b);
    
    
  end

endmodule

/*
-----------------------------------
            BITWISE OPERATORS      
----------------------------------

0010 Bitwise AND 0100   : 0000
0010 Bitwise OR 0100    : 0110
Bitwise NOT 0010      :1101
0010 Bitwise EXOR 0100  :0110
0010 Bitwise EX-NOR 0100:1001
----------------------------------

0101 Bitwise AND 0100   : 0100
0101 Bitwise OR 0100    : 0101
Bitwise NOT 0101      :1010
0101 Bitwise EXOR 0100  :0001
0101 Bitwise EX-NOR 0100:1110

*/

