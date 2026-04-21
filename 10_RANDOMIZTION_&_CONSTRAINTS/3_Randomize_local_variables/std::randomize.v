

module std_randomize;

  class transaction;

    rand  logic [3:0] addr;     // random address
    randc logic [1:0] id;       // slave ID (0–3)


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
    std::randomize(write,data);
      if (tr.randomize()) begin
        if (write)
          $display("WRITE | ID=%0d ADDR=%0d DATA=%0d",tr.id,tr.addr,data);
        else
          $display("READ  | ID=%0d ADDR=%0d",tr.id,tr.addr);

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
READ  | ID=2 ADDR=9
--------------------------------------
READ  | ID=0 ADDR=11
--------------------------------------
WRITE | ID=3 ADDR=10 DATA=141
--------------------------------------
WRITE | ID=1 ADDR=7 DATA=37
--------------------------------------
READ  | ID=2 ADDR=0
--------------------------------------
WRITE | ID=1 ADDR=3 DATA=212
--------------------------------------
READ  | ID=0 ADDR=10
--------------------------------------
WRITE | ID=3 ADDR=3 DATA=101
--------------------------------------
READ  | ID=1 ADDR=0
--------------------------------------
READ  | ID=0 ADDR=9
--------------------------------------
*/


