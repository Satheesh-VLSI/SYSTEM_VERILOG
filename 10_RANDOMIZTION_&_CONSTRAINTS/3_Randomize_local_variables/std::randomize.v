
module std_randomize;

  class transaction;

    rand  logic [3:0] addr;     // random address
    randc logic [1:0] id;       // slave ID (0–3)
    logic flag;

  endclass


  logic write;    // read/write control
  logic [7:0] data;     // data
  transaction tr;

  initial begin
    tr = new();

    $display("=========================================");
    $display("     RANDOM VARIABLES: std::randomize");
    $display("=========================================");
    repeat(10) begin
      std::randomize(write,data,tr.flag);
      if (tr.randomize()) begin
        if (write)
          $display("WRITE | ID=%0d ADDR=%0d DATA=%0d FLAG=%B",tr.id,tr.addr,data,tr.flag);
        else
          $display("READ  | ID=%0d ADDR=%0d FLAG=%B",tr.id,tr.addr,tr.flag);

      end
      else begin
        $display("Randomization FAILED");
      end

      $display("--------------------------------------");
    end

  end

endmodule


/*
=========================================
     RANDOM VARIABLES: std::randomize
=========================================
WRITE | ID=2 ADDR=9 DATA=46 FLAG=0
--------------------------------------
WRITE | ID=0 ADDR=11 DATA=4 FLAG=1
--------------------------------------
READ  | ID=3 ADDR=10 FLAG=1
--------------------------------------
READ  | ID=1 ADDR=7 FLAG=1
--------------------------------------
WRITE | ID=2 ADDR=0 DATA=196 FLAG=1
--------------------------------------
WRITE | ID=1 ADDR=3 DATA=175 FLAG=0
--------------------------------------
READ  | ID=0 ADDR=10 FLAG=1
--------------------------------------
READ  | ID=3 ADDR=3 FLAG=1
--------------------------------------
READ  | ID=1 ADDR=0 FLAG=0
--------------------------------------
WRITE | ID=0 ADDR=9 DATA=182 FLAG=1
--------------------------------------
*/


