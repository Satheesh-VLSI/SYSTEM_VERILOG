module array_random;
 class queue;
   rand logic [7:0] que [$];
   constraint items{foreach(que[i]) que[i]<100;}
   constraint s{que.sum()  with (int'(item))==100;}
   constraint m{
     que.size()<10;
     que.size()>3;}
 endclass
  
  queue hi;
  initial begin 
    hi=new();
    $display("=====================================");
    $display("        QUEUE RANDOMIZATION");
    $display("=====================================");
    repeat(20)begin
    hi.randomize();
    
      $display("Size  : %0d",hi.que.size());
      $display("QUEUE : %0p",hi.que);
      $display("---------------------------------------");
  end
  end 
endmodule

/*
# KERNEL: =====================================
# KERNEL:         QUEUE RANDOMIZATION
# KERNEL: =====================================
# KERNEL: Size  : 8
# KERNEL: QUEUE : 17 2 6 22 20 6 4 23
# KERNEL: ---------------------------------------
# KERNEL: Size  : 5
# KERNEL: QUEUE : 20 23 30 17 10
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: QUEUE : 4 20 4 0 24 43 5
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: QUEUE : 8 25 5 27 15 11 9
# KERNEL: ---------------------------------------
# KERNEL: Size  : 4
# KERNEL: QUEUE : 79 4 12 5
# KERNEL: ---------------------------------------
# KERNEL: Size  : 6
# KERNEL: QUEUE : 37 16 27 8 6 6
# KERNEL: ---------------------------------------
# KERNEL: Size  : 8
# KERNEL: QUEUE : 0 4 9 23 37 12 13 2
# KERNEL: ---------------------------------------
# KERNEL: Size  : 8
# KERNEL: QUEUE : 10 20 2 29 21 2 3 13
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: QUEUE : 4 28 25 2 3 20 18
# KERNEL: ---------------------------------------
# KERNEL: Size  : 4
# KERNEL: QUEUE : 53 26 7 14
# KERNEL: ---------------------------------------
# KERNEL: Size  : 6
# KERNEL: QUEUE : 5 15 11 5 22 42
# KERNEL: ---------------------------------------
# KERNEL: Size  : 4
# KERNEL: QUEUE : 46 45 3 6
# KERNEL: ---------------------------------------
# KERNEL: Size  : 5
# KERNEL: QUEUE : 35 4 1 41 19
# KERNEL: ---------------------------------------
# KERNEL: Size  : 6
# KERNEL: QUEUE : 4 14 0 18 63 1
# KERNEL: ---------------------------------------
# KERNEL: Size  : 5
# KERNEL: QUEUE : 6 24 1 60 9
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: QUEUE : 29 23 17 1 15 11 4
# KERNEL: ---------------------------------------
# KERNEL: Size  : 9
# KERNEL: QUEUE : 9 59 3 4 11 10 0 0 4
# KERNEL: ---------------------------------------
# KERNEL: Size  : 9
# KERNEL: QUEUE : 3 35 28 21 2 2 8 0 1
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: QUEUE : 12 4 21 31 1 18 13
# KERNEL: ---------------------------------------
# KERNEL: Size  : 7
# KERNEL: QUEUE : 27 9 0 3 39 18 4
# KERNEL: ---------------------------------------*/
