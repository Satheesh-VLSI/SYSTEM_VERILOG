module simple_task;
  byte in;
  bit prime;
  
  task automatic prime_or_not(input byte num,output bit yes);
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
  endtask
  
  task automatic display(input byte num,input bit yes);
    if(yes)
      $display("The Number %0d is a PRIME",num);
    else
      $display("The Number %0d is NOT A PRIME",num);
    $display("------------------------------------------");
  endtask
  
  initial begin
    
    $display("------------------------------------------");
    $display("       SIMPLE TASK - Prime or Not");
    $display("------------------------------------------");
    in=29; 
    prime_or_not(in,prime);
    display(in,prime);
    
    in=23;  
    prime_or_not(in,prime);
    display(in,prime);
    
    in=33; 
    prime_or_not(in,prime);
    display(in,prime); 
    
    in=10; 
    prime_or_not(in,prime);
    display(in,prime); 
    
    in=2; 
    prime_or_not(in,prime);
    display(in,prime);
  end 
endmodule

/*
------------------------------------------
       SIMPLE TASK - Prime or Not
------------------------------------------
The Number 29 is a PRIME
------------------------------------------
The Number 23 is a PRIME
------------------------------------------
The Number 33 is NOT A PRIME
------------------------------------------
The Number 10 is NOT A PRIME
------------------------------------------
The Number 2 is a PRIME
------------------------------------------*/



