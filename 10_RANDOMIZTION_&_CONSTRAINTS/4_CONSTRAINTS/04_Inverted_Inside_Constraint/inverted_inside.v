
module inverted_inside;

  //CLASS
  class stimulus;

    rand logic [7:0] a, b;
    rand logic [1:0] op;   //op select
    //CONTSRAINTS 
    constraint range_c {
      !(a inside {[0:100]});
      b inside {[0:50]};
       }
    constraint valid_c {
      if (op == 3)   
        !(b inside {0});
    }
  endclass


  stimulus s;
  
  initial begin
    
    s = new();
    $display("=====================================");
    $display("      INVERTED INSIDE CONTRAINT ");
    $display("=====================================");

    repeat(20) begin
      if (s.randomize()) begin
        case (s.op)
          0:$display("ADDITION : a=%0d b=%0d ",s.a,s.b);
          1:$display("SUBTRACT : a=%0d b=%0d ",s.a,s.b);
          2:$display("MULTIPLY : a=%0d b=%0d ",s.a,s.b);
          3:$display("DIVIDE   : a=%0d b=%0d ",s.a,s.b);
        endcase

      end
      else begin
        $display("Randomization FAILED");
      end

      $display("--------------------------------------");
    end

  end

endmodule
/*
=====================================
      INVERTED INSIDE CONTRAINT 
=====================================
DIVIDE   : a=150 b=5 
--------------------------------------
DIVIDE   : a=121 b=33 
--------------------------------------
ADDITION : a=192 b=6 
--------------------------------------
MULTIPLY : a=209 b=17 
--------------------------------------
ADDITION : a=146 b=29 
--------------------------------------
ADDITION : a=125 b=30 
--------------------------------------
DIVIDE   : a=164 b=6 
--------------------------------------
SUBTRACT : a=111 b=45 
--------------------------------------
DIVIDE   : a=225 b=30 
--------------------------------------
ADDITION : a=150 b=15 
--------------------------------------
MULTIPLY : a=255 b=10 
--------------------------------------
ADDITION : a=178 b=47 
--------------------------------------
SUBTRACT : a=158 b=44 
--------------------------------------
DIVIDE   : a=206 b=31 
--------------------------------------
MULTIPLY : a=122 b=50 
--------------------------------------
ADDITION : a=241 b=43 
--------------------------------------
MULTIPLY : a=245 b=5 
--------------------------------------
MULTIPLY : a=233 b=25 
--------------------------------------
MULTIPLY : a=220 b=30 
--------------------------------------
DIVIDE   : a=185 b=30 
--------------------------------------*/
