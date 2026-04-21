module random_with_seed ;
  byte a;
  logic  [7:0] b,c;
  int out;
  integer seed1=10,seed2=10;
  
  initial begin
    void'($random(seed1));
    void'($urandom(seed2));
    $display("==================================================");
    $display("    Randomiztion by Function System with SEED");
    $display("==================================================");
  repeat(10)begin 
    a=$random;
    b=$urandom;
    c=$urandom_range(50,30);
    
    product(a,b,c,out);
    $display("INPUTS  : A = %0d B = %0d C = %0d",a,b,c);
    $display("PRODUCT : %0d",out);
    $display("--------------------------------------");
    
  end
    
  end  
  task product(byte a,input logic [7:0] b,c,output int pro);
    pro=a*b*c;
  endtask
endmodule

/*
==================================================
    Randomiztion by Function System with SEED
==================================================
INPUTS  : A = 54 B = 244 C = 37
PRODUCT : 487512
--------------------------------------
INPUTS  : A = 68 B = 7 C = 36
PRODUCT : 17136
--------------------------------------
INPUTS  : A = -35 B = 119 C = 49
PRODUCT : 1288651
--------------------------------------
INPUTS  : A = -47 B = 239 C = 42
PRODUCT : 2097942
--------------------------------------
INPUTS  : A = -117 B = 131 C = 42
PRODUCT : 764778
--------------------------------------
INPUTS  : A = -71 B = 112 C = 38
PRODUCT : 787360
--------------------------------------
INPUTS  : A = -115 B = 85 C = 47
PRODUCT : 563295
--------------------------------------
INPUTS  : A = 19 B = 36 C = 48
PRODUCT : 32832
--------------------------------------
INPUTS  : A = -42 B = 191 C = 44
PRODUCT : 1798456
--------------------------------------*/
INPUTS  : A = 110 B = 167 C = 37
PRODUCT : 679690
--------------------------------------
