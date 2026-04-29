class Packet;
  const int width,depth;
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
     data inside {[0:(1<<width)-1]};
    }

  constraint c1{
    if(write==0)
      data==0;
               }
  
  // Constructor
  function new(int width,depth);
    this.width=width;
    this.depth=depth;
    this.mem=new[depth];  
  endfunction
  
  function void READ_WRITE();
    
    $display("============WRITING OPERATION===========");
    repeat(depth) begin
    this.randomize();
    write=1;
    display();
    end
    $display("============READING OPERATION===========");
    repeat(depth) begin
    this.randomize();
    write=0;
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
    Packet pkt1, pkt2, pkt3;
    
    $display("\n============================================"); 
    $display("        CONSTANT CLASS PROPERTIES"); 
    $display("============================================\n\n"); 

    pkt1 = new(8,8);   
    pkt2 = new(16,16);    
    pkt3 = new(8,100);  
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
        CONSTANT CLASS PROPERTIES
============================================


XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
       Packet Object 1
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
============WRITING OPERATION===========
   Address  : 2
   Operation: WRITE
   Data     : 0
-----------------------------
   Address  : 3
   Operation: WRITE
   Data     : 197
-----------------------------
   Address  : 6
   Operation: WRITE
   Data     : 40
-----------------------------
   Address  : 4
   Operation: WRITE
   Data     : 134
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
   Data     : 232
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
   Data     : 197
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
   Data     : 134
-----------------------------
   Address  : 2
   Operation: READ
   Data     : 0
-----------------------------
   Address  : 6
   Operation: READ
   Data     : 40
-----------------------------
   Address  : 1
   Operation: READ
   Data     : 232
-----------------------------
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
       Packet Object 2
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
============WRITING OPERATION===========
   Address  : 7
   Operation: WRITE
   Data     : 0
-----------------------------
   Address  : 15
   Operation: WRITE
   Data     : 40273
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
   Data     : 36911
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
   Data     : 51738
-----------------------------
   Address  : 2
   Operation: WRITE
   Data     : 59737
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
   Data     : 55401
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
   Data     : 36911
-----------------------------
   Address  : 14
   Operation: READ
   Data     : 28545
-----------------------------
   Address  : 7
   Operation: READ
   Data     : 0
-----------------------------
   Address  : 0
   Operation: READ
   Data     : 51738
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
   Data     : 55401
-----------------------------
   Address  : 2
   Operation: READ
   Data     : 59737
-----------------------------
   Address  : 15
   Operation: READ
   Data     : 40273
-----------------------------
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
       Packet Object 3
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
============WRITING OPERATION===========
   Address  : 24
   Operation: WRITE
   Data     : 0
-----------------------------
   Address  : 21
   Operation: WRITE
   Data     : 244
-----------------------------
   Address  : 37
   Operation: WRITE
   Data     : 142
-----------------------------
   Address  : 23
   Operation: WRITE
   Data     : 207
-----------------------------
   Address  : 54
   Operation: WRITE
   Data     : 16
-----------------------------
   Address  : 3
   Operation: WRITE
   Data     : 221
-----------------------------
   Address  : 52
   Operation: WRITE
   Data     : 14
-----------------------------
   Address  : 86
   Operation: WRITE
   Data     : 250
-----------------------------
   Address  : 65
   Operation: WRITE
   Data     : 140
-----------------------------
   Address  : 14
   Operation: WRITE
   Data     : 247
-----------------------------
   Address  : 11
   Operation: WRITE
   Data     : 75
-----------------------------
   Address  : 7
   Operation: WRITE
   Data     : 83
-----------------------------
   Address  : 83
   Operation: WRITE
   Data     : 240
-----------------------------
   Address  : 45
   Operation: WRITE
   Data     : 235
-----------------------------
   Address  : 17
   Operation: WRITE
   Data     : 23
-----------------------------
   Address  : 19
   Operation: WRITE
   Data     : 88
-----------------------------
   Address  : 16
   Operation: WRITE
   Data     : 179
-----------------------------
   Address  : 47
   Operation: WRITE
   Data     : 93
-----------------------------
   Address  : 26
   Operation: WRITE
   Data     : 166
-----------------------------
   Address  : 82
   Operation: WRITE
   Data     : 241
-----------------------------
   Address  : 22
   Operation: WRITE
   Data     : 115
-----------------------------
   Address  : 74
   Operation: WRITE
   Data     : 20
-----------------------------
   Address  : 73
   Operation: WRITE
   Data     : 233
-----------------------------
   Address  : 10
   Operation: WRITE
   Data     : 161
-----------------------------
   Address  : 28
   Operation: WRITE
   Data     : 136
-----------------------------
   Address  : 94
   Operation: WRITE
   Data     : 108
-----------------------------
   Address  : 29
   Operation: WRITE
   Data     : 48
-----------------------------
   Address  : 67
   Operation: WRITE
   Data     : 220
-----------------------------
   Address  : 78
   Operation: WRITE
   Data     : 31
-----------------------------
   Address  : 0
   Operation: WRITE
   Data     : 49
-----------------------------
   Address  : 85
   Operation: WRITE
   Data     : 177
-----------------------------
   Address  : 89
   Operation: WRITE
   Data     : 25
-----------------------------
   Address  : 51
   Operation: WRITE
   Data     : 159
-----------------------------
   Address  : 39
   Operation: WRITE
   Data     : 204
-----------------------------
   Address  : 38
   Operation: WRITE
   Data     : 223
-----------------------------
   Address  : 57
   Operation: WRITE
   Data     : 118
-----------------------------
   Address  : 84
   Operation: WRITE
   Data     : 222
-----------------------------
   Address  : 35
   Operation: WRITE
   Data     : 235
-----------------------------
   Address  : 99
   Operation: WRITE
   Data     : 63
-----------------------------
   Address  : 93
   Operation: WRITE
   Data     : 54
-----------------------------
   Address  : 49
   Operation: WRITE
   Data     : 199
-----------------------------
   Address  : 33
   Operation: WRITE
   Data     : 115
-----------------------------
   Address  : 6
   Operation: WRITE
   Data     : 147
-----------------------------
   Address  : 48
   Operation: WRITE
   Data     : 72
-----------------------------
   Address  : 80
   Operation: WRITE
   Data     : 157
-----------------------------
   Address  : 34
   Operation: WRITE
   Data     : 190
-----------------------------
   Address  : 31
   Operation: WRITE
   Data     : 150
-----------------------------
   Address  : 30
   Operation: WRITE
   Data     : 118
-----------------------------
   Address  : 70
   Operation: WRITE
   Data     : 110
-----------------------------
   Address  : 91
   Operation: WRITE
   Data     : 176
-----------------------------
   Address  : 9
   Operation: WRITE
   Data     : 39
-----------------------------
   Address  : 98
   Operation: WRITE
   Data     : 65
-----------------------------
   Address  : 63
   Operation: WRITE
   Data     : 102
-----------------------------
   Address  : 64
   Operation: WRITE
   Data     : 139
-----------------------------
   Address  : 27
   Operation: WRITE
   Data     : 108
-----------------------------
   Address  : 20
   Operation: WRITE
   Data     : 59
-----------------------------
   Address  : 92
   Operation: WRITE
   Data     : 140
-----------------------------
   Address  : 12
   Operation: WRITE
   Data     : 206
-----------------------------
   Address  : 75
   Operation: WRITE
   Data     : 127
-----------------------------
   Address  : 41
   Operation: WRITE
   Data     : 171
-----------------------------
   Address  : 18
   Operation: WRITE
   Data     : 133
-----------------------------
   Address  : 81
   Operation: WRITE
   Data     : 158
-----------------------------
   Address  : 97
   Operation: WRITE
   Data     : 203
-----------------------------
   Address  : 15
   Operation: WRITE
   Data     : 209
-----------------------------
   Address  : 40
   Operation: WRITE
   Data     : 131
-----------------------------
   Address  : 50
   Operation: WRITE
   Data     : 234
-----------------------------
   Address  : 44
   Operation: WRITE
   Data     : 96
-----------------------------
   Address  : 1
   Operation: WRITE
   Data     : 7
-----------------------------
   Address  : 13
   Operation: WRITE
   Data     : 18
-----------------------------
   Address  : 43
   Operation: WRITE
   Data     : 117
-----------------------------
   Address  : 60
   Operation: WRITE
   Data     : 144
-----------------------------
   Address  : 46
   Operation: WRITE
   Data     : 111
-----------------------------
   Address  : 68
   Operation: WRITE
   Data     : 203
-----------------------------
   Address  : 53
   Operation: WRITE
   Data     : 69
-----------------------------
   Address  : 69
   Operation: WRITE
   Data     : 47
-----------------------------
   Address  : 4
   Operation: WRITE
   Data     : 247
-----------------------------
   Address  : 2
   Operation: WRITE
   Data     : 229
-----------------------------
   Address  : 32
   Operation: WRITE
   Data     : 129
-----------------------------
   Address  : 79
   Operation: WRITE
   Data     : 181
-----------------------------
   Address  : 58
   Operation: WRITE
   Data     : 18
-----------------------------
   Address  : 56
   Operation: WRITE
   Data     : 38
-----------------------------
   Address  : 90
   Operation: WRITE
   Data     : 7
-----------------------------
   Address  : 72
   Operation: WRITE
   Data     : 31
-----------------------------
   Address  : 62
   Operation: WRITE
   Data     : 100
-----------------------------
   Address  : 77
   Operation: WRITE
   Data     : 137
-----------------------------
   Address  : 95
   Operation: WRITE
   Data     : 98
-----------------------------
   Address  : 71
   Operation: WRITE
   Data     : 60
-----------------------------
   Address  : 55
   Operation: WRITE
   Data     : 4
-----------------------------
   Address  : 8
   Operation: WRITE
   Data     : 40
-----------------------------
   Address  : 96
   Operation: WRITE
   Data     : 128
-----------------------------
   Address  : 36
   Operation: WRITE
   Data     : 118
-----------------------------
   Address  : 5
   Operation: WRITE
   Data     : 42
-----------------------------
   Address  : 61
   Operation: WRITE
   Data     : 153
-----------------------------
   Address  : 42
   Operation: WRITE
   Data     : 115
-----------------------------
   Address  : 59
   Operation: WRITE
   Data     : 10
-----------------------------
   Address  : 76
   Operation: WRITE
   Data     : 104
-----------------------------
   Address  : 87
   Operation: WRITE
   Data     : 180
-----------------------------
   Address  : 66
   Operation: WRITE
   Data     : 226
-----------------------------
   Address  : 25
   Operation: WRITE
   Data     : 60
-----------------------------
   Address  : 88
   Operation: WRITE
   Data     : 210
-----------------------------
============READING OPERATION===========
   Address  : 79
   Operation: READ
   Data     : 181
-----------------------------
   Address  : 92
   Operation: READ
   Data     : 140
-----------------------------
   Address  : 9
   Operation: READ
   Data     : 39
-----------------------------
   Address  : 68
   Operation: READ
   Data     : 203
-----------------------------
   Address  : 74
   Operation: READ
   Data     : 20
-----------------------------
   Address  : 11
   Operation: READ
   Data     : 75
-----------------------------
   Address  : 37
   Operation: READ
   Data     : 142
-----------------------------
   Address  : 30
   Operation: READ
   Data     : 118
-----------------------------
   Address  : 61
   Operation: READ
   Data     : 153
-----------------------------
   Address  : 2
   Operation: READ
   Data     : 229
-----------------------------
   Address  : 88
   Operation: READ
   Data     : 210
-----------------------------
   Address  : 14
   Operation: READ
   Data     : 247
-----------------------------
   Address  : 87
   Operation: READ
   Data     : 180
-----------------------------
   Address  : 86
   Operation: READ
   Data     : 250
-----------------------------
   Address  : 69
   Operation: READ
   Data     : 47
-----------------------------
   Address  : 67
   Operation: READ
   Data     : 220
-----------------------------
   Address  : 96
   Operation: READ
   Data     : 128
-----------------------------
   Address  : 35
   Operation: READ
   Data     : 235
-----------------------------
   Address  : 72
   Operation: READ
   Data     : 31
-----------------------------
   Address  : 53
   Operation: READ
   Data     : 69
-----------------------------
   Address  : 8
   Operation: READ
   Data     : 40
-----------------------------
   Address  : 98
   Operation: READ
   Data     : 65
-----------------------------
   Address  : 81
   Operation: READ
   Data     : 158
-----------------------------
   Address  : 3
   Operation: READ
   Data     : 221
-----------------------------
   Address  : 6
   Operation: READ
   Data     : 147
-----------------------------
   Address  : 7
   Operation: READ
   Data     : 83
-----------------------------
   Address  : 1
   Operation: READ
   Data     : 7
-----------------------------
   Address  : 93
   Operation: READ
   Data     : 54
-----------------------------
   Address  : 12
   Operation: READ
   Data     : 206
-----------------------------
   Address  : 39
   Operation: READ
   Data     : 204
-----------------------------
   Address  : 51
   Operation: READ
   Data     : 159
-----------------------------
   Address  : 26
   Operation: READ
   Data     : 166
-----------------------------
   Address  : 63
   Operation: READ
   Data     : 102
-----------------------------
   Address  : 25
   Operation: READ
   Data     : 60
-----------------------------
   Address  : 95
   Operation: READ
   Data     : 98
-----------------------------
   Address  : 24
   Operation: READ
   Data     : 0
-----------------------------
   Address  : 65
   Operation: READ
   Data     : 140
-----------------------------
   Address  : 16
   Operation: READ
   Data     : 179
-----------------------------
   Address  : 83
   Operation: READ
   Data     : 240
-----------------------------
   Address  : 76
   Operation: READ
   Data     : 104
-----------------------------
   Address  : 66
   Operation: READ
   Data     : 226
-----------------------------
   Address  : 21
   Operation: READ
   Data     : 244
-----------------------------
   Address  : 45
   Operation: READ
   Data     : 235
-----------------------------
   Address  : 80
   Operation: READ
   Data     : 157
-----------------------------
   Address  : 15
   Operation: READ
   Data     : 209
-----------------------------
   Address  : 77
   Operation: READ
   Data     : 137
-----------------------------
   Address  : 29
   Operation: READ
   Data     : 48
-----------------------------
   Address  : 48
   Operation: READ
   Data     : 72
-----------------------------
   Address  : 50
   Operation: READ
   Data     : 234
-----------------------------
   Address  : 32
   Operation: READ
   Data     : 129
-----------------------------
   Address  : 52
   Operation: READ
   Data     : 14
-----------------------------
   Address  : 70
   Operation: READ
   Data     : 110
-----------------------------
   Address  : 20
   Operation: READ
   Data     : 59
-----------------------------
   Address  : 34
   Operation: READ
   Data     : 190
-----------------------------
   Address  : 41
   Operation: READ
   Data     : 171
-----------------------------
   Address  : 33
   Operation: READ
   Data     : 115
-----------------------------
   Address  : 73
   Operation: READ
   Data     : 233
-----------------------------
   Address  : 57
   Operation: READ
   Data     : 118
-----------------------------
   Address  : 31
   Operation: READ
   Data     : 150
-----------------------------
   Address  : 55
   Operation: READ
   Data     : 4
-----------------------------
   Address  : 40
   Operation: READ
   Data     : 131
-----------------------------
   Address  : 84
   Operation: READ
   Data     : 222
-----------------------------
   Address  : 36
   Operation: READ
   Data     : 118
-----------------------------
   Address  : 38
   Operation: READ
   Data     : 223
-----------------------------
   Address  : 18
   Operation: READ
   Data     : 133
-----------------------------
   Address  : 89
   Operation: READ
   Data     : 25
-----------------------------
   Address  : 99
   Operation: READ
   Data     : 63
-----------------------------
   Address  : 71
   Operation: READ
   Data     : 60
-----------------------------
   Address  : 90
   Operation: READ
   Data     : 7
-----------------------------
   Address  : 43
   Operation: READ
   Data     : 117
-----------------------------
   Address  : 85
   Operation: READ
   Data     : 177
-----------------------------
   Address  : 62
   Operation: READ
   Data     : 100
-----------------------------
   Address  : 4
   Operation: READ
   Data     : 247
-----------------------------
   Address  : 46
   Operation: READ
   Data     : 111
-----------------------------
   Address  : 82
   Operation: READ
   Data     : 241
-----------------------------
   Address  : 49
   Operation: READ
   Data     : 199
-----------------------------
   Address  : 59
   Operation: READ
   Data     : 10
-----------------------------
   Address  : 97
   Operation: READ
   Data     : 203
-----------------------------
   Address  : 56
   Operation: READ
   Data     : 38
-----------------------------
   Address  : 60
   Operation: READ
   Data     : 144
-----------------------------
   Address  : 94
   Operation: READ
   Data     : 108
-----------------------------
   Address  : 5
   Operation: READ
   Data     : 42
-----------------------------
   Address  : 22
   Operation: READ
   Data     : 115
-----------------------------
   Address  : 13
   Operation: READ
   Data     : 18
-----------------------------
   Address  : 0
   Operation: READ
   Data     : 49
-----------------------------
   Address  : 17
   Operation: READ
   Data     : 23
-----------------------------
   Address  : 42
   Operation: READ
   Data     : 115
-----------------------------
   Address  : 58
   Operation: READ
   Data     : 18
-----------------------------
   Address  : 28
   Operation: READ
   Data     : 136
-----------------------------
   Address  : 64
   Operation: READ
   Data     : 139
-----------------------------
   Address  : 78
   Operation: READ
   Data     : 31
-----------------------------
   Address  : 44
   Operation: READ
   Data     : 96
-----------------------------
   Address  : 54
   Operation: READ
   Data     : 16
-----------------------------
   Address  : 27
   Operation: READ
   Data     : 108
-----------------------------
   Address  : 75
   Operation: READ
   Data     : 127
-----------------------------
   Address  : 47
   Operation: READ
   Data     : 93
-----------------------------
   Address  : 23
   Operation: READ
   Data     : 207
-----------------------------
   Address  : 10
   Operation: READ
   Data     : 161
-----------------------------
   Address  : 19
   Operation: READ
   Data     : 88
-----------------------------
   Address  : 91
   Operation: READ
   Data     : 176
-----------------------------*/
