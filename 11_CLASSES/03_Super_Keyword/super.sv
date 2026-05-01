
  // Parent 
class Gate;

  bit a, b;

  function new(bit x,bit y);
    a=x;
    b=y;
  endfunction

  function void display();
    $display("Inputs: a=%0b | b=%0b",a,b);
  endfunction

endclass:Gate


  //Child 
class AndGate extends Gate;

  bit out;

  function new(bit x, bit y);
    super.new(x, y);
    out = a & b;
  endfunction

  function void display();
    $display("---------------------------");
    $display("        AND Gate ");
    super.display();
    $display("Output: %0b", out);
    $display("---------------------------");
  endfunction

endclass:AndGate


class OrGate extends Gate;

  bit out;

  function new(bit x,bit y);
    super.new(x,y);
    out= a | b;
  endfunction

  function void display();
    $display("---------------------------");
    $display("         OR Gate ");
    super.display();  //this super indicates the pareant class method
    $display("Output: %0b", out);
    $display("---------------------------");
  endfunction

endclass:OrGate


module test_gate;

  initial begin
    AndGate g1;
    OrGate  g2;
    $display("=================================");
    $display("         SUPER Keyword");
    $display("=================================");

    g1=new(1,0);
    g2=new(1,0);

    g1.display();
    g2.display();
  end

endmodule

/*

=================================
         SUPER Keyword
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
