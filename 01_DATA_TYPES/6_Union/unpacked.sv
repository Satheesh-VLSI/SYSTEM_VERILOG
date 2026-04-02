
module unpacked_union;
  typedef union {
    int  a;
    byte b;
  } my_union;

  my_union u1;

  initial begin
    $display("\n--------------------------------------");
      $display("             UNPACKED UNION           ");
    $display("--------------------------------------\n");

    u1.a=32'hAABBCCDD;

    $display("After assigning a:");
    $display("u1.a = %0h", u1.a);
    $display("u1.b = %0h (lower 8 bits)\n", u1.b);

    u1.b=8'h11;

    $display("After assigning b:");
    $display("u1.a = %0h (partially affected)", u1.a);
    $display("u1.b = %0h\n", u1.b);
    

  end

endmodule


/*# --------------------------------------
#              UNPACKED UNION           
# --------------------------------------
# 
# After assigning a:
# u1.a = aabbccdd
# u1.b = dd (lower 8 bits)
# 
# After assigning b:
# u1.a = aabbcc11 (partially affected)
# u1.b = 11
*/
