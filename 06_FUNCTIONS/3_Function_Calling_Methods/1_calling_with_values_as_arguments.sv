
module call_by_value;
  int num;
  
  
  function automatic void sum(int n);
    int sum;
    int temp;
    temp=n;
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
    $display("Sum of %0d numbers from 0 : %0d",temp,sum);
    $display("\n----------------------------------\n");
    
  endfunction
  
  initial begin
    $display("----------------------------------");
    $display("         CALL BY VALUE");
    $display("----------------------------------\n");
    $display("NUMBER : %0d",10);
    sum(10); //HERE THE FUNCTION IS CALLED USING VALUE(10) AS ARGUMENT
    
    $display("NUMBER : %0d",5);
    sum(5);  //HERE THE FUNCTION IS CALLED USING VALUE(5) AS ARGUMENT
    
    $display("NUMBER : %0d",20);
    sum(20);  //HERE THE FUNCTION IS CALLED USING VALUE(20) AS ARGUMENT
    
    
    $display("NUMBER : %0d",-15);
    sum(-15);  //HERE THE FUNCTION IS CALLED USING VALUE(-15) AS ARGUMENT
    
    
  end 
endmodule

/*

----------------------------------
         CALL BY VALUE
----------------------------------

NUMBER : 10
Sum of 10 numbers from 0 : 55

----------------------------------

NUMBER : 5
Sum of 5 numbers from 0 : 15

----------------------------------

NUMBER : 20
Sum of 20 numbers from 0 : 210

----------------------------------

NUMBER : -15
Sum of -15 numbers from 0 : -120

----------------------------------
*/


