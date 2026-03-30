
module associative_array;

  // Associative arrays
  int arr1[string];         
  int arr2[*];             
  int arr3[string];       
  string key;
  int i;
  
  
  // 2D associative array
  int arr[string][*];
  int arr_copy[string][*];
  string row;
  int col;
  
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

    $display("==================================================");
    $display("               2D Associative Array               ");
    $display("==================================================");
    //2D ARRAY

    arr["A"][0]=10;
    arr["A"][1]=20;
    arr["A"][2]=30;

    arr["B"][0]=40;
    arr["B"][3]=50;

    arr["C"][5]=60;
    
    $display("\nOriginal 2D Array:");
    $display("arr = %p\n", arr);
    
    
    //Traversal (2D)
    $display("Traversing 2D Associative Array:");

    if(arr.first(row))begin
  
       //handle first row
       if(arr[row].first(col))begin
           $display("arr[%s][%0d] = %0d", row, col, arr[row][col]);

          while (arr[row].next(col))begin
                $display("arr[%s][%0d] = %0d", row, col, arr[row][col]);
          end
       end
  
       //remainig row
  
       while (arr.next(row)) begin
            
            if (arr[row].first(col)) begin
                 //first column
                 $display("arr[%s][%0d] = %0d", row, col, arr[row][col]);
 
                while (arr[row].next(col)) begin
                  //reamining comlumn
                    $display("arr[%s][%0d] = %0d", row, col, arr[row][col]);
                end

            end
         end

      end


    //Size of rows and column using num()
    $display("\nNumber of rows = %0d",arr.num());
    if(arr.exists("A"))
      $display("Columns in row A = %0d\n", arr["A"].num());

    //Existence check and printing
    if(arr.exists("B"))
      $display("Row B exists");

    if(arr["B"].exists(3))
      $display("arr[B][3] exists with value = %0d\n",arr["B"][3]);

    //Copying
    arr_copy=arr;
    $display("Copied Array:");
    $display("arr_copy = %p\n",arr_copy);

    //Delete specific element
    arr["A"].delete(1);
    $display("After deleting arr[A][1]: %p\n",arr);

    // Delete entire row
    arr.delete("B");
    $display("After deleting row B: %p\n",arr);

    //Delete entire array
    arr_copy.delete();
    $display("After deleting arr_copy,size = %0d\n",arr_copy.num());

    //Access non-existing key
    if(!arr.exists("Z"))
      $display("Row Z not exist\n");
    
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

==================================================
               2D Associative Array               
==================================================

Original 2D Array:
arr = '{"A":'{0x0:10, 0x1:20, 0x2:30} , "B":'{0x0:40, 0x3:50} , "C":'{0x5:60} } 

Traversing 2D Associative Array:
arr[A][0] = 10
arr[A][1] = 20
arr[A][2] = 30
arr[B][0] = 40
arr[B][3] = 50
arr[C][5] = 60

Number of rows = 3
Columns in row A = 3

Row B exists
arr[B][3] exists with value = 50

Copied Array:
arr_copy = '{"A":'{0x0:10, 0x1:20, 0x2:30} , "B":'{0x0:40, 0x3:50} , "C":'{0x5:60} } 

After deleting arr[A][1]: '{"A":'{0x0:10, 0x2:30} , "B":'{0x0:40, 0x3:50} , "C":'{0x5:60} } 

After deleting row B: '{"A":'{0x0:10, 0x2:30} , "C":'{0x5:60} } 

After deleting arr_copy,size = 0

Row Z not exist
*/
