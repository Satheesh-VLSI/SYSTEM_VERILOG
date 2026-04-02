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


/*
arr1= '{8, 16, 24, 32, 40, 48, 56, 64} 
arr1[0]= 8
arr1[1]= 16
arr1[2]= 24
arr1[3]= 32
arr1[4]= 40
arr1[5]= 48
arr1[6]= 56
arr1[7]= 64
arr2= '{'{0, 1, 2, 3}, '{1, 2, 3, 4}, '{2, 3, 4, 5}, '{3, 4, 5, 6}, '{4, 5, 6, 7}, '{5, 6, 7, 8}, '{6, 7, 8, 9}, '{7, 8, 9, 10}} 
arr2[0][0]= 0
arr2[0][1]= 1
arr2[0][2]= 2
arr2[0][3]= 3
arr2[1][0]= 1
arr2[1][1]= 2
arr2[1][2]= 3
arr2[1][3]= 4
arr2[2][0]= 2
arr2[2][1]= 3
arr2[2][2]= 4
arr2[2][3]= 5
arr2[3][0]= 3
arr2[3][1]= 4
arr2[3][2]= 5
arr2[3][3]= 6
arr2[4][0]= 4
arr2[4][1]= 5
arr2[4][2]= 6
arr2[4][3]= 7
arr2[5][0]= 5
arr2[5][1]= 6
arr2[5][2]= 7
arr2[5][3]= 8
arr2[6][0]= 6
arr2[6][1]= 7
arr2[6][2]= 8
arr2[6][3]= 9
arr2[7][0]= 7
arr2[7][1]= 8
arr2[7][2]= 9
arr2[7][3]= 10
arr3= '{'{2, 3, 4, 5}, '{3, 4, 5, 6}, '{4, 5, 6, 7}, '{5, 6, 7, 8}, '{6, 7, 8, 9}, '{7, 8, 9, 10}, '{8, 9, 10, 11}, '{9, 10, 11, 12}} 
arr3[0][0]= 2
arr3[0][1]= 3
arr3[0][2]= 4
arr3[0][3]= 5
arr3[1][0]= 3
arr3[1][1]= 4
arr3[1][2]= 5
arr3[1][3]= 6
arr3[2][0]= 4
arr3[2][1]= 5
arr3[2][2]= 6
arr3[2][3]= 7
arr3[3][0]= 5
arr3[3][1]= 6
arr3[3][2]= 7
arr3[3][3]= 8
arr3[4][0]= 6
arr3[4][1]= 7
arr3[4][2]= 8
arr3[4][3]= 9
arr3[5][0]= 7
arr3[5][1]= 8
arr3[5][2]= 9
arr3[5][3]= 10
arr3[6][0]= 8
arr3[6][1]= 9
arr3[6][2]= 10
arr3[6][3]= 11
arr3[7][0]= 9
arr3[7][1]= 10
arr3[7][2]= 11
arr3[7][3]= 12
arr4= '{'{0, 1, 2, 3, 4, 5, 6, 7}, '{2, 3, 4, 5, 6, 7, 8, 9}, '{4, 5, 6, 7, 8, 9, 10, 11}, '{6, 7, 8, 9, 10, 11, 12, 13}, '{8, 9, 10, 11, 12, 13, 14, 15}, '{10, 11, 12, 13, 14, 15, 16, 17}, '{12, 13, 14, 15, 16, 17, 18, 19}, '{14, 15, 16, 17, 18, 19, 20, 21}} 
arr4[0][0]= 0
arr4[0][1]= 1
arr4[0][2]= 2
arr4[0][3]= 3
arr4[0][4]= 4
arr4[0][5]= 5
arr4[0][6]= 6
arr4[0][7]= 7
arr4[1][0]= 2
arr4[1][1]= 3
arr4[1][2]= 4
arr4[1][3]= 5
arr4[1][4]= 6
arr4[1][5]= 7
arr4[1][6]= 8
arr4[1][7]= 9
arr4[2][0]= 4
arr4[2][1]= 5
arr4[2][2]= 6
arr4[2][3]= 7
arr4[2][4]= 8
arr4[2][5]= 9
arr4[2][6]= 10
arr4[2][7]= 11
arr4[3][0]= 6
arr4[3][1]= 7
arr4[3][2]= 8
arr4[3][3]= 9
arr4[3][4]= 10
arr4[3][5]= 11
arr4[3][6]= 12
arr4[3][7]= 13
arr4[4][0]= 8
arr4[4][1]= 9
arr4[4][2]= 10
arr4[4][3]= 11
arr4[4][4]= 12
arr4[4][5]= 13
arr4[4][6]= 14
arr4[4][7]= 15
arr4[5][0]= 10
arr4[5][1]= 11
arr4[5][2]= 12
arr4[5][3]= 13
arr4[5][4]= 14
arr4[5][5]= 15
arr4[5][6]= 16
arr4[5][7]= 17
arr4[6][0]= 12
arr4[6][1]= 13
arr4[6][2]= 14
arr4[6][3]= 15
arr4[6][4]= 16
arr4[6][5]= 17
arr4[6][6]= 18
arr4[6][7]= 19
arr4[7][0]= 14
arr4[7][1]= 15
arr4[7][2]= 16
arr4[7][3]= 17
arr4[7][4]= 18
arr4[7][5]= 19
arr4[7][6]= 20
arr4[7][7]= 21

Sum of all elements in array 2 = 160

Copied array  arr4= '{'{0, 1, 2, 3, 2, 3, 4, 5}, '{1, 2, 3, 4, 3, 4, 5, 6}, '{2, 3, 4, 5, 4, 5, 6, 7}, '{3, 4, 5, 6, 5, 6, 7, 8}, '{4, 5, 6, 7, 6, 7, 8, 9}, '{5, 6, 7, 8, 7, 8, 9, 10}, '{6, 7, 8, 9, 8, 9, 10, 11}, '{7, 8, 9, 10, 9, 10, 11, 12}} 
           
*/

