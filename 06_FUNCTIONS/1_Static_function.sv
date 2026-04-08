

module statis_function;
  int num;
  
  
  function void sum(int n);
    int sum;
    do begin 
          
      if(n>0)begin
         sum=sum+n;
         n--;
        end
      else begin
        sum=sum+n;
        n++;
       end
    end
    while(n!=0);
    $display("Sum of numbers from 0 : %0d",sum);
    $display("\n----------------------------------\n");
    
  endfunction
  
  initial begin
    $display("----------------------------------");
    $display("         STATIC FUNCTION");
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
----------------------------------
         STATIC FUNCTION
----------------------------------

NUMBER : 100
Sum of numbers from 0 : 5050

----------------------------------

NUMBER : 80
Sum of numbers from 0 : 8290

----------------------------------

NUMBER : -10
Sum of numbers from 0 : 8235

----------------------------------

NUMBER : -200
Sum of numbers from 0 : -11865

----------------------------------
*/
