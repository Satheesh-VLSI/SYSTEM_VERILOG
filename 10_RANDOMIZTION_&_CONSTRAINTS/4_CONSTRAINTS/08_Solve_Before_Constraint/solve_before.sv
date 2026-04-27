module solve_before;
  
 class calc;
  rand byte num1;
  rand byte num2;
  
  constraint range{
    if(num1%2==0)
      (num2%2)==0;
    else
      (num2%2)==1;  
    
   solve num1 before num2;
  }
 endclass:calc
  
  initial begin
    calc ob;
    ob=new();
    $display("====================================");
    $display("      Solve Before Constraint");
    $display("====================================");
    repeat(10) begin 
      if(ob.randomize())
        $display("    Number 1: %0d | Number 2: %0d",ob.num1,ob.num2);
    else 
      $display("    Randomization failed");end
      
    
  end 
endmodule
/*====================================
      Solve Before Constraint
====================================
    Number 1: 45 | Number 2: 35
    Number 1: -26 | Number 2: 86
    Number 1: -127 | Number 2: 65
    Number 1: -94 | Number 2: -80
    Number 1: 36 | Number 2: 96
    Number 1: -74 | Number 2: 72
    Number 1: 72 | Number 2: 56
    Number 1: 124 | Number 2: -46
    Number 1: -62 | Number 2: -10
    Number 1: 45 | Number 2: 97
*/
