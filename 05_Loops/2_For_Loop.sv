
module for_loop;
  int num;
  
  
  function void sum(int n);
    int sum;
    int temp;
    sum=0;
    temp=n;
      
      if(n>0)begin
        for(;n>0;n--)
            sum=sum+n;
        end
      else begin
        for(;n<0;n++)
           sum=sum+n;
        end
    $display("Sum of %0d numbers from 0 : %0d",n,sum);
    $display("\n----------------------------------\n");
    
  endfunction
  
  initial begin
    $display("----------------------------------");
    $display("            FOR Loop");
    $display("----------------------------------\n");
    num=100;
    $display("NUMBER : %0d",num);
    sum(num);
    
    num=80;
    $display("NUMBER : %0d",num);
    sum(num);
    
    num=-10;
    $display("NUMBER : %0d",num);
    sum(num);
    
    num=-200;
    $display("NUMBER : %0d",num);
    sum(num);
    
  end 
endmodule


/*
---------------------------------
            FOR Loop
----------------------------------

NUMBER : 100
Sum of 100 numbers from 0 : 5050

----------------------------------

NUMBER : 80
Sum of 80 numbers from 0 : 3240

----------------------------------

NUMBER : -10
Sum of -10 numbers from 0 : -55

----------------------------------

NUMBER : -200
Sum of -200 numbers from 0 : -20100

----------------------------------
*/
