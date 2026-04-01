
module equality;

  logic [3:0] a=5;
  logic [3:0] b=15;
  
  initial begin 

    $display("\n-----------------------------------");
    $display("           EQUALITY OPERATORS      ");
    $display("----------------------------------\n");
    $display("%0d CASE equal to(===) %0d: %0d",a,b,a===b);
    $display("%0d CASE inequal to(!==) %0d : %0d",a,b,a!==b);
    $display("%0d Equality(==) to %0d :%0d",a,b,a==b);
    $display("%0d Inequal to(!=) to %0d :%0d",a,b,a!=b);
     a=4'b101x;
     b=4'b1011;
    $display("\n-----------------------------------");
    $display("%0d CASE equal to(===) %0d: %0d",a,b,a===b);
    $display("%0d CASE inequal to(!==) %0d : %0d",a,b,a!==b);
    $display("%0d Equality(==) to %0d :%0d",a,b,a==b);
    $display("%0d Inequal to(!=) to %0d :%0d",a,b,a!=b);
    
     a=4'b101x;
     b=4'b101x;
        $display("\n-----------------------------------");
    $display("%0d CASE equal to(===) %0d: %0d",a,b,a===b);
    $display("%0d CASE inequal to(!==) %0d : %0d",a,b,a!==b);
    $display("%0d Equality(==) to %0d :%0d",a,b,a==b);
    $display("%0d Inequal to(!=) to %0d :%0d",a,b,a!=b);
  end

endmodule

/*

-----------------------------------
           EQUALITY OPERATORS      
----------------------------------

5 CASE equal to(===) 15: 0
5 CASE inequal to(!==) 15 : 1
5 Equality(==) to 15 :0
5 Inequal to(!=) to 15 :1

-----------------------------------
X CASE equal to(===) 11: 0
X CASE inequal to(!==) 11 : 1
X Equality(==) to 11 :x
X Inequal to(!=) to 11 :x

-----------------------------------
X CASE equal to(===) X: 1
X CASE inequal to(!==) X : 0
X Equality(==) to X :x
X Inequal to(!=) to X :x

*/

