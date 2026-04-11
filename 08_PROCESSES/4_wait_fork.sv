
module fork_join_none;
  
  task automatic display_start(input string a);
    #10;
    $display("\t%s at %0t",a,$time);
  endtask
  
  task automatic display_end(input string a);
    #10;
    $display("\t%s at %0t",a,$time);
  endtask
  
  initial begin
    //with fork-join
    
    $display("--------------------------------------");
    $display("   Fork-Join_none Without wait_fork  ");
    $display("--------------------------------------");
     fork
       begin:child_1
       display_start("Thread 1 started");
       display_end("Thread 1 Ended");
       display_start("Thread 2 started");
       display_end("Thread 2 Ended");
       
       end:child_1
       begin:child_2
       display_start("Thread 3 started");
       display_end("Thread 3 Ended");
       display_start("Thread 4 started");
       display_end("Thread 4 Ended");
       display_start("Thread 5 started");
       display_end("Thread 5 Ended");
       end:child_2
     join_none
    $display("------------------------------------");
    $display("Execution Came out of Fork-join_none");
    $display("------------------------------------");
    #60;
    #0;
    
    $display("-------------------------------------");
    $display("    Fork-Join_none With wait_fork    ");
    $display("-------------------------------------");
     fork
       begin:child_3
       display_start("Thread 1 started");
       display_end("Thread 1 Ended");
       display_start("Thread 2 started");
       display_end("Thread 2 Ended");
       
       end:child_3
       begin:child_4
       display_start("Thread 3 started");
       display_end("Thread 3 Ended");
       display_start("Thread 4 started");
       display_end("Thread 4 Ended");
       display_start("Thread 5 started");
       display_end("Thread 5 Ended");
       end:child_4
       begin
       #60;
      #0; $display("\n All threds within fork are completed");
       end
     join_none
    wait fork;
      
    $display("------------------------------------");
    $display("Execution Came out of Fork-join_none");
    $display("------------------------------------");
    #50;
    #0;
    
end
  
endmodule
/*
--------------------------------------
   Fork-Join_none Without wait_fork  
--------------------------------------
------------------------------------
Execution Came out of Fork-join_none
------------------------------------
	Thread 1 started at 10
	Thread 3 started at 10
	Thread 1 Ended at 20
	Thread 3 Ended at 20
	Thread 2 started at 30
	Thread 4 started at 30
	Thread 2 Ended at 40
	Thread 4 Ended at 40
	Thread 5 started at 50
	Thread 5 Ended at 60
-------------------------------------
    Fork-Join_none With wait_fork    
-------------------------------------
	Thread 1 started at 70
	Thread 3 started at 70
	Thread 1 Ended at 80
	Thread 3 Ended at 80
	Thread 2 started at 90
	Thread 4 started at 90
	Thread 2 Ended at 100
	Thread 4 Ended at 100
	Thread 5 started at 110
	Thread 5 Ended at 120

 All threds within fork are completed
------------------------------------
Execution Came out of Fork-join_none
------------------------------------
*/


      
