module process_core_demo;

  process p1,p2;

  task automatic task1();
    p1=process::self();   // capture this thread(process object)

    $display("[Task1] Started at %0t",$time);

    #100;
    $display("[Task1] Reached midpoint at %0t",$time);

    #100;
    $display("[Task1] Finished at %0t",$time);
  endtask


  task automatic task2();
    p2=process::self();   // capture this thread

    $display("[Task2] Started at %0t",$time);

    #250;
    $display("[Task2] Done at %0t",$time);
  endtask


  initial begin
    fork
      task1();
      task2();
    join_none

    #50;

    $display("---------------------------------------");
    $display("[MAIN] T1 status = %s", p1.status().name());
    $display("[MAIN] T2 status = %s", p2.status().name());
    $display("---------------------------------------");

    
    $display("[MAIN] Suspending T1 at %0t",$time);
    p1.suspend();

    #40;
    
    $display("---------------------------------------");

    $display("[MAIN] Resuming T1 at %0t",$time);
    p1.resume();
    $display("---------------------------------------");
    #60;

    $display("---------------------------------------");
    if (p2.status().name()=="WAITING") begin
      $display("[MAIN] Killing T2 at %0t",$time);
      p2.kill();
    end

    #20;

    $display("---------------------------------------");
    $display("[MAIN] Final status:");
    $display("T1 = %s", p1.status().name());
    $display("T2 = %s", p2.status().name());
    
    $display("---------------------------------------");
  end

endmodule

/*
[Task1] Started at 0
[Task2] Started at 0
---------------------------------------
[MAIN] T1 status = WAITING
[MAIN] T2 status = WAITING
---------------------------------------
[MAIN] Suspending T1 at 50
---------------------------------------
[MAIN] Resuming T1 at 90
---------------------------------------
[Task1] Reached midpoint at 140
---------------------------------------
[MAIN] Killing T2 at 150
---------------------------------------
[MAIN] Final status:
T1 = WAITING
T2 = KILLED
---------------------------------------
[Task1] Finished at 240
*/

