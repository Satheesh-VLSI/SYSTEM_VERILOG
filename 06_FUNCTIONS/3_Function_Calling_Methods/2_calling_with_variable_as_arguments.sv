module call_by_value_with_variable;
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
    $display("---------------------------------------------");
    $display("         CALL BY VALUE WITH VARIABLE");
    $display("---------------------------------------------\n");
    num=10;
    $display("NUMBER : %0d",num);
    sum(num); //HERE THE FUNCTION IS CALLED USING VALUE WITH VARIABLE(num) AS ARGUMENT
    
    num=5;
    $display("NUMBER : %0d",num);
    sum(num); //HERE THE FUNCTION IS CALLED USING VALUE WITH VARIABLE(num) AS ARGUMENT
    
    num=20;
    $display("NUMBER : %0d",num);
    sum(num); //HERE THE FUNCTION IS CALLED USING VALUE WITH VARIABLE(num) AS ARGUMENT
    
    
    num=-15;
    $display("NUMBER : %0d",num);
    sum(num); //HERE THE FUNCTION IS CALLED USING VALUE WITH VARIABLE(num) AS ARGUMENT
    
    
  end 
endmodule


/*---------------------------------------------
         CALL BY VALUE WITH VARIABLE
---------------------------------------------

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
