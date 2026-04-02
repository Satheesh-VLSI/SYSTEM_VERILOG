module if_else;
  integer a;
  
  function void op(integer a);
    $display("\ninput a = %0d",a);
    if(a==0)
      $display("input is zero");
    else  if(a>0)
      $display("input is positive");
    else  if(a<0)
      $display("input is negative");
    else
      $display("input is unknown");
    
    $display("\n--------------------------");
  endfunction
  
  initial begin 
    
    $display("\n--------------------------");
    $display("          If Else");
    
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
          If Else
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


