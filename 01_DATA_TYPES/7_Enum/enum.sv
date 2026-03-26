module enumerated_data_types;
  
  enum{A,B=2,C,D=9,E,F} alpha;
  int  i,j;
  
  initial begin 
    alpha=alpha.first();
     
    $display("\nAlphabet and its value (first) : %s = %0d \n",alpha.name,alpha);
    
    
    alpha=alpha.last();
    
    $display("\n---- Backward Traversal----\n"); 
    $display("Alphabet and its value (last) : %s = %0d \n",alpha.name(),alpha);
    
    for(i=0;i<alpha.num();i++)begin
      $display("Alphabet and its value : %s = %0d ",alpha.name(),alpha);
      alpha=alpha.prev();
    end
    $display("\n");
    
    $display("\n---- Forward Traversal----\n");
    alpha=alpha.first();
    for(j=0;j<alpha.num();j++)begin
      $display("Alphabet and its value : %s = %0d ",alpha.name(),alpha);
      alpha=alpha.next();
    end
    #10; $finish;
  end 

endmodule
  
  
