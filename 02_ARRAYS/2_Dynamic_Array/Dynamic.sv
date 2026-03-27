module dynamic_array;
  
  int arr1 [];
  byte arr2 [][];
  int arr3 [];
  
  int arrA[];
  int arrB[];
  
  int i,j;
  int k;
  
  initial begin 
    arr1=new[5];
    arr2=new[3];
    arr3=new[15];
    
    foreach(arr2[i])
      arr2[i]=new[5];
    
    arr1='{5,10,15,20,25};
    
    for(i=0;i<arr2.size();i++)begin
      for(j=0;j<arr2[i].size();j++)
        arr2[i][j]=10+i+j;
    end
    k=0;
    foreach(arr2[i,j])begin
      arr3[k]=arr2[i][j];
      k++;
    end
    
    $display("\nArray 3 : %p\n",arr3);
    //copying and concantenation
    arr3=new[20]({arr3,arr1});
    
    $display("Array 1 : %p\n",arr1);
    $display("Array 2 : %p\n",arr2);
    $display("Array 3 : %p\n",arr3);
    
    //displaying size
    $display("Size of Array 1 : %0d",arr1.size());
    $display("Size of Array 2 : %0d",arr2.size());
    $display("Size of Array 3 : %0d",arr3.size());
    
    //deleting the elements
    
    arr1.delete();
    
    $display("Size of Array 1 after delete : %0d\n",arr1.size());
    
    arrA = new[5];
    arrB = new[3];

    // initialize
    arrA = '{10,20,30,40,50};
    arrB = '{1,2,3};

    $display("Before copy:");
    $display("arrA = %p", arrA);
    $display("arrB = %p", arrB);

    // assignment
    arrB=arrA;

    $display("\nAfter arrB = arrA:");
    $display("arrA = %p", arrA);
    $display("arrB = %p", arrB);

    
  end 

endmodule
