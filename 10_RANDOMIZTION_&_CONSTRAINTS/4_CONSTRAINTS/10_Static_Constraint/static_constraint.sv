

module static_constraint;

  class packet;

    rand int addr;
    rand int data;
    static bit [1:0] flag;

    
    constraint addr_c {
      addr inside {[100:200]};
    }

    
    static constraint data_c {
        flag==0 ->data inside {[1:10]};
        flag==1 -> data inside {[11:20]};
        flag==2 -> data inside {[21:30]};
        flag==3 -> data inside {[31:40]};
    }
    

  endclass


  initial begin
    packet p1 = new();
    packet p2 = new();

    bit [1:0] i=0;
    integer j=0;
    
    $display("=============================================");
    $display("             STATIC CONSTRAINT");
    $display("=============================================");
    
    repeat(10)begin
    packet::flag=i;
    p1.randomize();
    p2.randomize();
      p1.data_c.constraint_mode(i[0]);
      p1.addr_c.constraint_mode(i[0]);
      $display("Iteration %0d",j);
    $display("p1: addr=%0d data=%0d", p1.addr, p1.data);
    $display("p2: addr=%0d data=%0d", p2.addr, p2.data);
      $display("------------------------------------------------");
      i=i+1;
      j=j+1;
    end
  end

endmodule

/*
=============================================
             STATIC CONSTRAINT
=============================================
Iteration 0
p1: addr=102 data=9
p2: addr=163 data=10
------------------------------------------------
Iteration 1
p1: addr=-846951830 data=-1735705120
p2: addr=170 data=-1270926582
------------------------------------------------
Iteration 2
p1: addr=114 data=25
p2: addr=141 data=25
------------------------------------------------
Iteration 3
p1: addr=1178415222 data=776763070
p2: addr=140 data=1287750923
------------------------------------------------
Iteration 4
p1: addr=150 data=7
p2: addr=139 data=6
------------------------------------------------
Iteration 5
p1: addr=-655980242 data=-1306539236
p2: addr=186 data=-105799214
------------------------------------------------
Iteration 6
p1: addr=172 data=22
p2: addr=139 data=25
------------------------------------------------
Iteration 7
p1: addr=1357336304 data=-465524094
p2: addr=160 data=-437028043
------------------------------------------------
Iteration 8
p1: addr=195 data=9
p2: addr=128 data=7
------------------------------------------------
Iteration 9
p1: addr=1540140616 data=984902557
p2: addr=173 data=835037322
------------------------------------------------*/
