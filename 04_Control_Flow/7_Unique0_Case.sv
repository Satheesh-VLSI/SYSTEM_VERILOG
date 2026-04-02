
module unique0_case;
  integer a;
  
  function void op(integer a);
    $display("\ninput a = %0d",a);
       unique0 case(1)
         (a==0): $display("input is zero");
         (a>0) : $display("input is positive");
         (a>100) : $display("input is greater than 100");
         (a<0) : $display("input is negative");
         (a<-100) : $display("input is smaller than -100");
    endcase
    
    $display("\n--------------------------");
  endfunction
  
  initial begin 
    
    $display("\n--------------------------");
    $display("        UNIQUE0 CASE");
    
    $display("--------------------------");
     a=5;
    op(a);
    
    a=-200;
    op(a);
    
    a=99;
    op(a);
    
    a=0;
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
        UNIQUE0 CASE
--------------------------

input a = 5
input is positive

--------------------------

input a = -200
input is negative

Warning-[RT-MTOCMU0CS] More than one condition matches in statement
testbench.sv, 100
  Unique0 case statement inside unique0_case.op matches more than one 
  condition at time 0ns.
  
  Line numbers 104 and 105 match.


--------------------------

input a = 99
input is positive

--------------------------

input a = 0
input is zero

--------------------------

input a = 1000
input is positive

Warning-[RT-MTOCMU0CS] More than one condition matches in statement
testbench.sv, 100
  Unique0 case statement inside unique0_case.op matches more than one 
  condition at time 0ns.
  
  Line numbers 102 and 103 match.


--------------------------

input a = -20
input is negative

--------------------------

input a = x

--------------------------

input a = z

--------------------------
*/
