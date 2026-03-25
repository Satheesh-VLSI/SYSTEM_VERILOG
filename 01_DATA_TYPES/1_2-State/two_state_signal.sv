
module state_state_data_types;
  
  bit [3:0] a;
  byte b;
  int  c [7:0];
  shortint d;
  longint e;
         
         initial begin 
           $display("=====================================\n         SIZE OF THE SIGNALS         \n======================================");
           $display("SIZE of the bit data type signal      = %0d ",$bits(a));
           $display("SIZE of the byte data type signal     = %0d ",$bits(b));
           $display("SIZE of the shortint data type signal = %0d ",$bits(d));
           $display("SIZE of the int data type signal      = %0d ",$bits(c));
           $display("SIZE of the longint type signal       = %0d ",$bits(e));
           
           //default values
           $display("=====================================\n         Default Values         \n======================================");
           $display("Default Values of bit data type signal      = %0d",a);
           $display("Default Values of byte data type signal     = %0d",b);
           $display("Default Values of shortint data type signal = %0d",d);
           $display("Default Values of int data type signal      = %0p",c);
           $display("Default Values of longint data type signal  = %0d",e);
           #10;
           a=3;
           b=70;
           c='{100,23,43,1,2,45,7654,9999};
           d=16'habc;
           e=64'habcdefabde;
           //Values After Initialization
           $display("=====================================\n         Values after INitialization         \n======================================");
                    $display("After Initialization Values bit data type signal      = %0d",a);
                    $display("After Initialization Values byte data type signal     = %0d",b);
                    $display("After Initialization Values shortint data type signal = %0d",d);
                    $display("After Initialization Values int data type signal      = %0p",c);
                    $display("After Initialization Values longint data type signal  = %0d",e);
           
           
         
         
         
         
         #10;
           $finish;
         end
         endmodule
  
