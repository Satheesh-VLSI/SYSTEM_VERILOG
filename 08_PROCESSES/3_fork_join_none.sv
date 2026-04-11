
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
    
    $display("------------------------------------");
    $display("          With Fork-Join_none");
    $display("------------------------------------");
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
    #50;
    #0;
    
    $display("------------------------------------");
    $display("        Without Fork-Join_none");
    $display("------------------------------------");
    
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
------------------------------------
          With Fork-Join_none
------------------------------------
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
------------------------------------
        Without Fork-Join_none
------------------------------------
	Thread 5 Ended at 60
	Thread 6 started at 60
	Thread 6 Ended at 70
	Thread 7 started at 80
	Thread 7 Ended at 90
	Thread 8 started at 100
	Thread 8 Ended at 110
	Thread 9 started at 120
	Thread 9 Ended at 130
	Thread 10 started at 140
	Thread 10 Ended at 150
*/

