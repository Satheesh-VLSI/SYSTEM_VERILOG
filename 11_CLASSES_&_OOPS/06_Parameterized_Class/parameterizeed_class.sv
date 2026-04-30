class Packet #(parameter width,depth);
  // Data members
  randc int address;
  
  rand int data;
  bit write;   // 1 = WRITE,0 = READ
  int read_data;
  
  int mem [];

  constraint addr_c {
    address inside {[0:depth-1]};
  }

  constraint data_c {
    if(write==0)
      data==0;
    else
      data inside {[0:((1<<width-1)-1)]};
    }

  
  // Constructor
  function new();
    this.mem=new[depth];  
  endfunction
  
  function void READ_WRITE();
    
    $display("============WRITING OPERATION===========");
    repeat(depth) begin
    write=1;
    this.randomize();
    display();
    end
    $display("============READING OPERATION===========");
    repeat(depth) begin
    write=0;
    this.randomize();
    display();
    end
     
  endfunction

  // Display method
  function void display();
    $display("   Address  : %0d",address);
    if (write) begin
      $display("   Operation: WRITE");
      $display("   Data     : %0d",data);
      mem[address]=data;
    end
    else begin
      $display("   Operation: READ");
      read_data= mem[address];
      $display("   Data     : %0d",read_data);
    end

    $display("-----------------------------");
  endfunction

endclass



module test;

  initial begin

    // Create packets
    Packet #(8,8) pkt1;
    Packet #(16,16) pkt2;
    Packet #(12,64) pkt3;
    
    $display("\n============================================"); 
    $display("           PARAMITERIZED CLASSES "); 
    $display("============================================\n\n"); 

    pkt1 = new();   
    pkt2 = new();    
    pkt3 = new();  
    $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"); 
    $display("       Packet Object 1");
    $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"); 
    pkt1.READ_WRITE();
    $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"); 
    $display("       Packet Object 2");
    $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"); 
    pkt2.READ_WRITE();
    $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"); 
    $display("       Packet Object 3");
    $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"); 
    pkt3.READ_WRITE();


  end

endmodule

/*
============================================
           PARAMITERIZED CLASSES 
============================================


XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
       Packet Object 1
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
============WRITING OPERATION===========
   Address  : 2
   Operation: WRITE
   Data     : 88
-----------------------------
   Address  : 3
   Operation: WRITE
   Data     : 69
-----------------------------
   Address  : 6
   Operation: WRITE
   Data     : 40
-----------------------------
   Address  : 4
   Operation: WRITE
   Data     : 6
-----------------------------
   Address  : 7
   Operation: WRITE
   Data     : 55
-----------------------------
   Address  : 5
   Operation: WRITE
   Data     : 59
-----------------------------
   Address  : 1
   Operation: WRITE
   Data     : 104
-----------------------------
   Address  : 0
   Operation: WRITE
   Data     : 119
-----------------------------
============READING OPERATION===========
   Address  : 5
   Operation: READ
   Data     : 59
-----------------------------
   Address  : 3
   Operation: READ
   Data     : 69
-----------------------------
   Address  : 0
   Operation: READ
   Data     : 119
-----------------------------
   Address  : 7
   Operation: READ
   Data     : 55
-----------------------------
   Address  : 4
   Operation: READ
   Data     : 6
-----------------------------
   Address  : 2
   Operation: READ
   Data     : 88
-----------------------------
   Address  : 6
   Operation: READ
   Data     : 40
-----------------------------
   Address  : 1
   Operation: READ
   Data     : 104
-----------------------------
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
       Packet Object 2
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
============WRITING OPERATION===========
   Address  : 7
   Operation: WRITE
   Data     : 17731
-----------------------------
   Address  : 15
   Operation: WRITE
   Data     : 7505
-----------------------------
   Address  : 6
   Operation: WRITE
   Data     : 16
-----------------------------
   Address  : 1
   Operation: WRITE
   Data     : 24399
-----------------------------
   Address  : 8
   Operation: WRITE
   Data     : 4143
-----------------------------
   Address  : 13
   Operation: WRITE
   Data     : 15428
-----------------------------
   Address  : 5
   Operation: WRITE
   Data     : 30168
-----------------------------
   Address  : 11
   Operation: WRITE
   Data     : 22815
-----------------------------
   Address  : 3
   Operation: WRITE
   Data     : 6122
-----------------------------
   Address  : 0
   Operation: WRITE
   Data     : 18970
-----------------------------
   Address  : 2
   Operation: WRITE
   Data     : 26969
-----------------------------
   Address  : 4
   Operation: WRITE
   Data     : 18585
-----------------------------
   Address  : 14
   Operation: WRITE
   Data     : 28545
-----------------------------
   Address  : 9
   Operation: WRITE
   Data     : 22633
-----------------------------
   Address  : 12
   Operation: WRITE
   Data     : 4843
-----------------------------
   Address  : 10
   Operation: WRITE
   Data     : 16641
-----------------------------
============READING OPERATION===========
   Address  : 4
   Operation: READ
   Data     : 18585
-----------------------------
   Address  : 6
   Operation: READ
   Data     : 16
-----------------------------
   Address  : 5
   Operation: READ
   Data     : 30168
-----------------------------
   Address  : 10
   Operation: READ
   Data     : 16641
-----------------------------
   Address  : 3
   Operation: READ
   Data     : 6122
-----------------------------
   Address  : 11
   Operation: READ
   Data     : 22815
-----------------------------
   Address  : 12
   Operation: READ
   Data     : 4843
-----------------------------
   Address  : 8
   Operation: READ
   Data     : 4143
-----------------------------
   Address  : 14
   Operation: READ
   Data     : 28545
-----------------------------
   Address  : 7
   Operation: READ
   Data     : 17731
-----------------------------
   Address  : 0
   Operation: READ
   Data     : 18970
-----------------------------
   Address  : 13
   Operation: READ
   Data     : 15428
-----------------------------
   Address  : 1
   Operation: READ
   Data     : 24399
-----------------------------
   Address  : 9
   Operation: READ
   Data     : 22633
-----------------------------
   Address  : 2
   Operation: READ
   Data     : 26969
-----------------------------
   Address  : 15
   Operation: READ
   Data     : 7505
-----------------------------
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
       Packet Object 3
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
============WRITING OPERATION===========
   Address  : 15
   Operation: WRITE
   Data     : 27
-----------------------------
   Address  : 13
   Operation: WRITE
   Data     : 1012
-----------------------------
   Address  : 24
   Operation: WRITE
   Data     : 910
-----------------------------
   Address  : 23
   Operation: WRITE
   Data     : 1487
-----------------------------
   Address  : 35
   Operation: WRITE
   Data     : 272
-----------------------------
   Address  : 1
   Operation: WRITE
   Data     : 1501
-----------------------------
   Address  : 34
   Operation: WRITE
   Data     : 1550
-----------------------------
   Address  : 55
   Operation: WRITE
   Data     : 1786
-----------------------------
   Address  : 42
   Operation: WRITE
   Data     : 396
-----------------------------
   Address  : 8
   Operation: WRITE
   Data     : 1783
-----------------------------
   Address  : 6
   Operation: WRITE
   Data     : 587
-----------------------------
   Address  : 4
   Operation: WRITE
   Data     : 83
-----------------------------
   Address  : 53
   Operation: WRITE
   Data     : 1008
-----------------------------
   Address  : 29
   Operation: WRITE
   Data     : 747
-----------------------------
   Address  : 10
   Operation: WRITE
   Data     : 1815
-----------------------------
   Address  : 14
   Operation: WRITE
   Data     : 88
-----------------------------
   Address  : 12
   Operation: WRITE
   Data     : 691
-----------------------------
   Address  : 30
   Operation: WRITE
   Data     : 1117
-----------------------------
   Address  : 16
   Operation: WRITE
   Data     : 678
-----------------------------
   Address  : 52
   Operation: WRITE
   Data     : 2033
-----------------------------
   Address  : 19
   Operation: WRITE
   Data     : 371
-----------------------------
   Address  : 47
   Operation: WRITE
   Data     : 1044
-----------------------------
   Address  : 46
   Operation: WRITE
   Data     : 1257
-----------------------------
   Address  : 5
   Operation: WRITE
   Data     : 1953
-----------------------------
   Address  : 25
   Operation: WRITE
   Data     : 1416
-----------------------------
   Address  : 60
   Operation: WRITE
   Data     : 1132
-----------------------------
   Address  : 20
   Operation: WRITE
   Data     : 304
-----------------------------
   Address  : 48
   Operation: WRITE
   Data     : 2012
-----------------------------
   Address  : 50
   Operation: WRITE
   Data     : 543
-----------------------------
   Address  : 0
   Operation: WRITE
   Data     : 817
-----------------------------
   Address  : 59
   Operation: WRITE
   Data     : 1201
-----------------------------
   Address  : 57
   Operation: WRITE
   Data     : 793
-----------------------------
   Address  : 33
   Operation: WRITE
   Data     : 1695
-----------------------------
   Address  : 31
   Operation: WRITE
   Data     : 1740
-----------------------------
   Address  : 28
   Operation: WRITE
   Data     : 1759
-----------------------------
   Address  : 37
   Operation: WRITE
   Data     : 630
-----------------------------
   Address  : 54
   Operation: WRITE
   Data     : 734
-----------------------------
   Address  : 22
   Operation: WRITE
   Data     : 491
-----------------------------
   Address  : 63
   Operation: WRITE
   Data     : 1087
-----------------------------
   Address  : 62
   Operation: WRITE
   Data     : 566
-----------------------------
   Address  : 36
   Operation: WRITE
   Data     : 1991
-----------------------------
   Address  : 18
   Operation: WRITE
   Data     : 115
-----------------------------
   Address  : 3
   Operation: WRITE
   Data     : 915
-----------------------------
   Address  : 32
   Operation: WRITE
   Data     : 840
-----------------------------
   Address  : 51
   Operation: WRITE
   Data     : 157
-----------------------------
   Address  : 21
   Operation: WRITE
   Data     : 1214
-----------------------------
   Address  : 17
   Operation: WRITE
   Data     : 662
-----------------------------
   Address  : 27
   Operation: WRITE
   Data     : 886
-----------------------------
   Address  : 44
   Operation: WRITE
   Data     : 110
-----------------------------
   Address  : 58
   Operation: WRITE
   Data     : 1200
-----------------------------
   Address  : 7
   Operation: WRITE
   Data     : 1063
-----------------------------
   Address  : 61
   Operation: WRITE
   Data     : 65
-----------------------------
   Address  : 41
   Operation: WRITE
   Data     : 1638
-----------------------------
   Address  : 40
   Operation: WRITE
   Data     : 907
-----------------------------
   Address  : 11
   Operation: WRITE
   Data     : 108
-----------------------------
   Address  : 9
   Operation: WRITE
   Data     : 59
-----------------------------
   Address  : 56
   Operation: WRITE
   Data     : 1164
-----------------------------
   Address  : 2
   Operation: WRITE
   Data     : 974
-----------------------------
   Address  : 45
   Operation: WRITE
   Data     : 1151
-----------------------------
   Address  : 38
   Operation: WRITE
   Data     : 683
-----------------------------
   Address  : 26
   Operation: WRITE
   Data     : 1413
-----------------------------
   Address  : 49
   Operation: WRITE
   Data     : 414
-----------------------------
   Address  : 43
   Operation: WRITE
   Data     : 1995
-----------------------------
   Address  : 39
   Operation: WRITE
   Data     : 977
-----------------------------
============READING OPERATION===========
   Address  : 16
   Operation: READ
   Data     : 678
-----------------------------
   Address  : 44
   Operation: READ
   Data     : 110
-----------------------------
   Address  : 38
   Operation: READ
   Data     : 683
-----------------------------
   Address  : 1
   Operation: READ
   Data     : 1501
-----------------------------
   Address  : 10
   Operation: READ
   Data     : 1815
-----------------------------
   Address  : 36
   Operation: READ
   Data     : 1991
-----------------------------
   Address  : 26
   Operation: READ
   Data     : 1413
-----------------------------
   Address  : 20
   Operation: READ
   Data     : 304
-----------------------------
   Address  : 39
   Operation: READ
   Data     : 977
-----------------------------
   Address  : 23
   Operation: READ
   Data     : 1487
-----------------------------
   Address  : 41
   Operation: READ
   Data     : 1638
-----------------------------
   Address  : 3
   Operation: READ
   Data     : 915
-----------------------------
   Address  : 0
   Operation: READ
   Data     : 817
-----------------------------
   Address  : 11
   Operation: READ
   Data     : 108
-----------------------------
   Address  : 55
   Operation: READ
   Data     : 1786
-----------------------------
   Address  : 24
   Operation: READ
   Data     : 910
-----------------------------
   Address  : 25
   Operation: READ
   Data     : 1416
-----------------------------
   Address  : 56
   Operation: READ
   Data     : 1164
-----------------------------
   Address  : 43
   Operation: READ
   Data     : 1995
-----------------------------
   Address  : 35
   Operation: READ
   Data     : 272
-----------------------------
   Address  : 50
   Operation: READ
   Data     : 543
-----------------------------
   Address  : 60
   Operation: READ
   Data     : 1132
-----------------------------
   Address  : 49
   Operation: READ
   Data     : 414
-----------------------------
   Address  : 32
   Operation: READ
   Data     : 840
-----------------------------
   Address  : 9
   Operation: READ
   Data     : 59
-----------------------------
   Address  : 63
   Operation: READ
   Data     : 1087
-----------------------------
   Address  : 14
   Operation: READ
   Data     : 88
-----------------------------
   Address  : 8
   Operation: READ
   Data     : 1783
-----------------------------
   Address  : 31
   Operation: READ
   Data     : 1740
-----------------------------
   Address  : 15
   Operation: READ
   Data     : 27
-----------------------------
   Address  : 18
   Operation: READ
   Data     : 115
-----------------------------
   Address  : 40
   Operation: READ
   Data     : 907
-----------------------------
   Address  : 51
   Operation: READ
   Data     : 157
-----------------------------
   Address  : 29
   Operation: READ
   Data     : 747
-----------------------------
   Address  : 21
   Operation: READ
   Data     : 1214
-----------------------------
   Address  : 42
   Operation: READ
   Data     : 396
-----------------------------
   Address  : 52
   Operation: READ
   Data     : 2033
-----------------------------
   Address  : 62
   Operation: READ
   Data     : 566
-----------------------------
   Address  : 2
   Operation: READ
   Data     : 974
-----------------------------
   Address  : 48
   Operation: READ
   Data     : 2012
-----------------------------
   Address  : 46
   Operation: READ
   Data     : 1257
-----------------------------
   Address  : 4
   Operation: READ
   Data     : 83
-----------------------------
   Address  : 12
   Operation: READ
   Data     : 691
-----------------------------
   Address  : 7
   Operation: READ
   Data     : 1063
-----------------------------
   Address  : 37
   Operation: READ
   Data     : 630
-----------------------------
   Address  : 5
   Operation: READ
   Data     : 1953
-----------------------------
   Address  : 59
   Operation: READ
   Data     : 1201
-----------------------------
   Address  : 22
   Operation: READ
   Data     : 491
-----------------------------
   Address  : 58
   Operation: READ
   Data     : 1200
-----------------------------
   Address  : 57
   Operation: READ
   Data     : 793
-----------------------------
   Address  : 47
   Operation: READ
   Data     : 1044
-----------------------------
   Address  : 45
   Operation: READ
   Data     : 1151
-----------------------------
   Address  : 61
   Operation: READ
   Data     : 65
-----------------------------
   Address  : 28
   Operation: READ
   Data     : 1759
-----------------------------
   Address  : 34
   Operation: READ
   Data     : 1550
-----------------------------
   Address  : 30
   Operation: READ
   Data     : 1117
-----------------------------
   Address  : 6
   Operation: READ
   Data     : 587
-----------------------------
   Address  : 53
   Operation: READ
   Data     : 1008
-----------------------------
   Address  : 54
   Operation: READ
   Data     : 734
-----------------------------
   Address  : 13
   Operation: READ
   Data     : 1012
-----------------------------
   Address  : 17
   Operation: READ
   Data     : 662
-----------------------------
   Address  : 19
   Operation: READ
   Data     : 371
-----------------------------
   Address  : 27
   Operation: READ
   Data     : 886
-----------------------------
   Address  : 33
   Operation: READ
   Data     : 1695
-----------------------------*/
