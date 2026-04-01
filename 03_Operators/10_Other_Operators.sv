module sv_operators;
  // for inside
  int a=45;
  int data[5];

  // for wildcard equality
  bit [3:0] x=4'b1011;
  bit [3:0] y=4'b10x1;

  //FOF implication
  int A,B;
  
  initial begin

    //inside operator
    data='{5,10,25,45,4};
    if (a inside data)
      $display("\na is in data\n");
    
    //wildcard equality
    if (x ==? y)
      $display("Wildcard matched X nad Y");
    
  end

endmodule
