
module ternary;

  int a=10;
  int b=20;
  int max;

  initial begin
    max=(a>b)?a:b;
    $display("\n-----------------------------------");
    $display("        CONDITIONAL OPERATORS      ");
    $display("----------------------------------\n");
    $display("a   = %0d",a);
    $display("b   = %0d",b);
    $display("max = %0d",max);
  end

endmodule

/*
-----------------------------------
        CONDITIONAL OPERATORS      
----------------------------------

a   = 10
b   = 20
max = 20
*/
