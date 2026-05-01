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
    
    
  }
  
  function push(int addr,data,bit write);
    this.addr=addr;
    this.data=data;
    this.write=write;
  endfunction
  
   function void display();
    $display("[TX] addr=%0d data=%0d write=%0d",addr,data,write);
  endfunction
  
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
    
    $display("Sending Start Bit...");
    $display("Sending Data : %0d",tr.data);
    $display("Sending Stop Bit...");
  endfunction
  
endclass:UART_driver

//CHILD 2
class SPI_driver extends Driver;
    function void drive();
      $display("\nSPI Driver");
      tr.display();
      $display("Driving SPI CLock...");
      $display("Sending Data : %0d through MOSI",tr.data);
      $display("Receiving Data through MISO....");
  endfunction
endclass:SPI_driver
               
//CHILD 3               
class Memory_driver extends Driver;
    function void drive();
      $display("\nMemory Driver");
      tr.display();
   
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
   end
 endmodule

/*

=========================================
      Virtual Methods : Functions
=========================================

Memory Driver
[TX] addr=21 data=22 write=1
Driving Write Operation : addr = 21 | data = 22 

UART Driver
[TX] addr=6 data=40 write=1
Sending Start Bit...
Sending Data : 40
Sending Stop Bit...

SPI Driver
[TX] addr=1 data=35 write=1
Driving SPI CLock...
Sending Data : 35 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=11 data=4 write=1
Driving Write Operation : addr = 11 | data = 4 

UART Driver
[TX] addr=46 data=2 write=1
Sending Start Bit...
Sending Data : 2
Sending Stop Bit...

SPI Driver
[TX] addr=77 data=21 write=1
Driving SPI CLock...
Sending Data : 21 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=13 data=32 write=1
Driving Write Operation : addr = 13 | data = 32 

UART Driver
[TX] addr=37 data=15 write=1
Sending Start Bit...
Sending Data : 15
Sending Stop Bit...

SPI Driver
[TX] addr=80 data=33 write=1
Driving SPI CLock...
Sending Data : 33 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=14 data=10 write=1
Driving Write Operation : addr = 14 | data = 10 

UART Driver
[TX] addr=25 data=0 write=1
Sending Start Bit...
Sending Data : 0
Sending Stop Bit...

SPI Driver
[TX] addr=96 data=2 write=1
Driving SPI CLock...
Sending Data : 2 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=8 data=43 write=1
Driving Write Operation : addr = 8 | data = 43 

UART Driver
[TX] addr=39 data=15 write=1
Sending Start Bit...
Sending Data : 15
Sending Stop Bit...

SPI Driver
[TX] addr=18 data=10 write=1
Driving SPI CLock...
Sending Data : 10 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=58 data=0 write=0
Driving Read Operation from addr = 58  

UART Driver
[TX] addr=99 data=14 write=1
Sending Start Bit...
Sending Data : 14
Sending Stop Bit...

SPI Driver
[TX] addr=73 data=6 write=1
Driving SPI CLock...
Sending Data : 6 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=55 data=23 write=1
Driving Write Operation : addr = 55 | data = 23 

UART Driver
[TX] addr=76 data=8 write=1
Sending Start Bit...
Sending Data : 8
Sending Stop Bit...

SPI Driver
[TX] addr=5 data=24 write=1
Driving SPI CLock...
Sending Data : 24 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=78 data=36 write=1
Driving Write Operation : addr = 78 | data = 36 

UART Driver
[TX] addr=24 data=46 write=1
Sending Start Bit...
Sending Data : 46
Sending Stop Bit...

SPI Driver
[TX] addr=29 data=28 write=1
Driving SPI CLock...
Sending Data : 28 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=6 data=45 write=1
Driving Write Operation : addr = 6 | data = 45 

UART Driver
[TX] addr=95 data=28 write=1
Sending Start Bit...
Sending Data : 28
Sending Stop Bit...

SPI Driver
[TX] addr=88 data=25 write=1
Driving SPI CLock...
Sending Data : 25 through MOSI
Receiving Data through MISO....

----------------------------------------------

Memory Driver
[TX] addr=9 data=38 write=1
Driving Write Operation : addr = 9 | data = 38 

UART Driver
[TX] addr=57 data=35 write=1
Sending Start Bit...
Sending Data : 35
Sending Stop Bit...

SPI Driver
[TX] addr=2 data=17 write=1
Driving SPI CLock...
Sending Data : 17 through MOSI
Receiving Data through MISO....

----------------------------------------------*/
