
module shift;

  logic signed [4:0] a=6;
  logic signed [4:0]  b=2;
  initial begin 

    $display("\n-----------------------------------");
    $display("            SHIFT OPERATORS      ");
    $display("----------------------------------\n");
    $display("%b left shift(<<) %b              : %b",a,b,a<<b);
    $display("%b right shift(>>) %b             : %b",a,b,a>>b); 
    $display("%b arithmetic left shift(<<<) %b  :%b",a,b,a<<<b);
    $display("%b arithmetic right shift(>>>) %b :%0b",a,b,a>>>b);
    
    
    
    a=-11;
    b=3;
    
    $display("----------------------------------\n");
    $display("%b left shift(<<) %b              : %b",a,b,a<<b);
    $display("%b right shift(>>) %b             : %b",a,b,a>>b); 
    $display("%b arithmetic left shift(<<<) %b  :%b",a,b,a<<<b);
    $display("%b arithmetic right shift(>>>) %b :%0b",a,b,a>>>b);
    
    
  end

endmodule
/*
-----------------------------------
            SHIFT OPERATORS      
----------------------------------

00110 left shift(<<) 00010              : 11000
00110 right shift(>>) 00010             : 00001
00110 arithmetic left shift(<<<) 00010  :11000
00110 arithmetic right shift(>>>) 00010 :1
----------------------------------

10101 left shift(<<) 00011              : 01000
10101 right shift(>>) 00011             : 00010
10101 arithmetic left shift(<<<) 00011  :01000
10101 arithmetic right shift(>>>) 00011 :11110
*/
