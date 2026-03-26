module signed_unsigned_cast;

    logic signed [7:0] s_val; // signed 8-bit
    logic [7:0] u_val;          // unsigned 8-bit

    logic signed [7:0] s2;
    logic [7:0] u2;

    initial begin

        s_val=-10; 
        u_val=200;  

        $display("======================================");
        $display("            Original Values           ");
        $display("======================================");
         $display("Signed   s_val = %0d  %0b", s_val, s_val);
         $display("Unsigned u_val = %0d  %0b", u_val, u_val);

        s2=signed'(u_val);   // unsigned to signed
        u2=unsigned'(s_val); // signed to unsigne
        #5;

        $display("======================================");
        $display("             After Casting            ");
        $display("======================================");
  
         $display("Unsigned to Signed  s2 = %0d  %0b", s2, s2);
         $display("Signed  to Unsigned u2 = %0d  %0b\n\n", u2, u2);

        #5;
        $finish;
    end

endmodule
