module ran_and_randc;

  class transaction;

    rand  logic [3:0] addr;     // random address
    randc logic [1:0] id;       // slave ID (0–3)
    rand  logic write;    // read/write control
    rand  logic [7:0] data;     // data


  endclass


  transaction tr;

  initial begin
    tr = new();

    $display("=========================================");
    $display("     RANDOM VARIABLES:rand and randc");
    $display("=========================================");

    repeat(10) begin
      if (tr.randomize()) begin

        if (tr.write)
          $display("WRITE | ID=%0d ADDR=%0d DATA=%0d",tr.id,tr.addr,tr.data);
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
     RANDOM VARIABLES:rand and randc
=========================================
WRITE | ID=2 ADDR=9 DATA=163
--------------------------------------
READ  | ID=0 ADDR=11
--------------------------------------
READ  | ID=3 ADDR=10
--------------------------------------
WRITE | ID=1 ADDR=7 DATA=229
--------------------------------------
READ  | ID=2 ADDR=0
--------------------------------------
WRITE | ID=1 ADDR=3 DATA=241
--------------------------------------
WRITE | ID=0 ADDR=10 DATA=169
--------------------------------------
WRITE | ID=3 ADDR=3 DATA=218
--------------------------------------
READ  | ID=1 ADDR=0
--------------------------------------
READ  | ID=0 ADDR=9
--------------------------------------
*/




