
module concatenation_replication;

  logic [3:0] a=4'b0100;
  logic [3:0] b=4'b1100;
  logic [7:0] result;
  logic [59:0] result_R;

  initial begin

    $display("\n-----------------------------------");
    $display("       CONCANTENATION OPERATORS      ");
    $display("----------------------------------\n");

    result={a,b};   // concatenate
    
    $display("a = %b",a);
    $display("b = %b",b);
    $display("Concantenation of %b and %b = %b",a,b,result);
    $display("----------------------------------\n");
    result={a,b};   // concatenate
    a=4'd15;
    b=4'b11;
    $display("a = %b",a);
    $display("b = %b",b);
    $display("Concantenation of %b and %b = %b",a,b,result);
    $display("\n-----------------------------------");
    $display("         REPLICATION OPERATORS      ");
    $display("----------------------------------\n");
    
    a=4'b1101;
    b=4'b1100;
    result_R={a{b}};  

 
    $display("a = %b",a);
    $display("b = %b",b);
    $display("%b times Replication of %b = %b",a,b,result_R);
    
    $display("----------------------------------\n");
    a=4'b0110;
    b=4'b1001;
    result_R={a{b}};   // repeat 'a' 4 times

 
    $display("a = %b",a);
    $display("b = %b",b);
    $display("%b times Replication of %b = %b",a,b,result_R);
  
  end

endmodule
/*

-----------------------------------
       CONCANTENATION OPERATORS      
----------------------------------

a = 0100
b = 1100
Concantenation of 0100 and 1100 = 01001100
----------------------------------

a = 1111
b = 0011
Concantenation of 1111 and 0011 = 01001100

-----------------------------------
         REPLICATION OPERATORS      
----------------------------------

a = 1101
b = 1100
1101 times Replication of 1100 = 000000001100110011001100110011001100110011001100110011001100
----------------------------------

a = 0110
b = 1001
0110 times Replication of 1001 = 000000000000000000000000000000000000100110011001100110011001
*/


