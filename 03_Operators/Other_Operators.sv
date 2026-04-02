module sv_operators;
  // for inside
  int a=45;
  int data[5];

  // for wildcard equality
  logic [3:0] x=4'b1011;
  logic [3:0] y=4'b10x1;

  //FOF implication
  bit A,B;
  
  
  initial begin

    //inside operator
    $display("--------Set Memebership---------");
    data='{5,10,25,45,4};
    if (a inside {5,10,25,45,4})
      $display("\na is in data\n");
    
    //wildcard equality
    
    $display("--------Wildcard---------");
    
    $display("x = %b y = %b",x,y);
    $display("Wildcard x==?y:%b\n",(x ==? y));
    
     x=4'bx0zx;
     y=4'b1011;
    $display("x = %b y = %b",x,y);
    $display("Wildcard x!=?y:%b",(x !=? y));
    
    

    //logical implication
    
    $display("--------Logical Implication---------");
    A=0;B=1;
    $display("\n!A =%b B = %b",A,B);
    $display("\n!A || B : %b",A->B);
    $display("(!A || B)&&(A ||!B) : %b\n",(A<->B));
        A=1;B=0;
    $display("\n!A =%b B = %b",A,B);
    $display("\n!A || B : %b",A->B);
    $display("(!A || B)&&(A ||!B) : %b\n",(A<->B));
        A=1;B=1;
    $display("\n!A =%b B = %b",A,B);
    $display("\n!A || B : %b",A->B);
    $display("(!A || B)&&(A ||!B) : %b\n",(A<->B));
        A=0;B=0;
    $display("\n!A =%b B = %b",A,B);
    $display("\n!A || B : %b",A->B);
    $display("(!A || B)&&(A ||!B) : %b\n",(A<->B));
    
  end

endmodule

/*--------Set Memebership---------

a is in data

--------Wildcard---------
x = 1011 y = 10x1
Wildcard x==?y:1

x = x0zx y = 1011
Wildcard x!=?y:x
--------Logical Implication---------

!A =0 B = 1

!A || B : 1
(!A || B)&&(A ||!B) : 0


!A =1 B = 0

!A || B : 0
(!A || B)&&(A ||!B) : 0


!A =1 B = 1

!A || B : 1
(!A || B)&&(A ||!B) : 1


!A =0 B = 0

!A || B : 1
(!A || B)&&(A ||!B) : 1
*/
