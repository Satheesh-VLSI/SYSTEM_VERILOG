module queue;
  
  int q1[$];
  int q2[$:10];
  
  int i;
 
  initial begin
  $display("\n==================================================");
  $display("                       QUEUE                        "); 
  $display("==================================================\n");
    
    
    // assign
    q1='{5,9,4,6,3,45,8,9,19,24,33,77,2,5,0,21};

    $display("\Queue 1 = %p\n",q1);

    
    
    
    for(i=0;i<6;i++)
      q2[i]=i*5;

    $display("Queue 2 = %0p\n",q2);
    
     i=0;
    
    //Traversal by push front
    $display("Traversing Queue 1 using pop_front:");
    while(q1.size()!=0) begin
      $display("Queue[%0d] = %0d",i,q1.pop_front());
        i=i+1;
      end
    
    //size before insert
    $display("\nsize of Queue 2 before insert = %0d",q2.size());
    
    //insert 
    q2.insert(4,78);
    $display("\n\ninserting 78 at 4th position Queue[4] 2 = %0d",q2[4]);
    $display("Queue 2 = %0p\n\n",q2);
    
    //size after insert
    $display("size of Queue 2 after insert = %0d",q2.size());
    
    
    //initializing using push
    for(i=0;i<11;i++)begin
      q1.push_front(100-i*i);
    end
    $display("\new Queue 1 = %p\n",q1);
    
    
    //Delete specific index value
    q1.delete(5);
    
    $display("\nAfter deleting 5th index in Queue 1: %p\n",q1);

    //Deleting  all elements
    q1.delete();
    $display("After deleting q1: size = %0d\n",q1.size());

    //Coping queue
    q1=q2;
    $display("Copied q1 = %p\n",q1);


  end

endmodule

/*
==================================================
                       QUEUE                        
==================================================

Queue 1 = '{5, 9, 4, 6, 3, 45, 8, 9, 19, 24, 33, 77, 2, 5, 0, 21} 

Queue 2 = '{0, 5, 10, 15, 20, 25} 

Traversing Queue 1 using pop_front:
Queue[0] = 5
Queue[1] = 9
Queue[2] = 4
Queue[3] = 6
Queue[4] = 3
Queue[5] = 45
Queue[6] = 8
Queue[7] = 9
Queue[8] = 19
Queue[9] = 24
Queue[10] = 33
Queue[11] = 77
Queue[12] = 2
Queue[13] = 5
Queue[14] = 0
Queue[15] = 21

size of Queue 2 before insert = 6


inserting 78 at 4th position Queue[4] 2 = 78
Queue 2 = '{0, 5, 10, 15, 78, 20, 25} 


size of Queue 2 after insert = 7

ew Queue 1 = '{0, 19, 36, 51, 64, 75, 84, 91, 96, 99, 100} 


After deleting 5th index in Queue 1: '{0, 19, 36, 51, 64, 84, 91, 96, 99, 100} 

After deleting q1: size = 0

Copied q1 = '{0, 5, 10, 15, 78, 20, 25} 
*/



