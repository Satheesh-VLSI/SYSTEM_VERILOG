module packed_structure;
  
  typedef struct packed {
    int price;
    int storage;
    byte display ;
    bit [3:0] RAM;
    byte gpu;
  } laptop;
  
  laptop hp_15s;
  laptop hp_pavilion;
  laptop lenovo_ideapad;
  laptop mac_14;
  
  laptop laptop_t[4];
  initial begin 
    hp_15s='{52000,520,15,8,0};
    
    hp_pavilion='{price:60000,display:14.2,storage:512,RAM:8,gpu:4};
    
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
    
    
  
  end
endmodule

/*========================================
             Packed Structure            
========================================
---------------------------------
             HP 15S         
Price:52000
Display:15
Storage:520
RAM:8
GPU:0
---------------------------------
           HP pavilion    
Price:60000
Display:14
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
RAM:0
GPU:4*/
