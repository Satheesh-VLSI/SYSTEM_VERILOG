
module calling_func_from_task;
  byte in;
  
  function automatic prime_or_not(input byte num,output bit yes);
    yes=1;
    if(num inside {0,1})
      yes=0;
    else begin 
      
      for(int i=2;i<num;i++)begin
        
        if((num%i)== 0)begin
          yes=0;
          break;
        end
        
      end
    end
  endfunction
  
  task automatic display(input byte num);
    bit prime;
    prime_or_not(in,prime);
    if(prime)
      $display("The Number %0d is a PRIME",num);
    else
      $display("The Number %0d is NOT A PRIME",num);
    $display("------------------------------------------");
  endtask
  
  initial begin
    
    $display("------------------------------------------");
    $display("     Calling a Function from a Task");
    $display("------------------------------------------");
    in=29; 
    display(in);
    
    in=23;  
    display(in);
    
    in=33; 
    display(in); 
    
    in=10; 
    display(in); 
    
    in=2; 
    display(in);
  end 
endmodule
/*
-----------------------------------------
#      Calling a Function from a Task
# ------------------------------------------
# The Number 29 is a PRIME
# ------------------------------------------
# The Number 23 is a PRIME
# ------------------------------------------
# The Number 33 is NOT A PRIME
# ------------------------------------------
# The Number 10 is NOT A PRIME
# ------------------------------------------
# The Number 2 is a PRIME
# ------------------------------------------*/
