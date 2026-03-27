module packed_arr;
  
  logic [8] arr1;
  logic [8] [4] arr2;
  logic [3:0] [4] arr3;
  logic [4] [4] arr4;
  

  int i,j;
  
  initial begin
  
    //assinging values to the arrays
  arr1=8'd100;
    $display("arr1= %b",arr1); 
    
    
  for(i=0;i<arr2.size();i++)begin 
    arr2[i]=i+1;
  end
    $display("arr2= %0d\t%b",arr2,arr2); 
    
    
    for(j=0;j<arr3.size();j++)begin 
      arr3[j]=2*j;
      arr4[j]=2*j;
    end
    $display("arr3= %0d\t%b\n",arr3,arr3); 
    
    //accessing each element/group in the arrays
    foreach(arr2[i])
      $display("Array elements, arr2[%0d]\t=\t%0d",i,arr2[i]);
    
    $display("");
    foreach(arr3[i])
      $display("Array elements, arr3[%0d]\t=\t%0d",i,arr3[i]);
    
        $display("");
    foreach(arr4[i])
      $display("Array elements, arr3[%0d]\t=\t%0d",i,arr4[i]);
    
    //using operations of packed array as they were vectors
    
    $display("\nadding add3 and arr4= %0d\t%b",(arr3+arr4),(arr3+arr4));
    
    //concantenation
    
    $display("\nconcantenaing add3 and arr4= %0d\t%b",({arr3,arr4}),({arr3,arr4}));
    
    
    //displaying each bits
    
    foreach(arr2[i,j])
      $display("Array elements, arr2[%0d,%0d]\t=\t%0d",i,j,arr2[i][j]);
      
  
    
  end
endmodule
