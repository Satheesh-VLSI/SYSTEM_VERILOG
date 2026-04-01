
module reduction;

  logic [3:0] a=2;
  initial begin 

    $display("\n-----------------------------------");
    $display("            REDUCTION OPERATORS      ");
    $display("----------------------------------\n");
    $display("Reduction AND  %b  : %b",a,&a);
    $display("Reduction NAND %b  : %b",a,~&a);
    $display("Reduction OR   %b  : %b",a,|a);
    $display("Reduction NOR  %b  : %b",a,~|a);
    $display("Reduction EXOR %b  : %b",a,^a);
    $display("Reduction EX-NOR %b: %b",a,~^a);
    
    
    
    a=6;
    
 
    $display("----------------------------------\n");
    $display("Reduction AND  %b  : %b",a,&a);
    $display("Reduction NAND %b  : %b",a,~&a);
    $display("Reduction OR   %b  : %b",a,|a);
    $display("Reduction NOR  %b  : %b",a,~|a);
    $display("Reduction EXOR %b  : %b",a,^a);
    $display("Reduction EX-NOR %b: %b",a,~^a);
    
    
  end

endmodule/*
-----------------------------------
            REDUCTION OPERATORS      
----------------------------------

Reduction AND  0010  : 0
Reduction NAND 0010  : 1
Reduction OR   0010  : 1
Reduction NOR  0010  : 0
Reduction EXOR 0010  : 1
Reduction EX-NOR 0010: 0
----------------------------------

Reduction AND  0110  : 0
Reduction NAND 0110  : 1
Reduction OR   0110  : 1
Reduction NOR  0110  : 0
Reduction EXOR 0110  : 0
Reduction EX-NOR 0110: 1
*/
