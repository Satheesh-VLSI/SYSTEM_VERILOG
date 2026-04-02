
module unique0_if_else;
  integer a;
  
  function void op(integer a);
    $display("\ninput a = %0d",a);
    unique0 if(a==0)
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
    $display("         Unique0 if");
    
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
         Unique0 if
--------------------------

input a = 5
input is positive

--------------------------

input a = -200
input is negative

Warning-[RT-MTOCMU0IF] More than one condition match in statement
testbench.sv, 104
  Unique0 if statement inside unique0_if_else.op matches more than one 
  condition at time 0ns.
  
  Line number 110 and 112 match.


--------------------------

input a = 100
input is positive

--------------------------

input a = 1000
input is positive

Warning-[RT-MTOCMU0IF] More than one condition match in statement
testbench.sv, 104
  Unique0 if statement inside unique0_if_else.op matches more than one 
  condition at time 0ns.
  
  Line number 106 and 108 match.


--------------------------

input a = -20
input is negative

--------------------------

input a = x

--------------------------

input a = z

--------------------------
*/

