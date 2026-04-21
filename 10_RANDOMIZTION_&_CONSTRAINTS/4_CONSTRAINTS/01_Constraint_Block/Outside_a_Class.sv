module contraint2;

  //CLASS
  class stimulus;

    rand logic [7:0] a, b;
    rand logic [1:0] op;   //op select
    //costraint declaration
    extern constraint range_c;
    extern constraint valid_c;
    
  endclass
  
      //CONTSRAINTS initialization
    constraint stimulus::range_c {
      a inside {[0:50]};
      b inside {[0:50]};
       }
    constraint stimulus::valid_c {
      if (op == 3)   
        b!=0;
    }


  stimulus s;
  
  initial begin
    
    s = new();

    
    $display("=====================================");
    $display("      CONTRAINTS Outside Class");
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
      CONTRAINTS Outside Class
=====================================
DIVIDE   : a=10 b=5 
--------------------------------------
DIVIDE   : a=12 b=33 
--------------------------------------
ADDITION : a=31 b=6 
--------------------------------------
MULTIPLY : a=38 b=17 
--------------------------------------
ADDITION : a=11 b=29 
--------------------------------------
ADDITION : a=6 b=30 
--------------------------------------
DIVIDE   : a=48 b=6 
--------------------------------------
SUBTRACT : a=12 b=45 
--------------------------------------
DIVIDE   : a=30 b=30 
--------------------------------------
ADDITION : a=13 b=15 
--------------------------------------
MULTIPLY : a=3 b=10 
--------------------------------------
ADDITION : a=1 b=47 
--------------------------------------
SUBTRACT : a=7 b=44 
--------------------------------------
DIVIDE   : a=6 b=31 
--------------------------------------
MULTIPLY : a=40 b=50 
--------------------------------------
ADDITION : a=40 b=43 
--------------------------------------
MULTIPLY : a=36 b=5 
--------------------------------------
MULTIPLY : a=44 b=25 
--------------------------------------
MULTIPLY : a=34 b=30 
--------------------------------------
DIVIDE   : a=47 b=30 
--------------------------------------

*/
