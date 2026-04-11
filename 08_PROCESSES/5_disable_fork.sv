
module fork_join_any;
  
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
    
    $display("========================================");
    $display("   Fork-Join_any With Disable_fork");
    $display("========================================");
     fork
       begin:child_1
       display_start("Thread 1 started");
       display_end("Thread 1 Ended");
       display_start("Thread 2 started");
       display_end("Thread 2 Ended");
         #0;
       end:child_1
       begin:child_2
       display_start("Thread 3 started");
       display_end("Thread 3 Ended");
       display_start("Thread 4 started");
       display_end("Thread 4 Ended");
       display_start("Thread 5 started");
       display_end("Thread 5 Ended");
       end:child_2
     join_any
    disable fork;
      
    $display("------------------------------------");
    $display("     Outside after Fork-Join_any");
    $display("------------------------------------");
    #30;
        
    
      $display("\n\n\n========================================");
    $display("  Fork-Join_any Without Disable_fork");
    $display("========================================");
     fork
       begin:child_3
       display_start("Thread 1 started");
       display_end("Thread 1 Ended");
       display_start("Thread 2 started");
       display_end("Thread 2 Ended");
         #0;
       end:child_3
       begin:child_4
       display_start("Thread 3 started");
       display_end("Thread 3 Ended");
       display_start("Thread 4 started");
       display_end("Thread 4 Ended");
       display_start("Thread 5 started");
       display_end("Thread 5 Ended");
       end:child_4
     join_any
    $display("------------------------------------");
    $display("     Outside after Fork-Join_any");
    $display("------------------------------------");
    #30;
    
    
    
      $display("\n\n\n========================================");
    $display("        Without Fork-Join_any");
    $display("========================================");
    
    //without fork-join
    display_start("Thread 6 started");
    display_end("Thread 6 Ended");
    display_start("Thread 7 started");
    display_end("Thread 7 Ended");
    display_start("Thread 8 started");
    display_end("Thread 8 Ended");
    display_start("Thread 9 started");
    display_end("Thread 9 Ended");
    display_start("Thread 10 started");
    display_end("Thread 10 Ended");
    
    
end
  
endmodule
/*
========================================
   Fork-Join_any With Disable_fork
========================================
	Thread 1 started at 10
	Thread 3 started at 10
	Thread 1 Ended at 20
	Thread 3 Ended at 20
	Thread 2 started at 30
	Thread 4 started at 30
	Thread 2 Ended at 40
	Thread 4 Ended at 40
------------------------------------
     Outside after Fork-Join_any
------------------------------------



========================================
  Fork-Join_any Without Disable_fork
========================================
	Thread 1 started at 80
	Thread 3 started at 80
	Thread 1 Ended at 90
	Thread 3 Ended at 90
	Thread 2 started at 100
	Thread 4 started at 100
	Thread 2 Ended at 110
	Thread 4 Ended at 110
------------------------------------
     Outside after Fork-Join_any
------------------------------------
	Thread 5 started at 120
	Thread 5 Ended at 130



========================================
        Without Fork-Join_any
========================================
	Thread 6 started at 150
	Thread 6 Ended at 160
	Thread 7 started at 170
	Thread 7 Ended at 180
	Thread 8 started at 190
	Thread 8 Ended at 200
	Thread 9 started at 210
	Thread 9 Ended at 220
	Thread 10 started at 230
	Thread 10 Ended at 240
*/

      
