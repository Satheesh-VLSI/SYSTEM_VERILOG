

module inside2;

  class numbers;

    rand int a, b, c;

    // Constraint 1
    constraint range {
      a inside {[1:20]};
      b inside {[1:20]};
      c inside {[1:50]};
    }

    // Constraint 2
    constraint sum_c {
      c inside {a+b};
    }

    // Constraint 3
    constraint valid_sum {
      c inside {10, 15, 20, 25, 30};
    }

  endclass


  numbers n;

  initial begin
    n=new();
    $display("================================");
    $display("        INSIDE CONSTRAINT       ");
    $display("================================");

    repeat(10) begin
      if (n.randomize()) begin
        $display("a=%0d  b=%0d  c=%0d (a+b=%0d)",n.a,n.b,n.c,n.a+n.b);
      end
      else begin
        $display("Randomization FAILED");
      end

      $display("------------------------------------------");
    end

  end

endmodule
/*
================================
        INSIDE CONSTRAINT       
================================
a=15  b=10  c=25 (a+b=25)
------------------------------------------
a=8  b=17  c=25 (a+b=25)
------------------------------------------
a=2  b=8  c=10 (a+b=10)
------------------------------------------
a=1  b=19  c=20 (a+b=20)
------------------------------------------
a=15  b=10  c=25 (a+b=25)
------------------------------------------
a=6  b=14  c=20 (a+b=20)
------------------------------------------
a=8  b=2  c=10 (a+b=10)
------------------------------------------
a=10  b=15  c=25 (a+b=25)
------------------------------------------
a=2  b=18  c=20 (a+b=20)
------------------------------------------
a=19  b=6  c=25 (a+b=25)
------------------------------------------*/


