module packed_union;

  typedef union packed {
    bit [31:0] a;
    int b;
  } my_union;

  my_union u1,u2;
  longint c;

  initial begin
    $display("\n((((((((((((( PACKED UNION )))))))))))))\n");

    u1.a=32'hAABBCCDD;

    $display("After assigning a:");
    $display("u1.a = %0h",u1.a);
    $display("u1.b = %0h (same bits)\n",u1.b);

    u1.b=32'h11223344;

    $display("After assigning b:");
    $display("u1.a = %0h (same memory)",u1.a);
    $display("u1.b = %0h\n",u1.b);
     
    u2.b=32'h11223344;
    c=u1+u2;
    $display("Adding two different union");
    $display("u1+u2 = %0h",c);

  end

endmodule


/*
((((((((((((( PACKED UNION )))))))))))))

After assigning a:
u1.a = aabbccdd
u1.b = aabbccdd (same bits)

After assigning b:
u1.a = 11223344 (same memory)
u1.b = 11223344

Adding two different union
u1+u2 = 22446688
*/


