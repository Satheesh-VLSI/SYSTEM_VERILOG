module state_state_data_types;
  

  
  bit [3:0] a1;
  byte b1;
  int  c1;
  shortint d1;
  longint e1;
  string f1;
  wire[3:0] g1=4'b0110;
  reg [3:0] h1;
  logic [3:0] i1;
  real j1;
         
  bit [3:0] a2;
  byte      b2;
  int       c2;
  shortint  d2;
  longint   e2;
  string f2;
  wire [3:0] g2;
  reg [3:0] h2;
  logic [3:0] i2;
  real j2;
         
  
         initial begin
           a1=5;b1=3;c1=-4;d1=-7;e1=64'b01000010_01111001_01100101;
           f1="bye"; 
           h1=11; i1=4'b1xz1; j1=9.9;
           
           
          #10;
           
           //default values
           $display("=====================================\n    Initialized values  before casting         \n======================================");
           $display("bit      = %0d\t%0b",a1,a1);
           $display("byte     = %0d\t%0b",b1,b1);
           $display("int      = %0d\t%0b",c1,c1);
           $display("shortint = %0d\t%0b",d1,d1);
           $display("longint  = %0d\t%0b",e1,e1);
           $display("string   = %0s\t%0b",f1,f1);
           $display("wire     = %0d\t%0b",g1,g1);
           $display("reg      = %0d\t%0b",h1,h1);
           $display("logic    = %0d\t%0b",i1,i1);
           $display("real     = %0d\t%0f",j1,j1);
           #10;
           a2=bit[3:0]'(g1);    //wire to bit
           b2=byte'(i1);     //logic to byte
           c2=int'(d1);      //shortint to int
           d2=shortint'(j1); //real to shortint
           e2=longint'(c1);  //  int to longint
           f2=string'(e1);   //longint to string
           h2=reg'(a1);     //bit to reg
           i2=logic'(b1);     //byte to logic
           j2=real'(f1);      //string to real
           #10;
           //Values After Initialization
           $display("=====================================\n        Casted Values        \n======================================");

		    	$display("wire to bit          = %0d    %0b", a2, a2);
		    	$display("logic to byte        = %0d    %0b", b2, b2);
		    	$display("shortint to int      = %0d    %0b", c2, c2);
		    	$display("real to shortint     = %0d    %0b", d2, d2);
		    	$display("int to longint       = %0d    %0b", e2, e2);
          $display("longint to string    = %0s    %0b", f2, f2); 
			    $display("bit to reg           = %0d    %0b", h2, h2);
			    $display("byte to logic        = %0d    %0b", i2, i2);
          $display("string to real       = %0f    %0b", j2, j2); 
         
         
         
         #10;
           $finish;
         end
         endmodule
  
