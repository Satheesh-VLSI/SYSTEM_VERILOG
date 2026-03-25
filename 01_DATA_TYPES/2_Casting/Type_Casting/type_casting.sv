module state_state_data_types;
  

  
  bit [3:0] a1;
  byte b1;
  int  c1;
  shortint d1;
  longint e1;
  string f1;
         
  bit [3:0] a2;
  byte      b2;
  int       c2;
  shortint  d2;
  longint   e2;
  string f2;
         
  
         initial begin
           a1=5;b1=3;c1=7;d1=7;e1=50020;f1="bye";
           //assigning without casting
           b2=a1; //bit to byte
           c2=b1; //byte to int
           d2=b1; //byte to shortint
           a2=c1; //int to bit
           e2=f1; //string to shortint
          #10;
           
           //default values
           $display("=====================================\n        Initialized values  before casting         \n======================================");
           $display("bit to byte         = %0d	%0b",b2,b2);
           $display("byte to int         = %0d	%0b",c2,c2);
           $display("byte to shortint    = %0d	%0b",d2,d2);
           $display("int to bit          = %0d	%0b",a2,a2);
           $display("string to longint   = %0d	%0b",e2,e2);
           #10;
           b2=byte'(a1); //bit to byte
           c2=int'(b1); //byte to int
           d2=byte'(b1); //byte to shortint
           c1; //int to bit
           e2=longint'(f1); //string to shortint
           #10;
           //Values After Initialization
           $display("=====================================\n        Casted Values        \n======================================");
           $display("bit to byte         = %0d	%0b",b2,b2);
           $display("byte to int         = %0d	%0b",c2,c2);
           $display("byte to shortint    = %0d	%0b",d2,d2);
           $display("int to bit          = %0d	%0b",a2,a2);
           $display("string to longint   = %0d	%0b",e2,e2);
           
           
         
         
         
         
         #10;
           $finish;
         end
         endmodule
  
