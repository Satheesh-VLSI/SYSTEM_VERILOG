

module call_by_value_from_expression;
 int num;
  
  
  function automatic int sum(int n);
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
    return sum;
   
    
  endfunction
  
  initial begin
    $display("-------------------------------------------------");
    $display("         CALL BY VALUE FROM EXPRESSION");
    $display("-------------------------------------------------\n");
    num=10;
    $display("NUMBER : %0d",num);
    $display("Sum of %0d numbers from 0 : %0d",num,sum(num));  //HERE THE FUNCTION IS CALLED USING VALUE FROM EXPRESSION
     $display("\n----------------------------------\n");
    num=5;
    $display("NUMBER : %0d",num);
    $display("Sum of %0d numbers from 0 : %0d",num,sum(num));  //HERE THE FUNCTION IS CALLED USING VALUE FROM EXPRESSION
     $display("\n----------------------------------\n");
    num=20;
    $display("NUMBER : %0d",num);
    $display("Sum of %0d numbers from 0 : %0d",num,sum(num));  //HERE THE FUNCTION IS CALLED USING VALUE FROM EXPRESSION
     $display("\n----------------------------------\n");
    
    num=-15;
    $display("NUMBER : %0d",num);
    $display("Sum of %0d numbers from 0 : %0d",num,sum(num));    //HERE THE FUNCTION IS CALLED USING VALUE FROM EXPRESSION
     $display("\n----------------------------------\n");
    
  end 
endmodule
/*
-------------------------------------------------
         CALL BY VALUE FROM EXPRESSION
-------------------------------------------------

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
