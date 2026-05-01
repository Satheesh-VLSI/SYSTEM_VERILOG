class parent;
  local int data;

  function new(int data);
    this.data=data;
  endfunction
  
  function int get_data();
    return data;
  endfunction
endclass

class child extends parent;
  function new(int n);
    super.new(n);
  endfunction
  function void display();
    $display("\nValue of data inside child from parent's local variable: %0d\n",get_data());
    
    // $display("Value of data inside child from parent's local variable: %0d",data()); ==>>THIS WILL RISE ERROR the data VARIABLE IS LOCAL TO PARENT CLASS
    
  endfunction
endclass

module encapsulation();
  initial begin
    child c;
    $display("===========================");
    $display("      Encapsulation");
    $display("===========================");
    
    c=new(45);
    c.display(); 
    c=new(5);
    c.display(); 
    c=new(19);
    c.display(); 
    c=new(0);
    c.display();
  end
endmodule

/*
===========================
      Encapsulation
===========================

Value of data inside child from parent's local variable: 45


Value of data inside child from parent's local variable: 5


Value of data inside child from parent's local variable: 19


Value of data inside child from parent's local variable: 0*/
