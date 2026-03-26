module string_op;
  string str1;
  string str2;
  string str3;
  string str4;
  
  initial begin 
    
    str1="Happy Birthday";
    str2="happy birthday";
    str3=" DONT DIE\n";
    
    //LENGTH
    $display("Length of string 1 : %0d",str1.len());
    $display("Length of string 2 : %0d",str2.len());
    $display("Length of string 3 : %0d\n",str3.len());
    

    //get
    $display("get from string 1 : %s",str1.getc(1));
    $display("get from string 2 : %s",str2.getc(11));
    $display("get from string 3 : %s\n",str3.getc(7));
    

    //concantenation
    
    str2={str2," Not to you"};
    str1={str1," to You"};
    
    
    $display("Conactenated string 1 : %s\n",str1);    
    $display("Conactenated string 2 : %s\n",str2);
    
    //sub-string
        
    str4=str1.substr(18,20);
    $display("sub string of string 1 : %s\n",str4); 
    
    
    //change case
    
    $display("lower cased string 1 : %s", str1.tolower());
    $display("upper cased string 2 : %s\n",str2.toupper());
    
    //case insensitive compare
    if(!str1.icompare(str2))
      $display("string 1 and string 2 are same with case insensitivity\n");
    else
      $display("string 1 and string 2 are not same even with case insensitivity\n");
    

    
    //replication
    str3={5{str3}};
    
    $display("Replcated string 3 : %s\n",str3);
    
    
    //putc or insert
    str1.putc(9,"$");
    str2.putc(4,"Y");
    str3.putc(0,"@");
    
    $display("string 1 : %s",str1);
    $display("string 2 : %s",str2);
    $display("string 3 : %s\n",str3);
    
  end
endmodule
