
module disable_task;

  bit ack;
  
    // Main task
  task ack_wait();
    fork
      wait_for_ack();
      timeout();
    join
  endtask
  
  task wait_for_ack();
    
    wait(ack==1);
    $display("ACK received at time=%0t",$time);
    disable ack_wait;
  endtask

  task timeout();
    #100;
    $display("Timeout! at time=%0t",$time);
    disable ack_wait; 
  endtask


  initial begin
    
    $display("---------------------------------");
    $display("          Disable Task");
    $display("---------------------------------");
    fork
        ack_wait();

      begin
        #50;
        ack=1;
      end
    join
    #20;
     ack=0;  
   
    $display("---------------------------------");
    fork
        ack_wait();
      begin
        #150;
        ack=1;
      end
    join
   
    $display("---------------------------------"); 
     
    fork
        ack_wait();
      begin
        #150;
        ack=1;
      end
    join
    ack=0;
    
    $display("---------------------------------");
        fork
        ack_wait();
      begin
        #101;
        ack=1;
      end
    join
    
    $display("---------------------------------");

  end

endmodule

/*
---------------------------------
          Disable Task
---------------------------------
ACK received at time=50
---------------------------------
Timeout! at time=170
---------------------------------
ACK received at time=220
---------------------------------
Timeout! at time=470
---------------------------------
*/
