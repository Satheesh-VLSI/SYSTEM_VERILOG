
module unique_case;
  integer a;
  
  function void op(integer a);
    $display("\ninput a = %0d",a);
       unique case(1)
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
    $display("        UNIQUE CASE");
    
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
        UNIQUE CASE
--------------------------

input a = 5
input is positive

--------------------------

input a = -200
input is negative

Warning-[RT-MTOCMUCS] More than one condition match in statement
testbench.sv, 50
  More than one condition matches are found in 'unique case' statement inside 
  unique_case.op, at time 0ns.
  
  Line number 54 and 55 are overlapping.


--------------------------

input a = 99
input is positive

--------------------------

input a = 0
input is zero

--------------------------

input a = 1000
input is positive

Warning-[RT-MTOCMUCS] More than one condition match in statement
testbench.sv, 50
  More than one condition matches are found in 'unique case' statement inside 
  unique_case.op, at time 0ns.
  
  Line number 52 and 53 are overlapping.


--------------------------

input a = -20
input is negative

--------------------------

input a = x

Warning-[RT-NCMUCS] No condition matches in statement
testbench.sv, 50
  No condition matches in 'unique case' statement. 'default' specification is 
  missing, inside unique_case.op, at time 0ns.


--------------------------

input a = z

Warning-[RT-NCMUCS] No condition matches in statement
testbench.sv, 50
  No condition matches in 'unique case' statement. 'default' specification is 
  missing, inside unique_case.op, at time 0ns.


--------------------------

*/
