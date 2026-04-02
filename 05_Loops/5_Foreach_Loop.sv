
module foreach_loop;
  int q[$];

  function void count_sum(int q[$]);   
      
    shortint pos_count;
    shortint neg_count;
    shortint zero_count;
    int sum;
    
    pos_count=0;
    neg_count=0;
    zero_count=0;
    sum=0;
    
    foreach(q[i])begin
      sum+=q[i];
      
      if(q[i]>0)
        pos_count++;
      else if(q[i] < 0)
        neg_count++;
      else
        zero_count++;
    end
    
    
    $display("Queue  = %p",q);
    $display("Total Sum      = %0d",sum);
    $display("Positive Count = %0d",pos_count);
    $display("Negative Count = %0d",neg_count);
    $display("Zero Count     = %0d",zero_count);
    $display("\n----------------------------------\n");
  endfunction
  
  initial begin
    $display("--------------------------");
    $display("       FOREACH Loop");
    $display("--------------------------\n");
    
    q='{10,-5,20,-15,0,30,-2};
    count_sum(q);
    
    q='{10,-5,10,-15,12,-33,0,56,0-2};
    count_sum(q);
    
    q='{0,-25,20,-19,3,30,90,78,4,-2,-9,3,0};
    count_sum(q);
    
    q='{-99,28,17,45,-26,-72,31,0,73,8,1};
    count_sum(q);
    
  end
endmodule
/*
--------------------------
       FOREACH Loop
--------------------------

Queue  = '{10, -5, 20, -15, 0, 30, -2} 
Total Sum      = 38
Positive Count = 3
Negative Count = 3
Zero Count     = 1

----------------------------------

Queue  = '{10, -5, 10, -15, 12, -33, 0, 56, -2} 
Total Sum      = 33
Positive Count = 4
Negative Count = 4
Zero Count     = 1

----------------------------------

Queue  = '{0, -25, 20, -19, 3, 30, 90, 78, 4, -2, -9, 3, 0} 
Total Sum      = 173
Positive Count = 7
Negative Count = 4
Zero Count     = 2

----------------------------------

Queue  = '{-99, 28, 17, 45, -26, -72, 31, 0, 73, 8, 1} 
Total Sum      = 6
Positive Count = 7
Negative Count = 3
Zero Count     = 1

----------------------------------
*/
