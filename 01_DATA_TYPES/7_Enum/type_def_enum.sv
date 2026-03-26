module enumerated_data_types;
  
  typedef enum{A,B=2,C,D=9,E,F} alpha;
  
  alpha a1,a2;
  int i,j;
  initial begin 
    a1=a1.first();
     
    $display("\nAlphabet and its value (first) of a1 : %s = %0d \n",a1.name,a1);
    
    
    a2=a2.last();
     
    $display("Alphabet and its value (last) of a2: %s = %0d \n",a2.name(),a2);
        
    a1=a1.first();
    for(j=0;j<a1.num();j++)begin
      $display("Alphabet and its value of a1 : %s = %0d ",a1.name(),a1);
      a1=a1.next();   
    end
     $display("\n\n");

    for(i=0;i<a2.num();i++)begin
      $display("Alphabet and its value of a2: %s = %0d ",a2.name(),a2);
      a2=a2.prev();
    end

    #10; $finish;
  end 

endmodule
  
  
