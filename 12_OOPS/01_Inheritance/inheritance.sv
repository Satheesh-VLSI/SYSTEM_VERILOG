class parent;
  int value1;

  function new(int v1);
    value1=v1;
  endfunction

  function void display();
    $display("Parent value : %0d",value1);
  endfunction
endclass

class child extends parent;
  int value2;

  function new(int v1,int v2);
    super.new(v1); 
    value2=v2;
  endfunction

  function void display();
    super.display(); 
    $display("Child value : %0d",value2);
  endfunction
endclass

module inheritance;
  initial begin
    
    child c;
    
    $display("============================");
    $display("       Inheritance");
    $display("============================\n");
    
    
    c=new(100,200);
    c.display();
    $display("-----------------------------");
    c=new(50,70);
    c.display();
    $display("-----------------------------");
    c=new(1947,1950);
    c.display();
    $display("-----------------------------");
  end
endmodule

/*
============================
       Inheritance
============================

Parent value : 100
Child value : 200
-----------------------------
Parent value : 50
Child value : 70
-----------------------------
Parent value : 1947
Child value : 1950
-----------------------------*/
