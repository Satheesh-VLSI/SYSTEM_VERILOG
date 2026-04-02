
module priority_if;
  integer a;
  
  function void op(integer a);
    $display("\ninput a = %0d",a);
    priority if(a==0)
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
    $display("        Priority if");
    
    $display("--------------------------");

    a=5;
    op(a);
    
    a=-200;
    op(a);
    
    a=0;
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
        Priority if
--------------------------

input a = 5
input is positive

--------------------------

input a = -200
input is negative

--------------------------

input a = 0
input is zero

--------------------------

input a = 100
input is positive

--------------------------

input a = 1000
input is positive

--------------------------

input a = -20
input is negative

--------------------------

input a = x

Warning-[RT-NCMPRIF] No condition matches in statement
testbench.sv, 155
  No condition matches in 'priority if' statement. 'else' statement is missing
  for the last 'else if' block, inside priority_if.op, at time 0ns.


--------------------------

input a = z

Warning-[RT-NCMPRIF] No condition matches in statement
testbench.sv, 155
  No condition matches in 'priority if' statement. 'else' statement is missing
  for the last 'else if' block, inside priority_if.op, at time 0ns.


--------------------------
*/



