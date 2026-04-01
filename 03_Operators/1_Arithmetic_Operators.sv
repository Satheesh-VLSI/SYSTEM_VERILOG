module arithmetic;

  int a=396;
  int b=45;
  int out[6];
  
  initial begin 
    out[0]=a+b; 
    out[1]=a-b; 
    out[2]=a/b; 
    out[3]=a%b; 
    out[4]=a**b; 
    
    $display("-----------------------------------");
    $display("        ARITHMETIC OPERATORS      ");
    $display("-----------------------------------\n");
    $display("Addition   : %0d + %0d = %0d",a,b,out[0]);
    $display("Subtraction: %0d - %0d = %0d",a,b,out[1]);
    $display("Multiply   : %0d x %0d = %0d",a,b,out[2]);
    $display("Divide     : %0d / %0d = %0d",a,b,out[3]);
    $display("Divide     : %0d mod %0d = %0d",a,b,out[4]);
    $display("Exponent   : %0d ^ %0d = %0d",a,b,out[5]);
    
  end

endmodule
/*-----------------------------------
        ARITHMETIC OPERATORS      
-----------------------------------

Addition   : 396 + 45 = 441
Subtraction: 396 - 45 = 351
Multiply   : 396 x 45 = 8
Divide     : 396 / 45 = 36
Divide     : 396 mod 45 = 0
Exponent   : 396 ^ 45 = 0
*/




