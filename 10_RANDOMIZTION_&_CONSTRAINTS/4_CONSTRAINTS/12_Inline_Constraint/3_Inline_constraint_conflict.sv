
module inline_constraint;
 class dynamic_array;
   rand logic [7:0] arr [];
   
   constraint it{foreach(arr[i]) arr[i]<70;}
   
   constraint s{arr.sum()  with (int'(item))==100;}
   
   constraint m{
     arr.size()<10;
     arr.size()>3;}
 endclass
  
  dynamic_array hi;
  initial begin 
    hi=new();
    $display("=====================================");
    $display("    Inline CONSTRAINT CONFLICT");
    $display("=====================================");
    repeat(20)begin
      if(hi.randomize() with {foreach(arr[i]) arr[i]>50;
                              arr.size==10;
                              arr.sum()  with (int'(item))==200;})
        begin
    
      $display("Size  : %0d",hi.arr.size());
        $display("Array : %0p",hi.arr);
        end
      else begin
        $display("    Randomiztion failed      ");
      $display("---------------------------------------");
      end
  end
  end 
endmodule

/*
Error-[CNST-CIF] Constraints inconsistency failure
testbench.sv, 152
  Constraints are inconsistent and cannot be solved.
  Please check the inconsistent constraints being printed above and rewrite 
  them.

    Randomiztion failed      
---------------------------------------*/
