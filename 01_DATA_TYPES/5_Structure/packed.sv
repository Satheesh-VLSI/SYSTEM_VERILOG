module packed_structure;
  
  typedef struct packed {
    int price;
    int storage;
    byte display ;
    bit [4:0] RAM;
    byte gpu;
  } laptop;
  
  laptop hp_15s;
  laptop hp_pavilion;
  laptop lenovo_ideapad;
  laptop mac_14;
  
  laptop laptop_t[5];
  initial begin 
    hp_15s='{52000,512,15,8,0};
    
    hp_pavilion='{price:60000,display:16,storage:512,RAM:8,gpu:4};
    
    lenovo_ideapad.price=40000;
    lenovo_ideapad.display=14;
    lenovo_ideapad.storage=256;
    lenovo_ideapad.RAM=4;
    lenovo_ideapad.gpu=0;
    
    mac_14.price=150000;
    mac_14.display=14;
    mac_14.storage=1024;
    mac_14.RAM=16;
    mac_14.gpu=4;
    
    $display("========================================");
    $display("             Packed Structure            ");
    $display("========================================");
    
    laptop_t[0] = hp_15s;
    laptop_t[1] = hp_pavilion;
    laptop_t[2] = lenovo_ideapad;
    laptop_t[3] = mac_14;
    foreach(laptop_t[i])begin
      
           $display("---------------------------------");
      case(i)
        0: $display("             HP 15S         ");
        1: $display("           HP pavilion    ");
        2: $display("          Lenovo ideapad ");
        3: $display("             MAC 14         ");
        default: $display("       no laptop         ");
      endcase
      
      $display("Price:%0d",laptop_t[i].price);
      $display("Display:%0d",laptop_t[i].display);
      $display("Storage:%0d",laptop_t[i].storage);
      $display("RAM:%0d",laptop_t[i].RAM);
      $display("GPU:%0d",laptop_t[i].gpu);
      
    end
    $display("\n\n---------------------------------");
    $display("       Adding two laptops\n\nHP_15S + HP_Pavilion");
    laptop_t [4]=hp_15s+hp_pavilion;
    
    $display("Price:%0d",laptop_t[4].price);
    $display("Display:%0d",laptop_t[4].display);
    $display("Storage:%0d",laptop_t[4].storage);
    $display("RAM:%0d",laptop_t[4].RAM);
    $display("GPU:%0d",laptop_t[4].gpu);
    
    
  
  end
  
  
endmodule
/*========================================
             Packed Structure            
========================================
---------------------------------
             HP 15S         
Price:52000
Display:15
Storage:512
RAM:8
GPU:0
---------------------------------
           HP pavilion    
Price:60000
Display:16
Storage:512
RAM:8
GPU:4
---------------------------------
          Lenovo ideapad 
Price:40000
Display:14
Storage:256
RAM:4
GPU:0
---------------------------------
             MAC 14         
Price:150000
Display:14
Storage:1024
RAM:16
GPU:4
---------------------------------
       no laptop         
Price:0
Display:0
Storage:0
RAM:0
GPU:0
---------------------------------
       Adding two laptops
       
HP_15S + HP_Pavilion
Price:112000
Display:31
Storage:1024
RAM:16
GPU:4
*/




