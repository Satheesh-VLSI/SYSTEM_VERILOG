module implication_constraint;
  
  class calc;

  rand int a, b, result;
  rand logic [1:0] op;   //0:ADD,1:SUB,2:MUL,3:DIV
    
  constraint c1 {
    a inside {[0:50]};
    b inside {[0:50]};
  }

  constraint c2 {
    // ADD
    (op == 0) -> result==a+b;
    // SUB
    (op == 1) -> result==a-b;
    // MUL
    (op == 2) -> result==a*b;
    // DIV
    (op == 3) -> {b!=0; result==a/b;}}

endclass
  
  initial begin  
    calc obj;  
    obj=new();  
    
    $display("===========================================");  
    $display("         IMPLICATION CONSTRAINT");  
    $display("===========================================");  

    repeat(20) begin 
      obj.randomize();
      
      $display("Inputs : A = %0d | B = %0d ",obj.a,obj.b);
      case(obj.op)
        0:$display("Result : A + B = %0d",obj.result);
        1:$display("Result : A - B = %0d",obj.result);
        2:$display("Result : A x B = %0d",obj.result);
        3:$display("Result : A / B = %0d",obj.result);
      endcase
      
      $display("----------------------------------------"); 
    end
      
    end 
endmodule

/*
===========================================
         IMPLICATION CONSTRAINT
===========================================
Inputs : A = 9 | B = 10 
Result : A - B = -1
----------------------------------------
Inputs : A = 12 | B = 34 
Result : A / B = 0
----------------------------------------
Inputs : A = 34 | B = 31 
Result : A - B = 3
----------------------------------------
Inputs : A = 38 | B = 47 
Result : A / B = 0
----------------------------------------
Inputs : A = 27 | B = 11 
Result : A / B = 2
----------------------------------------
Inputs : A = 6 | B = 1 
Result : A / B = 6
----------------------------------------
Inputs : A = 3 | B = 48 
Result : A x B = 144
----------------------------------------
Inputs : A = 17 | B = 12 
Result : A / B = 1
----------------------------------------
Inputs : A = 30 | B = 33 
Result : A x B = 990
----------------------------------------
Inputs : A = 22 | B = 13 
Result : A + B = 35
----------------------------------------
Inputs : A = 3 | B = 10 
Result : A + B = 13
----------------------------------------
Inputs : A = 44 | B = 1 
Result : A x B = 44
----------------------------------------
Inputs : A = 1 | B = 7 
Result : A x B = 7
----------------------------------------
Inputs : A = 23 | B = 6 
Result : A + B = 29
----------------------------------------
Inputs : A = 40 | B = 20 
Result : A / B = 2
----------------------------------------
Inputs : A = 40 | B = 37 
Result : A x B = 1480
----------------------------------------
Inputs : A = 36 | B = 6 
Result : A x B = 216
----------------------------------------
Inputs : A = 44 | B = 47 
Result : A x B = 2068
----------------------------------------
Inputs : A = 14 | B = 34 
Result : A + B = 48
----------------------------------------
Inputs : A = 47 | B = 34 
Result : A x B = 1598
----------------------------------------*/
