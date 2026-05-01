virtual class Scoreboard;

  //Common transaction data
  int expected_data;
  int actual_data;

  function new(int e, int a);
    expected_data = e;
    actual_data = a;
  endfunction

  
  pure virtual function void check(); //Pure Virtual method
  //this method must be implemented bythe child class
    
endclass


class Exact_Match_Scoreboard extends Scoreboard;

  function new(int e,int a);
    super.new(e,a);
  endfunction

  function void check();
    
    $display("EXACT MATCH CHECKER");
    
    if(expected_data==actual_data)
      $display("PASS: exp=%0d act=%0d",expected_data, actual_data);
    else
      $display("FAIL: exp=%0d act=%0d",expected_data, actual_data);
    
    $display("-----------------------------");
  endfunction

endclass


class Tolerance_Scoreboard extends Scoreboard;

  int tolerance=5;

  function new(int e,int a);
    super.new(e,a);
  endfunction

  function void check();
    
    $display("TOLERANCE CHECKER");
    
    if((expected_data-actual_data<=tolerance)&&(actual_data-expected_data<=tolerance))
      $display("PASS within tolerance");
    else
      $display("FAIL outside tolerance");
    
    $display("-----------------------------");
  endfunction

endclass


module abstract_example;
  initial begin
    
    Exact_Match_Scoreboard sb1;
    Tolerance_Scoreboard sb2;
    
    $display("\n=====================================");
    $display("          ABSTRACT CLASS");
    $display("=====================================\n");

    sb1=new(100,100);
    sb1.check();
    
    sb2=new(100,103);
    sb2.check();
    
    sb1=new(100,103);
    sb1.check();
    
    sb2=new(100,100);
    sb2.check();
    
    sb2=new(100,110);
    sb2.check();
    
  end
endmodule
/*
=====================================
          ABSTRACT CLASS
=====================================

EXACT MATCH CHECKER
PASS: exp=100 act=100
-----------------------------
TOLERANCE CHECKER
PASS within tolerance
-----------------------------
EXACT MATCH CHECKER
FAIL: exp=100 act=103
-----------------------------
TOLERANCE CHECKER
PASS within tolerance
-----------------------------
TOLERANCE CHECKER
FAIL outside tolerance
-----------------------------
    */
