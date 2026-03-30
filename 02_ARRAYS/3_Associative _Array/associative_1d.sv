
module associative_1D_array;

  // Associative arrays
  int arr1[string];         
  int arr2[*];             
  int arr3[string];       
  string key;
  int i;
  
  
  initial begin
    $display("\n==================================================");
    $display("               1D Associative Array               ");
    $display("==================================================\n");
    // assign
    arr1["A"]=10;
    arr1["B"]=20;
    arr1["C"]=30;
    arr1["D"]=40;

    $display("\narr1 = %p\n",arr1);

    
    
    
    for(i=0;i<5;i++)
      arr2[i]=i*5;

    $display("arr2 = %0p\n",arr2);

    //Traversal by first/next
    $display("Traversing arr1:");
    if(arr1.first(key)) begin
      do begin
        $display("Key = %s, Value = %0d",key,arr1[key]);
      end
      while(arr1.next(key));
    end

    //Checking existence
    if(arr1.exists("B"))
      $display("\nKey B exists with value = %0d\n",arr1["B"]);

    //Delete specific key
    arr1.delete("C");
    
    $display("After deleting key C: %p\n",arr1);

    //Deleting  all elements
    arr2.delete();
    $display("After deleting arr2: size = %0d\n",arr2.num());

    //Coping associative arrays
    arr3 = arr1;
    $display("Copied arr3 = %p\n",arr3);

    //Modify arr3 and check independence
    arr3["A"]=999;
    $display("After modification:");
    $display("arr1 = %p",arr1);
    $display("arr3 = %p\n",arr3);

    //num() to number elements
    $display("Number of elements in arr1 = %0d\n",arr1.num());

    //Checking first/last
    if(arr1.first(key))
      $display("First key = %s and its Value = %0d ",key,arr1[key]);

    if(arr1.last(key))
      $display("Last key = %s and its Value = %0d\n",key,arr1[key]);

  end

endmodule


/*
------------------
      OUTPUT
------------------


==================================================
               1D Associative Array               
==================================================


arr1 = '{"A":10, "B":20, "C":30, "D":40} 

arr2 = '{0x0:0, 0x1:5, 0x2:10, 0x3:15, 0x4:20} 

Traversing arr1:
Key = A, Value = 10
Key = B, Value = 20
Key = C, Value = 30
Key = D, Value = 40

Key B exists with value = 20

After deleting key C: '{"A":10, "B":20, "D":40} 

After deleting arr2: size = 0

Copied arr3 = '{"A":10, "B":20, "D":40} 

After modification:
arr1 = '{"A":10, "B":20, "D":40} 
arr3 = '{"A":999, "B":20, "D":40} 

Number of elements in arr1 = 3

First key = A and its Value = 10 
Last key = D and its Value = 40

*/
