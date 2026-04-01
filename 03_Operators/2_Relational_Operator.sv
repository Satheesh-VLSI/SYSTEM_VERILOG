module relational;

  int a=396;
  int b=45;
  
  initial begin 

    $display("\n-----------------------------------");
    $display("          RELATIONAL OPERATORS      ");
    $display("----------------------------------\n");
    $display("%0d is greater than(>) %0d: %0d",a,b,a>b);
    $display("%0d is lesser than(<) %0d : %0d",a,b,a<b);
    $display("%0d is greater than or equal(=>) to %0d :%0d",a,b,a>=b);
    $display("%0d is greater than or equal(=>) to %0d :%0d",a,b,a<=b);
    
  end

endmodule
/*
-----------------------------------
          RELATIONAL OPERATORS      
----------------------------------

396 is greater than(>) 45: 1
396 is lesser than(<) 45 : 0
396 is greater than or equal(=>) to 45 :1
396 is greater than or equal(=>) to 45 :0
*/

