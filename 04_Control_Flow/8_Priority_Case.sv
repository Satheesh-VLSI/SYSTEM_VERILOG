
module priority_case;
  integer a;
  
  function void op(integer a);
    $display("\ninput a = %0d",a);
       priority case(1)
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
    $display("       PRIORITY CASE");
    
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
       PRIORITY CASE
--------------------------

input a = 5
input is positive

--------------------------

input a = -200
input is negative

--------------------------

input a = 99
input is positive

--------------------------

input a = 0
input is zero

--------------------------

input a = 1000
input is positive

--------------------------

input a = -20
input is negative

--------------------------

input a = x

Warning-[RT-NCMPRCS] No condition matches in statement
testbench.sv, 150
  No condition matches in 'priority case' statement. 'default' specification 
  is missing, inside priority_case.op, at time 0ns.


--------------------------

input a = z

Warning-[RT-NCMPRCS] No condition matches in statement
testbench.sv, 150
  No condition matches in 'priority case' statement. 'default' specification 
  is missing, inside priority_case.op, at time 0ns.


--------------------------
*/

