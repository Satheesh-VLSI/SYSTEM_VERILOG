module four_state_data_types;
  
  reg [3:0] r;
  wire [2:0] w,w1;
  logic [7:0] l;
  integer i;
  time t;
  real r1;
         
         initial begin 
           $display("=====================================\n         SIZE OF THE SIGNALS         \n======================================");
           $display("SIZE of the reg data type signal     = %0d ",$bits(r));
           $display("SIZE of the wire data type signal    = %0d ",$bits(w));
           $display("SIZE of the logic data type signal   = %0d ",$bits(l));
           $display("SIZE of the integer data type signal = %0d ",$bits(i));
           $display("SIZE of the time data type signal    = %0d ",$bits(t));
           t=$time;
           //default values
           $display("=====================================\n         Default Values         \n======================================");
           $display("Default Values of the reg data type signal = %0d	%b ",r,r);
           $display("Default Values of wire data type signal    = %0d	%b ",w1,w1);
           $display("Default Values of logic data type signal   = %0d	%b ",l,l);
           $display("Default Values of integer data type signal = %0d	%b ",i,i);
           $display("Default Values of time data type signal    = %0d	%b ",t,t);
           $display("Default Values of data type signal         = %0d   %b\n\n ",r1,r1);
           #10;
           r=4'd10;
           l=44;
           i=-100;
           r1=56;
           t=$time;
           //Values After Initialization
           $display("=====================================\n         Values after INitialization         \n======================================");
           $display("After Initialization Values reg data type signal     = %0d	 %b ",r,r);
           $display("After Initialization Values wire data type signal    = %0d	 %b ",w,w);
           $display("After Initialization Values logic data type signal   = %0d	 %b ",l,l);
           $display("After Initialization Values integer data type signal = %0d	 %b ",i,i);
           $display("After Initialization Values time data type signal    = %0d	 %b ",t,t);
           $display("After Initialization Values data type signal         = %0d  %b ",r1,r1);
           
           
         
         
         
         
         #10;
           $finish;
         end
         assign #10 w=  3'b101;
         endmodule
  
