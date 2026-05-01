class Transaction;
  rand int addr;
  rand int data;
  rand bit write;
  
  constraint c1{
    addr inside {[0:100]};
    if(write==1)
      data inside {[0:50]};
    else
      data==0;
    write dist {1:=5,0:=5};
    }
  
  function push(int addr,data,bit write);
    this.addr=addr;
    this.data=data;
    this.write=write;
  endfunction
  
   function void display();
    $display("[TX] addr=%0d data=%0d write=%0d",addr,data,write);
  endfunction
  
  
  
  static int tr_count;
  static int write_count;
  static int read_count;
  
  static function void update_stats(bit write);
    if(write)
      write_count++;
    else
      read_count++;
      
      tr_count++;
  endfunction:update_stats
  
  static function void display_stats();
    $display("+------------------------------------------+");
    $display("|          TRANSACTION STATISTICS          |");
    $display("+------------------------------------------+");
    $display("|  Total No. of Transactions : %0d          |", tr_count);
    $display("|  No. of Writes             : %0d          |", write_count);
    $display("|  No. of Reads              : %0d          |", read_count);
    $display("+------------------------------------------+");
      
  endfunction:display_stats
  
  
  static function void reset_stats();
      write_count=0;
      read_count=0;
      tr_count=0;
  endfunction:reset_stats
  
endclass:Transaction

//PARENT CLASS
class Driver;
  Transaction tr;
  
  virtual function void drive();
      $display("Base Driver: No DRiver");
  endfunction
endclass:Driver

//CHILD 1
class UART_driver extends Driver;
  function void drive();
    $display("\nUART Driver");
    
    tr.display();
    tr.update_stats(tr.write);
    if(tr.write)begin
      $display("Sending Start Bit...");
      $display("Sending Data : %0d",tr.data);
      $display("Sending Stop Bit...");end
    else begin
      $display("Receiving Start Bit...");
      $display("Receiving Data....");
      $display("Receiving Stop Bit...");end
  endfunction
  
endclass:UART_driver

//CHILD 2
class SPI_driver extends Driver;
    function void drive();
      $display("\nSPI Driver");
    
      tr.display();
      tr.update_stats(tr.write);
      if(tr.write)begin
        $display("Driving SPI CLock...");
        $display("Sending Data : %0d through MOSI",tr.data);
        $display("Receiving Data through MISO....");end
      else begin
        $display("Driving SPI CLock...");
        $display("Sending Addr : %0d through MOSI",tr.addr);
        $display("Receiving Data through MISO....");end
  endfunction
endclass:SPI_driver
               
//CHILD 3               
class Memory_driver extends Driver;
    function void drive();
      $display("\nMemory Driver");
    
      tr.display();
      tr.update_stats(tr.write);
      
      if(tr.write==1)
        $display("Driving Write Operation : addr = %0d | data = %0d ",tr.addr,tr.data);
      else
        $display("Driving Read Operation from addr = %0d  ",tr.addr);
  endfunction
endclass:Memory_driver
               
               
 module virtual_methods;
   initial begin
     Memory_driver drv1=new();
     UART_driver drv2=new();
     SPI_driver drv3=new();
      
     Transaction t[3];
     
     $display("=========================================");
     $display("      Virtual Methods : Functions");
     $display("=========================================");
     
     
     
     Transaction::reset_stats();
     repeat(10) begin
       foreach (t[i]) begin 
         t[i]=new();
         t[i].randomize();
         case(i)
           0:drv1.tr=t[i];
           1:drv2.tr=t[i];
           2:drv3.tr=t[i];
         endcase
       end
     
     
       drv1.drive();
       drv2.drive();
       drv3.drive();
     
       $display("\n----------------------------------------------");
     end
       
       Transaction::display_stats();
   end
 endmodule


/*
=========================================
      Virtual Methods : Functions
=========================================

Memory Driver
[TX] addr=21 data=13 write=1
Driving Write Operation : addr = 21 | data = 13 

UART Driver
[TX] addr=6 data=0 write=0
Receiving Start Bit...
Receiving Data....
Receiving Stop Bit...

SPI Driver
[TX] addr=1 data=0 write=0
Driving SPI CLock...
Sending Addr : 1 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=11 data=0 write=0
Driving Read Operation from addr = 11  

UART Driver
[TX] addr=46 data=0 write=0
Receiving Start Bit...
Receiving Data....
Receiving Stop Bit...

SPI Driver
[TX] addr=77 data=0 write=0
Driving SPI CLock...
Sending Addr : 77 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=13 data=0 write=0
Driving Read Operation from addr = 13  

UART Driver
[TX] addr=37 data=0 write=0
Receiving Start Bit...
Receiving Data....
Receiving Stop Bit...

SPI Driver
[TX] addr=80 data=34 write=1
Driving SPI CLock...
Sending Data : 34 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=14 data=0 write=0
Driving Read Operation from addr = 14  

UART Driver
[TX] addr=25 data=0 write=1
Sending Start Bit...
Sending Data : 0
Sending Stop Bit...

SPI Driver
[TX] addr=96 data=0 write=0
Driving SPI CLock...
Sending Addr : 96 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=8 data=0 write=0
Driving Read Operation from addr = 8  

UART Driver
[TX] addr=39 data=0 write=0
Receiving Start Bit...
Receiving Data....
Receiving Stop Bit...

SPI Driver
[TX] addr=18 data=0 write=0
Driving SPI CLock...
Sending Addr : 18 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=58 data=32 write=1
Driving Write Operation : addr = 58 | data = 32 

UART Driver
[TX] addr=99 data=21 write=1
Sending Start Bit...
Sending Data : 21
Sending Stop Bit...

SPI Driver
[TX] addr=73 data=5 write=1
Driving SPI CLock...
Sending Data : 5 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=55 data=15 write=1
Driving Write Operation : addr = 55 | data = 15 

UART Driver
[TX] addr=76 data=0 write=0
Receiving Start Bit...
Receiving Data....
Receiving Stop Bit...

SPI Driver
[TX] addr=5 data=24 write=1
Driving SPI CLock...
Sending Data : 24 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=78 data=33 write=1
Driving Write Operation : addr = 78 | data = 33 

UART Driver
[TX] addr=24 data=0 write=0
Receiving Start Bit...
Receiving Data....
Receiving Stop Bit...

SPI Driver
[TX] addr=29 data=0 write=0
Driving SPI CLock...
Sending Addr : 29 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=6 data=43 write=1
Driving Write Operation : addr = 6 | data = 43 

UART Driver
[TX] addr=95 data=25 write=1
Sending Start Bit...
Sending Data : 25
Sending Stop Bit...

SPI Driver
[TX] addr=88 data=26 write=1
Driving SPI CLock...
Sending Data : 26 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=9 data=37 write=1
Driving Write Operation : addr = 9 | data = 37 

UART Driver
[TX] addr=57 data=0 write=0
Receiving Start Bit...
Receiving Data....
Receiving Stop Bit...

SPI Driver
[TX] addr=2 data=0 write=0
Driving SPI CLock...
Sending Addr : 2 through MOSI
Receiving Data through MISO....

----------------------------------------------
+------------------------------------------+
|          TRANSACTION STATISTICS          |
+------------------------------------------+
|  Total No. of Transactions : 30          |
|  No. of Writes             : 13          |
|  No. of Reads              : 17          |
+------------------------------------------+
*/
