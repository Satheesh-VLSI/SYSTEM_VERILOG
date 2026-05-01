class customer;
  string name;
  int age;

  function new(string name, int age);
    this.name=name;
    this.age=age;
  endfunction

  function void display();
    $display("  Customer Name: %0s",name);
    $display("  Age          : %0d",age);
  endfunction
endclass


class bank_account;
  int acc_no;
  int balance;
  customer cus;
  
  function new(int acc_no,balance,byte age,string name);
    this.acc_no=acc_no; 
    this.balance=balance;
    this.cus=new(name,age);
  endfunction
  
  function void deposit(int amount);
    balance+=amount;
  endfunction:deposit
  
  function void withdraw(int amount);
    if(balance>=amount)
      balance-=amount;
    else begin
      $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      $display("   INSUFFICIENT BALANCE");
      $display("     Withdraw failed");
      $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    end

  endfunction:withdraw
  
  function void display();
    $display("\n===================================");
    $display("        Bank Account Details");
    cus.display();
    $display("  Account NO.: %0d\n  Balance: %0d  ",acc_no,balance);
    $display("===================================");
    
  endfunction:display
  
  //Deep copy
  function void deep(bank_account acc);
    this.acc_no=acc.acc_no;
    this.balance=acc.balance;
    
    this.cus.name=acc.cus.name;
    this.cus.age=acc.cus.age;
  endfunction
  
endclass

module deep_copy;
  
  initial begin 
    
    bank_account acc1,acc2;
    
    $display("=================================");
    $display("         SHALLOW COPY");
    $display("=================================\n");
    
    acc1=new(49,15000,22,"Sam");
    acc2=new(4,10,2,"S");
    acc2.deep(acc1);
    
    acc1.display();
    
    $display("---------------------------------------------------------------------------------------------");
    $display("Changing the name & age of acc2 and checking throught acc1");
    acc2.cus.name="Satheesh";
    acc2.cus.age=19;
    
    acc1.display();
    $display("Here we can see that changing name of customer object of acc2 object did not affect the customer object acc1 object");
    
    $display("---------------------------------------------------------------------------------------------");
    
       
    
    $display("---------------------------------------------------------------------------------------------");
    $display("Changing the Account Number of acc1 and checking throught acc2");
    acc1.acc_no=90;
    acc2.display();
    $display("Here we can see that changing account number of acc1 object did not affect the acc2 object");
    
    $display("---------------------------------------------------------------------------------------------");
    acc1.deposit(5000);
    $display("After Depositing 10000 through acc1 Object:");
    acc1.display();
    acc2.deposit(10000);
    $display("After Depositing 5000 through acc2 Object:");
    acc2.display();
    
    acc1.withdraw(10000);
    $display("After Withdrawing 10000 through acc1 Object:");
    acc1.display();
    acc2.withdraw(5000);
    $display("After Withdrawing 5000 through acc2 Object:");
    acc2.display();
    
  
  end 
endmodule:deep_copy

/*
=================================
         SHALLOW COPY
=================================


===================================
        Bank Account Details
  Customer Name: Sam
  Age          : 22
  Account NO.: 49
  Balance: 15000  
===================================
---------------------------------------------------------------------------------------------
Changing the name & age of acc2 and checking throught acc1

===================================
        Bank Account Details
  Customer Name: Sam
  Age          : 22
  Account NO.: 49
  Balance: 15000  
===================================
Here we can see that changing name of customer object of acc2 object did not affect the customer object acc1 object
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
Changing the Account Number of acc1 and checking throught acc2

===================================
        Bank Account Details
  Customer Name: Satheesh
  Age          : 19
  Account NO.: 49
  Balance: 15000  
===================================
Here we can see that changing account number of acc1 object did not affect the acc2 object
---------------------------------------------------------------------------------------------
After Depositing 10000 through acc1 Object:

===================================
        Bank Account Details
  Customer Name: Sam
  Age          : 22
  Account NO.: 90
  Balance: 20000  
===================================
After Depositing 5000 through acc2 Object:

===================================
        Bank Account Details
  Customer Name: Satheesh
  Age          : 19
  Account NO.: 49
  Balance: 25000  
===================================
After Withdrawing 10000 through acc1 Object:

===================================
        Bank Account Details
  Customer Name: Sam
  Age          : 22
  Account NO.: 90
  Balance: 10000  
===================================
After Withdrawing 5000 through acc2 Object:

===================================
        Bank Account Details
  Customer Name: Satheesh
  Age          : 19
  Account NO.: 49
  Balance: 20000  
===================================*/
