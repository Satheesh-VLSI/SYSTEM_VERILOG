
module logical;

  int a=2;
  int b=4;
  
  initial begin 

    $display("\n-----------------------------------");
    $display("          LOGICAL OPERATORS      ");
    $display("----------------------------------\n");
    $display("%0d AND %0d: %0d",a,b,a&&b);
    $display("%0d OR %0d : %0d",a,b,a||b);
    $display("NOT %0d :%0d",a,!a);
    
     a=0;
     b=4;
    $display("----------------------------------\n");
    $display("%0d AND %0d: %0d",a,b,a&&b);
    $display("%0d OR %0d : %0d",a,b,a||b);
    $display("NOT %0d :%0d",a,!a);
    
    
  end

endmodule

/*
-----------------------------------
        LOGICAL OPERATORS      
----------------------------------

2 AND 4: 1
2 OR 4 : 1
NOT 2 :0
----------------------------------

0 AND 4: 0
0 OR 4 : 1
NOT 0 :1

*/

