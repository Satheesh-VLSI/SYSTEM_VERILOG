module fork_join;
  
  task automatic display(input string a,b);
    #5;
    $display("\t%s at %0t",a,$time);
    #5
    $display("\t%s at %0t",b,$time);
  endtask
  
  initial begin
    //with fork-join
    
    $display("------------------------------------");
    $display("          With Fork-Join");
    $display("------------------------------------");
     fork
       display("Thread 1 started","Thread 1 Ended");
       display("Thread 2 started","Thread 2 Ended");
       display("Thread 3 started","Thread 3 Ended");
       display("Thread 4 started","Thread 4 Ended");
       display("Thread 5 started","Thread 5 Ended");
     join
        
    $display("------------------------------------");
    $display("        Without Fork-Join");
    $display("------------------------------------");
    
    //without fork-join
       display("Thread 1 started","Thread 1 Ended");
       display("Thread 2 started","Thread 2 Ended");
       display("Thread 3 started","Thread 3 Ended");
       display("Thread 4 started","Thread 4 Ended");
       display("Thread 5 started","Thread 5 Ended");
    
    
end
  
endmodule

/*
------------------------------------
          With Fork-Join
------------------------------------
	Thread 1 started at 5
	Thread 2 started at 5
	Thread 3 started at 5
	Thread 4 started at 5
	Thread 5 started at 5
	Thread 1 Ended at 10
	Thread 2 Ended at 10
	Thread 3 Ended at 10
	Thread 4 Ended at 10
	Thread 5 Ended at 10
------------------------------------
        Without Fork-Join
------------------------------------
	Thread 1 started at 15
	Thread 1 Ended at 20
	Thread 2 started at 25
	Thread 2 Ended at 30
	Thread 3 started at 35
	Thread 3 Ended at 40
	Thread 4 started at 45
	Thread 4 Ended at 50
	Thread 5 started at 55
	Thread 5 Ended at 60
*/

