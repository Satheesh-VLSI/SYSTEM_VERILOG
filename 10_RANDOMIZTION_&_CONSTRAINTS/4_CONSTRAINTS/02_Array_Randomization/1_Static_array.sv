module array_random;
 class static_array;
   randc logic [7:0] arr [7:0];
   constraint items{foreach(arr[i]) arr[i]<20;}
   constraint s{arr.sum()==50;}
 endclass
  
  static_array hi;
  initial begin 
    hi=new();
    $display("================================");
    $display("   STATIC ARRAY RANDOMIZATION");
    $display("================================");
    repeat(20)begin
    hi.randomize();
    
    $display("Array : %0p",hi);
      $display("----------------------------");
  end
  end 
endmodule

/*
================================
# KERNEL:    STATIC ARRAY RANDOMIZATION
# KERNEL: ================================
# KERNEL: Array : {4 16 0 13 4 7 2 4}
# KERNEL: ----------------------------
# KERNEL: Array : {12 4 5 10 6 3 3 7}
# KERNEL: ----------------------------
# KERNEL: Array : {18 10 3 4 0 15 0 0}
# KERNEL: ----------------------------
# KERNEL: Array : {13 1 8 14 3 1 7 3}
# KERNEL: ----------------------------
# KERNEL: Array : {7 7 16 5 7 2 1 5}
# KERNEL: ----------------------------
# KERNEL: Array : {6 12 9 6 5 6 4 2}
# KERNEL: ----------------------------
# KERNEL: Array : {14 8 7 3 2 10 5 1}
# KERNEL: ----------------------------
# KERNEL: Array : {19 0 17 1 1 0 6 6}
# KERNEL: ----------------------------
# KERNEL: Array : {5 9 2 0 10 4 11 9}
# KERNEL: ----------------------------
# KERNEL: Array : {2 3 6 7 9 5 8 10}
# KERNEL: ----------------------------
# KERNEL: Array : {0 5 4 2 8 8 12 11}
# KERNEL: ----------------------------
# KERNEL: Array : {1 2 1 8 11 9 10 8}
# KERNEL: ----------------------------
# KERNEL: Array : {3 6 10 9 12 0 9 1}
# KERNEL: ----------------------------
# KERNEL: Array : {9 11 12 12 0 2 1 3}
# KERNEL: ----------------------------
# KERNEL: Array : {8 14 11 11 2 4 0 0}
# KERNEL: ----------------------------
# KERNEL: Array : {10 13 13 0 4 6 2 2}
# KERNEL: ----------------------------
# KERNEL: Array : {11 15 14 1 1 1 3 4}
# KERNEL: ----------------------------
# KERNEL: Array : {15 17 15 2 0 1 0 0}
# KERNEL: ----------------------------
# KERNEL: Array : {16 19 7 4 1 0 2 1}
# KERNEL: ----------------------------
# KERNEL: Array : {17 18 1 6 2 3 1 2}
# KERNEL: ----------------------------*/
