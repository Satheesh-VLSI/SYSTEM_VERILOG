module unique_if_else;
  integer a;
  
  function void op(integer a);
    $display("\ninput a = %0d",a);
    unique if(a==0)
      $display("input is zero");
    else  if(a>0)
      $display("input is positive");
    else  if(a>100)
      $display("input is greater than 100");
    else  if(a<0)
      $display("input is negative");
    else  if(a<-100)
      $display("input is lesser than -100");
    
    $display("\n--------------------------");
  endfunction
  
  initial begin 
    
    $display("\n--------------------------");
    $display("         Unique if");
    
    $display("--------------------------");

    a=5;
    op(a);
    
    a=-200;
    op(a);
    
    a=100;
    op(a);
    
    a=1000;
    op(a);
    
    a=-20;
    op(a);
    
    a=32'hx;
    op(a);
    
    a=32'hz;
    op(a);
  end
endmodule

/*
--------------------------
         Unique if
--------------------------

input a = 5
input is positive

--------------------------

input a = -200
input is negative

Warning-[RT-MTOCMUIF] More than one condition match in statement
testbench.sv, 53
  More than one condition matches are found in 'unique if' statement inside 
  unique_if_else.op, at time 0ns.
  
  Line number 59 and 61 are overlapping.


--------------------------

input a = 100
input is positive

--------------------------

input a = 1000
input is positive

Warning-[RT-MTOCMUIF] More than one condition match in statement
testbench.sv, 53
  More than one condition matches are found in 'unique if' statement inside 
  unique_if_else.op, at time 0ns.
  
  Line number 55 and 57 are overlapping.


--------------------------

input a = -20
input is negative

--------------------------

input a = x

Warning-[RT-NCMUIF] No condition matches in statement
testbench.sv, 53
  No condition matches in 'unique if' statement. 'else' statement is missing 
  for the last 'else if' block, inside unique_if_else.op, at time 0ns.


--------------------------

input a = z

Warning-[RT-NCMUIF] No condition matches in statement
testbench.sv, 53
  No condition matches in 'unique if' statement. 'else' statement is missing 
  for the last 'else if' block, inside unique_if_else.op, at time 0ns.


--------------------------
*/

