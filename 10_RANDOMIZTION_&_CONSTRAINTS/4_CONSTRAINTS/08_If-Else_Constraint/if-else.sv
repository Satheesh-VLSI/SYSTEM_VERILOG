module if_else;
  
 class calc;
  rand byte num1;
  rand byte num2;
  
  constraint range{
    if(num1%2==0)
      (num2%2)==0;
    else
      (num2%2)==1;  
  }
 endclass:calc
  
  initial begin
    calc ob;
    ob=new();
    $display("====================================");
    $display("        If-Else Constraint");
    $display("====================================");
    repeat(10) begin 
      if(ob.randomize())
        $display("    Number 1: %0d | Number 2: %0d",ob.num1,ob.num2);
    else 
      $display("    Randomization failed");end
      
    
  end 
endmodule
/*
====================================
        If-Else Constraint
====================================
    Number 1: -106 | Number 2: 80
    Number 1: 115 | Number 2: 87
    Number 1: 64 | Number 2: 96
    Number 1: -47 | Number 2: 49
    Number 1: 18 | Number 2: 96
    Number 1: 91 | Number 2: 73
    Number 1: 36 | Number 2: 56
    Number 1: -66 | Number 2: 82
    Number 1: -31 | Number 2: 119
    Number 1: 44 | Number 2: -32
*/
