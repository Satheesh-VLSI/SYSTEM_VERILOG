
  // Parent 
class Gate;

  bit a, b;

  function new(bit x,bit y);
    a=x;
    b=y;
  endfunction

  extern function void display();
endclass


  //Child 
class AndGate extends Gate;

  bit out;

  extern function new(bit x, bit y);
  extern function void display();


endclass


class OrGate extends Gate;

  bit out;

  extern function new(bit x,bit y);
  extern function void display();

endclass


module test;

  initial begin
    AndGate g1;
    OrGate  g2;
    $display("=================================");
    $display("   Extern and Scope Resolution");
    $display("=================================");

    g1 = new(1,0);
    g2 = new(1,0);

    g1.display();
    g2.display();
  end

endmodule
    
   //parent functions 
   function void Gate::display();
     $display("Inputs: a=%0b | b=%0b",a,b);
   endfunction
   //Child AndGate functions
    function AndGate::new(bit x, bit y);
      super.new(x, y);
      out = a & b;
    endfunction
    
    function void AndGate::display();
      $display("---------------------------");
      $display("        AND Gate ");
      super.display();
      $display("Output: %0b", out);
      $display("---------------------------");
    endfunction
    
   //Child OrGate functions
    function OrGate::new(bit x, bit y);
       super.new(x,y);
       out= a | b;
    endfunction
    
    function void OrGate::display();
       $display("---------------------------");
       $display("         OR Gate ");
       super.display();  //this super indicates the pareant class method
       $display("Output: %0b", out);
       $display("---------------------------");
    endfunction

    /*
    
=================================
   Extern and Scope Resolution
=================================
---------------------------
        AND Gate 
Inputs: a=1 | b=0
Output: 0
---------------------------
---------------------------
         OR Gate 
Inputs: a=1 | b=0
Output: 1
---------------------------
    */
