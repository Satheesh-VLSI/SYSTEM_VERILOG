module random_without_seed ;
  byte a;
  logic  [7:0] b,c;
  int out;
  initial begin
    
  repeat(10)begin 
    a=$random;
    b=$urandom;
    c=$urandom_range(50,30);
    
    product(a,b,c,out);
    $display("--------------------------------------");
    $display("INPUTS  : A = %0d B = %0d C = %0d",a,b,c);
    $display("PRODUCT : %0d",out);
    $display("--------------------------------------");
    
  end
    
  end  
  task product(byte a,input logic [7:0] b,c,output int pro);
    pro=a*b*c;
  endtask
endmodule
