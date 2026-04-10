module automatic_task;
  bit data_in[];
  bit stuffed[$];
  bit destuffed[$];
  
  
  task automatic stuffing(input bit data_in[],output bit stuff_out[$]);
    
    shortint count;
    
    foreach (data_in[i])begin
      stuff_out.push_back(data_in[i]);
      
      
      if(data_in[i]==1)
        count++;
      else 
        count=0;
        
        if(count==5)begin
          stuff_out.push_back(1'b0);
          count=0;
        end  
    end
  endtask  
  
  
  task automatic de_stuffing(input bit stuff_in[$],output bit de_stuff_out[$]);
    
    shortint count;
    bit skip;
    
    foreach (stuff_in[i])begin
      
      if(skip)begin
        skip=0;
        continue;
      end
      de_stuff_out.push_back(stuff_in[i]);
      
      if(stuff_in[i]==1)
        count++;
      else
        count=0;
              
      if(count==5)begin 
          count=0;
          skip=1;
        end
    end
    
  endtask
  
  initial begin
    
    $display("-------------------------------------------");
    $display(" AUTOMATIC TASK - Stuffing and De_Stuffing");
    $display("-------------------------------------------");
    data_in='{1,1,1,1,1,1,1,1}; 
    $display("Data = %0p",data_in);
    stuffing(data_in,stuffed);
    de_stuffing(stuffed,destuffed);
    $display("Stuffed data = %0p",stuffed);
    $display("De-Stuffed data = %0p",destuffed);
    
    
    $display("------------------------------------------");
    data_in='{1,0,1,1,1,1,1,1}; 
    $display("Data = %0p",data_in);
    stuffing(data_in,stuffed);
    de_stuffing(stuffed,destuffed);
    $display("Stuffed data = %0p",stuffed);
    $display("De-Stuffed data = %0p",destuffed);
    
    $display("------------------------------------------");
    data_in='{1,1,1,1,0,1,1,1,1,1,1}; 
    $display("Data = %0p",data_in);
    stuffing(data_in,stuffed);
    de_stuffing(stuffed,destuffed);
    $display("Stuffed data = %0p",stuffed);
    $display("De-Stuffed data = %0p",destuffed);
    $display("------------------------------------------");
    data_in='{1,1,0,1,1,1,1,1}; 
    $display("Data = %0p",data_in);
    stuffing(data_in,stuffed);
    de_stuffing(stuffed,destuffed);
    $display("Stuffed data = %0p",stuffed);
    $display("De-Stuffed data = %0p",destuffed);
    $display("------------------------------------------");
    data_in='{1,1,1,1,0,1,1,1}; 
    $display("Data = %0p",data_in);
    stuffing(data_in,stuffed);
    de_stuffing(stuffed,destuffed);
    $display("Stuffed data = %0p",stuffed);
    $display("De-Stuffed data = %0p",destuffed);
    $display("------------------------------------------");
    data_in='{1,1,0,1,1,1,1,1,0}; 
    $display("Data = %0p",data_in);
    stuffing(data_in,stuffed);
    de_stuffing(stuffed,destuffed);
    $display("Stuffed data = %0p",stuffed);
    $display("De-Stuffed data = %0p",destuffed);
    $display("------------------------------------------");
  end 
endmodule
/*
 -------------------------------------------
#  AUTOMATIC TASK - Stuffing and De_Stuffing
# -------------------------------------------
# Data = 1 1 1 1 1 1 1 1
# Stuffed data = 1 1 1 1 1 0 1 1 1
# De-Stuffed data = 1 1 1 1 1 1 1 1
# ------------------------------------------
# Data = 1 0 1 1 1 1 1 1
# Stuffed data = 1 0 1 1 1 1 1 0 1
# De-Stuffed data = 1 0 1 1 1 1 1 1
# ------------------------------------------
# Data = 1 1 1 1 0 1 1 1 1 1 1
# Stuffed data = 1 1 1 1 0 1 1 1 1 1 0 1
# De-Stuffed data = 1 1 1 1 0 1 1 1 1 1 1
# ------------------------------------------
# Data = 1 1 0 1 1 1 1 1
# Stuffed data = 1 1 0 1 1 1 1 1 0
# De-Stuffed data = 1 1 0 1 1 1 1 1
# ------------------------------------------
# Data = 1 1 1 1 0 1 1 1
# Stuffed data = 1 1 1 1 0 1 1 1
# De-Stuffed data = 1 1 1 1 0 1 1 1
# ------------------------------------------
# Data = 1 1 0 1 1 1 1 1 0
# Stuffed data = 1 1 0 1 1 1 1 1 0 0
# De-Stuffed data = 1 1 0 1 1 1 1 1 0
# ------------------------------------------
*/

