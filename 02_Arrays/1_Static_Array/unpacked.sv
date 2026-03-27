module unpacked_arr;
  
  int arr1 [8];
  int arr2 [8][4];
  int arr3 [8][4];
  int arr4 [8][8];
  
  
  int sum;

  int i,j;
  
  initial begin
  
    //ASSIGNING VALUES TO THE ARRAYS AND DISPLAYING
    arr1='{8,16,24,32,40,48,56,64};
    $display("arr1= %p",arr1); 
    foreach(arr1[i])
      $display("arr1[%0d]= %0d",i,arr1[i]); 
    
    
    for(i=0;i< $size(arr2,1);i++)begin
      for(j=0;j< $size(arr2,2);j++)
        arr2[i][j]=i+j;
    end
    $display("arr2= %p",arr2); 
    foreach(arr2[i,j])
      $display("arr2[%0d][%0d]= %0d",i,j,arr2[i][j]); 
    
    
    for(i=0;i< $size(arr3,1);i++)begin
      for(j=0;j< $size(arr3,2);j++)begin
        arr3[i][j]=i+j+2;
      end
    end
    
    $display("arr3= %p",arr3); 
    foreach(arr3[i,j])
      $display("arr3[%0d][%0d]= %0d",i,j,arr3[i][j]); 
    
    
    for(i=0;i< $size(arr4,1);i++)begin
      for(j=0;j< $size(arr4,2);j++)begin
        arr4[i][j]=2*i+j;
      end
    end
    $display("arr4= %p",arr4); 
    foreach(arr4[i,j])
      $display("arr4[%0d][%0d]= %0d",i,j,arr4[i][j]); 
    
    
    //sum of ALL ELEMENTS IN THE ARRAY

    sum=0;
    foreach(arr2[i,j])
       sum+=arr2[i][j];
    $display("\nSum of all elements in array 2 = %0d",sum); 
    
    
    //copy operation
    foreach(arr2[i,j])begin
      arr4[i][j]=arr2[i][j];
      arr4[i][j+4]=arr3[i][j];
    end

    $display("\nCopied array  arr4= %p", arr4);

    
  end
endmodule
