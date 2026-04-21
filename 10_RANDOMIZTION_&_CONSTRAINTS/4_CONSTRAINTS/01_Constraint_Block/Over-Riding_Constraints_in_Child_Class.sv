
module over_riding_contraint;

  //CLASS
  class stimulus;

    rand logic [7:0] a, b;
    rand logic [1:0] op;   //op select
    //CONTSRAINTS 
    constraint range_c {
      a inside {[0:50]};
      b inside {[0:50]};
       }
    constraint valid_c {
      if (op == 3)   
        b!=0;
    }
  endclass:stimulus
  
  class stimuli extends stimulus;
     constraint range_c {
       a inside {[0:100]};
       b inside {[0:100]};
       }
  endclass:stimuli

  stimuli s;
  
  initial begin
    
    s = new();
    $display("=========================================");
    $display("  OVER-RIDING CONTRAINTS in Child Class");
    $display("=========================================");

    repeat(10) begin
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
=========================================
  OVER-RIDING CONTRAINTS in Child Class
=========================================
DIVIDE   : a=94 b=82 
--------------------------------------
SUBTRACT : a=3 b=46 
--------------------------------------
ADDITION : a=73 b=5 
--------------------------------------
ADDITION : a=49 b=58 
--------------------------------------
ADDITION : a=42 b=17 
--------------------------------------
SUBTRACT : a=61 b=43 
--------------------------------------
ADDITION : a=96 b=9 
--------------------------------------
DIVIDE   : a=14 b=27 
--------------------------------------
ADDITION : a=71 b=60 
--------------------------------------
DIVIDE   : a=50 b=66 
--------------------------------------
DIVIDE   : a=30 b=100 
--------------------------------------
ADDITION : a=3 b=27 
--------------------------------------
DIVIDE   : a=99 b=17 
--------------------------------------
DIVIDE   : a=4 b=73 
--------------------------------------
MULTIPLY : a=15 b=54 
--------------------------------------
ADDITION : a=35 b=62 
--------------------------------------
MULTIPLY : a=67 b=62 
--------------------------------------
ADDITION : a=39 b=61 
--------------------------------------
MULTIPLY : a=98 b=91 
--------------------------------------
ADDITION : a=99 b=55 
--------------------------------------
*/
