module arithmetic;

  int a=396;
  int b=45;
  int out[5];
  
  initial begin 
    out[0]=a+b; 
    out[1]=a-b; 
    out[2]=a/b; 
    out[3]=a%b; 
    out[4]=a**b; 
    
    $display("____________________________________");
    $display("        ARITHMETIC OPERATORS      ");
    $display("____________________________________\n");
    $display("Addition   : %0d + %0d = %0d",a,b,out[0]);
    $display("Subtraction: %0d - %0d = %0d",a,b,out[1]);
    $display("Multiply   : %0d x %0d = %0d",a,b,out[2]);
    $display("Divide     : %0d / %0d = %0d",a,b,out[3]);
    $display("Exponent   : %0d ^ %0d = %0d",a,b,out[4]);
    
  end

endmodule
/*
____________________________________
       ARITHMETIC OPERATORS      
____________________________________

Addition   : 396 + 45 = 441
Subtraction: 396 - 45 = 351
Multiply   : 396 x 45 = 8
Divide     : 396 / 45 = 36
Exponent   : 396 ^ 45 = 0*/

