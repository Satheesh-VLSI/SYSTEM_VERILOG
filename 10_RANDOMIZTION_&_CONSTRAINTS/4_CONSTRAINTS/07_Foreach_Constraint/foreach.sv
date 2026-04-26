module array_random;
 class dynamic_array;
   rand logic [7:0] arr [];
   
   constraint it{foreach(arr[i]) arr[i]<100;}
   
   constraint s{arr.sum()  with (int'(item))==100;}
   
   constraint m{
     arr.size()<10;
     arr.size()>3;}
 endclass
  
  dynamic_array hi;
  initial begin 
    hi=new();
    $display("=====================================");
    $display("       FOREACH CONSTRAINT");
    $display("=====================================");
    repeat(20)begin
    hi.randomize();
    
      $display("Size  : %0d",hi.arr.size());
      $display("Array : %0p",hi.arr);
      $display("---------------------------------------");
  end
  end 
endmodule

/*
# KERNEL: =====================================
# KERNEL:        FOREACH CONSTRAINT
# KERNEL: =====================================
# KERNEL: Size  : 8
# KERNEL: Array : 17 2 6 22 20 6 4 23
# KERNEL: ---------------------------------------
# KERNEL: Size  : 5
# KERNEL: Array : 20 23 30 17 10
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: Array : 4 20 4 0 24 43 5
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: Array : 8 25 5 27 15 11 9
# KERNEL: ---------------------------------------
# KERNEL: Size  : 4
# KERNEL: Array : 79 4 12 5
# KERNEL: ---------------------------------------
# KERNEL: Size  : 6
# KERNEL: Array : 37 16 27 8 6 6
# KERNEL: ---------------------------------------
# KERNEL: Size  : 8
# KERNEL: Array : 0 4 9 23 37 12 13 2
# KERNEL: ---------------------------------------
# KERNEL: Size  : 8
# KERNEL: Array : 10 20 2 29 21 2 3 13
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: Array : 4 28 25 2 3 20 18
# KERNEL: ---------------------------------------
# KERNEL: Size  : 4
# KERNEL: Array : 53 26 7 14
# KERNEL: ---------------------------------------
# KERNEL: Size  : 6
# KERNEL: Array : 5 15 11 5 22 42
# KERNEL: ---------------------------------------
# KERNEL: Size  : 4
# KERNEL: Array : 46 45 3 6
# KERNEL: ---------------------------------------
# KERNEL: Size  : 5
# KERNEL: Array : 35 4 1 41 19
# KERNEL: ---------------------------------------
# KERNEL: Size  : 6
# KERNEL: Array : 4 14 0 18 63 1
# KERNEL: ---------------------------------------
# KERNEL: Size  : 5
# KERNEL: Array : 6 24 1 60 9
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: Array : 29 23 17 1 15 11 4
# KERNEL: ---------------------------------------
# KERNEL: Size  : 9
# KERNEL: Array : 9 59 3 4 11 10 0 0 4
# KERNEL: ---------------------------------------
# KERNEL: Size  : 9
# KERNEL: Array : 3 35 28 21 2 2 8 0 1
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: Array : 12 4 21 31 1 18 13
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: Array : 27 9 0 3 39 18 4
# KERNEL: ---------------------------------------*/
