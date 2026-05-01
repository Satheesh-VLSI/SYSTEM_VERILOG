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
    
    write dist {1:=5,0:=4};
    
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
   
      if(tr.write==1)
        $display("Driving Write Operation : addr = %0d | data = %0d ",tr.addr,tr.data);
      else
        $display("Driving Read Operation from addr = %0d  ",tr.addr);
  endfunction
endclass:Memory_driver
               
               
 module virtual_methods;
   
   initial begin
     Transaction t[3];
     Driver drv;
     
     $display("=========================================");
     $display("           Virtual Methods");
     $display("=========================================");
     repeat(10) begin
       foreach (t[i]) begin 
         t[i]=new();
         t[i].randomize();
         case(i)
           0: begin 
                    Memory_driver m=new();;
                    drv=m; end
           1: begin 
                    UART_driver u=new();;
                    drv=u; end
           2: begin 
                    SPI_driver s=new();;
                    drv=s; end
         endcase
     
     
       drv.tr=t[i];
         drv.drive();
       end
     
       $display("----------------------------------------------");
     end
   end
 endmodule


/*
# KERNEL: =========================================
# KERNEL:            Virtual Methods
# KERNEL: =========================================
# KERNEL: 
# KERNEL: Memory Driver
# KERNEL: [TX] addr=17 data=21 write=1
# KERNEL: Driving Write Operation : addr = 17 | data = 21 
# KERNEL: 
# KERNEL: UART Driver
# KERNEL: [TX] addr=81 data=0 write=0
# KERNEL: Receiving Start Bit...
# KERNEL: Receiving Data....
# KERNEL: Receiving Stop Bit...
# KERNEL: 
# KERNEL: SPI Driver
# KERNEL: [TX] addr=59 data=30 write=1
# KERNEL: Driving SPI CLock...
# KERNEL: Sending Data : 30 through MOSI
# KERNEL: Receiving Data through MISO....
# KERNEL: ----------------------------------------------
# KERNEL: 
# KERNEL: Memory Driver
# KERNEL: [TX] addr=94 data=12 write=1
# KERNEL: Driving Write Operation : addr = 94 | data = 12 
# KERNEL: 
# KERNEL: UART Driver
# KERNEL: [TX] addr=99 data=0 write=0
# KERNEL: Receiving Start Bit...
# KERNEL: Receiving Data....
# KERNEL: Receiving Stop Bit...
# KERNEL: 
# KERNEL: SPI Driver
# KERNEL: [TX] addr=12 data=38 write=1
# KERNEL: Driving SPI CLock...
# KERNEL: Sending Data : 38 through MOSI
# KERNEL: Receiving Data through MISO....
# KERNEL: ----------------------------------------------
# KERNEL: 
# KERNEL: Memory Driver
# KERNEL: [TX] addr=52 data=0 write=0
# KERNEL: Driving Read Operation from addr = 52  
# KERNEL: 
# KERNEL: UART Driver
# KERNEL: [TX] addr=54 data=0 write=0
# KERNEL: Receiving Start Bit...
# KERNEL: Receiving Data....
# KERNEL: Receiving Stop Bit...
# KERNEL: 
# KERNEL: SPI Driver
# KERNEL: [TX] addr=62 data=32 write=1
# KERNEL: Driving SPI CLock...
# KERNEL: Sending Data : 32 through MOSI
# KERNEL: Receiving Data through MISO....
# KERNEL: ----------------------------------------------
# KERNEL: 
# KERNEL: Memory Driver
# KERNEL: [TX] addr=23 data=0 write=0
# KERNEL: Driving Read Operation from addr = 23  
# KERNEL: 
# KERNEL: UART Driver
# KERNEL: [TX] addr=75 data=42 write=1
# KERNEL: Sending Start Bit...
# KERNEL: Sending Data : 42
# KERNEL: Sending Stop Bit...
# KERNEL: 
# KERNEL: SPI Driver
# KERNEL: [TX] addr=79 data=24 write=1
# KERNEL: Driving SPI CLock...
# KERNEL: Sending Data : 24 through MOSI
# KERNEL: Receiving Data through MISO....
# KERNEL: ----------------------------------------------
# KERNEL: 
# KERNEL: Memory Driver
# KERNEL: [TX] addr=26 data=7 write=1
# KERNEL: Driving Write Operation : addr = 26 | data = 7 
# KERNEL: 
# KERNEL: UART Driver
# KERNEL: [TX] addr=91 data=26 write=1
# KERNEL: Sending Start Bit...
# KERNEL: Sending Data : 26
# KERNEL: Sending Stop Bit...
# KERNEL: 
# KERNEL: SPI Driver
# KERNEL: [TX] addr=89 data=44 write=1
# KERNEL: Driving SPI CLock...
# KERNEL: Sending Data : 44 through MOSI
# KERNEL: Receiving Data through MISO....
# KERNEL: ----------------------------------------------
# KERNEL: 
# KERNEL: Memory Driver
# KERNEL: [TX] addr=8 data=39 write=1
# KERNEL: Driving Write Operation : addr = 8 | data = 39 
# KERNEL: 
# KERNEL: UART Driver
# KERNEL: [TX] addr=71 data=35 write=1
# KERNEL: Sending Start Bit...
# KERNEL: Sending Data : 35
# KERNEL: Sending Stop Bit...
# KERNEL: 
# KERNEL: SPI Driver
# KERNEL: [TX] addr=61 data=0 write=0
# KERNEL: Driving SPI CLock...
# KERNEL: Sending Addr : 61 through MOSI
# KERNEL: Receiving Data through MISO....
# KERNEL: ----------------------------------------------
# KERNEL: 
# KERNEL: Memory Driver
# KERNEL: [TX] addr=61 data=0 write=0
# KERNEL: Driving Read Operation from addr = 61  
# KERNEL: 
# KERNEL: UART Driver
# KERNEL: [TX] addr=17 data=13 write=1
# KERNEL: Sending Start Bit...
# KERNEL: Sending Data : 13
# KERNEL: Sending Stop Bit...
# KERNEL: 
# KERNEL: SPI Driver
# KERNEL: [TX] addr=91 data=0 write=0
# KERNEL: Driving SPI CLock...
# KERNEL: Sending Addr : 91 through MOSI
# KERNEL: Receiving Data through MISO....
# KERNEL: ----------------------------------------------
# KERNEL: 
# KERNEL: Memory Driver
# KERNEL: [TX] addr=21 data=22 write=1
# KERNEL: Driving Write Operation : addr = 21 | data = 22 
# KERNEL: 
# KERNEL: UART Driver
# KERNEL: [TX] addr=67 data=0 write=0
# KERNEL: Receiving Start Bit...
# KERNEL: Receiving Data....
# KERNEL: Receiving Stop Bit...
# KERNEL: 
# KERNEL: SPI Driver
# KERNEL: [TX] addr=1 data=0 write=0
# KERNEL: Driving SPI CLock...
# KERNEL: Sending Addr : 1 through MOSI
# KERNEL: Receiving Data through MISO....
# KERNEL: ----------------------------------------------
# KERNEL: 
# KERNEL: Memory Driver
# KERNEL: [TX] addr=94 data=0 write=0
# KERNEL: Driving Read Operation from addr = 94  
# KERNEL: 
# KERNEL: UART Driver
# KERNEL: [TX] addr=52 data=0 write=0
# KERNEL: Receiving Start Bit...
# KERNEL: Receiving Data....
# KERNEL: Receiving Stop Bit...
# KERNEL: 
# KERNEL: SPI Driver
# KERNEL: [TX] addr=70 data=0 write=0
# KERNEL: Driving SPI CLock...
# KERNEL: Sending Addr : 70 through MOSI
# KERNEL: Receiving Data through MISO....
# KERNEL: ----------------------------------------------
# KERNEL: 
# KERNEL: Memory Driver
# KERNEL: [TX] addr=37 data=0 write=0
# KERNEL: Driving Read Operation from addr = 37  
# KERNEL: 
# KERNEL: UART Driver
# KERNEL: [TX] addr=82 data=0 write=0
# KERNEL: Receiving Start Bit...
# KERNEL: Receiving Data....
# KERNEL: Receiving Stop Bit...
# KERNEL: 
# KERNEL: SPI Driver
# KERNEL: [TX] addr=24 data=10 write=1
# KERNEL: Driving SPI CLock...
# KERNEL: Sending Data : 10 through MOSI
# KERNEL: Receiving Data through MISO....
# KERNEL: ----------------------------------------------*/
