module case_conditions;
  integer a;
  
  function void op(integer a);
    $display("\ninput a = %0d",a);
       case(1)
         (a==0): $display("input is zero");
         (a>0) : $display("input is positive");
         (a<0) : $display("input is negative");
         default:$display("input is unknown");
    endcase
    
    $display("\n--------------------------");
  endfunction
  
  initial begin 
    
    $display("\n--------------------------");
    $display("          CASE");
    
    $display("--------------------------");
     a=5;
    op(a);
    
    a=-2;
    op(a);
    
    a=3;
    op(a);
    
    a=0;
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
          CASE
--------------------------

input a = 5
input is positive

--------------------------

input a = -2
input is negative

--------------------------

input a = 3
input is positive

--------------------------

input a = 0
input is zero

--------------------------

input a = -20
input is negative

--------------------------

input a = x
input is unknown

--------------------------

input a = z
input is unknown

--------------------------
*/

