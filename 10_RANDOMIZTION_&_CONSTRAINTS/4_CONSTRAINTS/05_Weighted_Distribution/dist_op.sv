class weight;  
  rand bit [3:0] val1; 
  rand bit [3:0] val2;   

  constraint c1 { val1 dist { 2:=30,[2:5]:=40,6:=60,7:=20}; }  
  constraint c2 { val2 dist { 1:/30,[2:5]:/100,6:/50,7:/20}; } 
endclass  

module top;  
  initial begin  
    int i;  
    weight obj;  
    obj=new();  
    
    $display("===========================================");  
    $display("          WEIGHTED DISTRIBUTION");  
    $display("===========================================");  

    $display("\n\n----- Output for := operator -----");  
    $display("The occurrence of '6' is more as '6' has more weight");  

    for (int i=0; i<100;i++) begin  
      obj.randomize();  
      $display("Iteration %0d -----> value1 = %0d",i,obj.val1);  
    end  
    
    $display("\n\n\n----- Output for :/ operator -----"); 

    for (int i=0; i<100;i++) begin  
      obj.randomize();  
      $display("Iteration %0d -----> value1 = %0d",i,obj.val2);  
    end  
  end  
endmodule  
/*
===========================================
          WEIGHTED DISTRIBUTION
===========================================


----- Output for := operator -----
The occurrence of '6' is more as '6' has more weight
Iteration 0 -----> value1 = 2
Iteration 1 -----> value1 = 2
Iteration 2 -----> value1 = 7
Iteration 3 -----> value1 = 2
Iteration 4 -----> value1 = 2
Iteration 5 -----> value1 = 2
Iteration 6 -----> value1 = 5
Iteration 7 -----> value1 = 2
Iteration 8 -----> value1 = 4
Iteration 9 -----> value1 = 6
Iteration 10 -----> value1 = 7
Iteration 11 -----> value1 = 2
Iteration 12 -----> value1 = 6
Iteration 13 -----> value1 = 7
Iteration 14 -----> value1 = 6
Iteration 15 -----> value1 = 5
Iteration 16 -----> value1 = 4
Iteration 17 -----> value1 = 5
Iteration 18 -----> value1 = 4
Iteration 19 -----> value1 = 5
Iteration 20 -----> value1 = 2
Iteration 21 -----> value1 = 6
Iteration 22 -----> value1 = 7
Iteration 23 -----> value1 = 2
Iteration 24 -----> value1 = 7
Iteration 25 -----> value1 = 6
Iteration 26 -----> value1 = 6
Iteration 27 -----> value1 = 5
Iteration 28 -----> value1 = 4
Iteration 29 -----> value1 = 6
Iteration 30 -----> value1 = 2
Iteration 31 -----> value1 = 6
Iteration 32 -----> value1 = 6
Iteration 33 -----> value1 = 6
Iteration 34 -----> value1 = 3
Iteration 35 -----> value1 = 3
Iteration 36 -----> value1 = 2
Iteration 37 -----> value1 = 4
Iteration 38 -----> value1 = 2
Iteration 39 -----> value1 = 5
Iteration 40 -----> value1 = 2
Iteration 41 -----> value1 = 2
Iteration 42 -----> value1 = 4
Iteration 43 -----> value1 = 6
Iteration 44 -----> value1 = 6
Iteration 45 -----> value1 = 4
Iteration 46 -----> value1 = 6
Iteration 47 -----> value1 = 6
Iteration 48 -----> value1 = 3
Iteration 49 -----> value1 = 4
Iteration 50 -----> value1 = 4
Iteration 51 -----> value1 = 2
Iteration 52 -----> value1 = 4
Iteration 53 -----> value1 = 6
Iteration 54 -----> value1 = 2
Iteration 55 -----> value1 = 3
Iteration 56 -----> value1 = 3
Iteration 57 -----> value1 = 6
Iteration 58 -----> value1 = 2
Iteration 59 -----> value1 = 4
Iteration 60 -----> value1 = 6
Iteration 61 -----> value1 = 3
Iteration 62 -----> value1 = 2
Iteration 63 -----> value1 = 6
Iteration 64 -----> value1 = 4
Iteration 65 -----> value1 = 5
Iteration 66 -----> value1 = 7
Iteration 67 -----> value1 = 4
Iteration 68 -----> value1 = 6
Iteration 69 -----> value1 = 6
Iteration 70 -----> value1 = 2
Iteration 71 -----> value1 = 3
Iteration 72 -----> value1 = 5
Iteration 73 -----> value1 = 6
Iteration 74 -----> value1 = 2
Iteration 75 -----> value1 = 6
Iteration 76 -----> value1 = 2
Iteration 77 -----> value1 = 6
Iteration 78 -----> value1 = 6
Iteration 79 -----> value1 = 2
Iteration 80 -----> value1 = 2
Iteration 81 -----> value1 = 2
Iteration 82 -----> value1 = 6
Iteration 83 -----> value1 = 3
Iteration 84 -----> value1 = 5
Iteration 85 -----> value1 = 2
Iteration 86 -----> value1 = 2
Iteration 87 -----> value1 = 4
Iteration 88 -----> value1 = 2
Iteration 89 -----> value1 = 2
Iteration 90 -----> value1 = 7
Iteration 91 -----> value1 = 6
Iteration 92 -----> value1 = 5
Iteration 93 -----> value1 = 4
Iteration 94 -----> value1 = 2
Iteration 95 -----> value1 = 5
Iteration 96 -----> value1 = 2
Iteration 97 -----> value1 = 6
Iteration 98 -----> value1 = 2
Iteration 99 -----> value1 = 3



----- Output for :/ operator -----
Iteration 0 -----> value1 = 1
Iteration 1 -----> value1 = 4
Iteration 2 -----> value1 = 6
Iteration 3 -----> value1 = 1
Iteration 4 -----> value1 = 4
Iteration 5 -----> value1 = 2
Iteration 6 -----> value1 = 7
Iteration 7 -----> value1 = 6
Iteration 8 -----> value1 = 6
Iteration 9 -----> value1 = 2
Iteration 10 -----> value1 = 1
Iteration 11 -----> value1 = 5
Iteration 12 -----> value1 = 6
Iteration 13 -----> value1 = 6
Iteration 14 -----> value1 = 6
Iteration 15 -----> value1 = 6
Iteration 16 -----> value1 = 6
Iteration 17 -----> value1 = 3
Iteration 18 -----> value1 = 6
Iteration 19 -----> value1 = 4
Iteration 20 -----> value1 = 3
Iteration 21 -----> value1 = 1
Iteration 22 -----> value1 = 6
Iteration 23 -----> value1 = 2
Iteration 24 -----> value1 = 2
Iteration 25 -----> value1 = 7
Iteration 26 -----> value1 = 4
Iteration 27 -----> value1 = 6
Iteration 28 -----> value1 = 1
Iteration 29 -----> value1 = 5
Iteration 30 -----> value1 = 2
Iteration 31 -----> value1 = 4
Iteration 32 -----> value1 = 6
Iteration 33 -----> value1 = 6
Iteration 34 -----> value1 = 3
Iteration 35 -----> value1 = 1
Iteration 36 -----> value1 = 3
Iteration 37 -----> value1 = 2
Iteration 38 -----> value1 = 6
Iteration 39 -----> value1 = 4
Iteration 40 -----> value1 = 5
Iteration 41 -----> value1 = 7
Iteration 42 -----> value1 = 6
Iteration 43 -----> value1 = 5
Iteration 44 -----> value1 = 5
Iteration 45 -----> value1 = 6
Iteration 46 -----> value1 = 1
Iteration 47 -----> value1 = 4
Iteration 48 -----> value1 = 4
Iteration 49 -----> value1 = 3
Iteration 50 -----> value1 = 6
Iteration 51 -----> value1 = 7
Iteration 52 -----> value1 = 3
Iteration 53 -----> value1 = 4
Iteration 54 -----> value1 = 5
Iteration 55 -----> value1 = 3
Iteration 56 -----> value1 = 6
Iteration 57 -----> value1 = 3
Iteration 58 -----> value1 = 2
Iteration 59 -----> value1 = 1
Iteration 60 -----> value1 = 4
Iteration 61 -----> value1 = 1
Iteration 62 -----> value1 = 3
Iteration 63 -----> value1 = 6
Iteration 64 -----> value1 = 5
Iteration 65 -----> value1 = 4
Iteration 66 -----> value1 = 1
Iteration 67 -----> value1 = 1
Iteration 68 -----> value1 = 7
Iteration 69 -----> value1 = 3
Iteration 70 -----> value1 = 6
Iteration 71 -----> value1 = 4
Iteration 72 -----> value1 = 6
Iteration 73 -----> value1 = 6
Iteration 74 -----> value1 = 6
Iteration 75 -----> value1 = 7
Iteration 76 -----> value1 = 6
Iteration 77 -----> value1 = 2
Iteration 78 -----> value1 = 5
Iteration 79 -----> value1 = 6
Iteration 80 -----> value1 = 2
Iteration 81 -----> value1 = 5
Iteration 82 -----> value1 = 6
Iteration 83 -----> value1 = 1
Iteration 84 -----> value1 = 7
Iteration 85 -----> value1 = 1
Iteration 86 -----> value1 = 2
Iteration 87 -----> value1 = 2
Iteration 88 -----> value1 = 1
Iteration 89 -----> value1 = 5
Iteration 90 -----> value1 = 2
Iteration 91 -----> value1 = 3
Iteration 92 -----> value1 = 5
Iteration 93 -----> value1 = 6
Iteration 94 -----> value1 = 7
Iteration 95 -----> value1 = 2
Iteration 96 -----> value1 = 2
Iteration 97 -----> value1 = 6
Iteration 98 -----> value1 = 7
Iteration 99 -----> value1 = 3*/
