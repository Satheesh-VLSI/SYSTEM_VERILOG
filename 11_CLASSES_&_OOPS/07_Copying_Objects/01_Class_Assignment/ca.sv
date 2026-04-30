class bank_account;
  int acc_no;
  int balance;
  
  function new(int acc_no,balance);
    this.acc_no=acc_no; //here this keyword is used to represent the varable of the class in this scope, so this.acc_no is the class variable
    this.balance=balance;
  endfunction:new
  
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
    $display("  Account NO.: %0d\n  Balance: %0d  ",acc_no,balance);
    $display("===================================");
    
  endfunction:display
  
endclass

module handle_construct;
  
  initial begin 
    
    bank_account acc1,acc2;
    
    $display("=================================");
    $display("       CLASS ASSIGNMENT");
    $display("=================================\n");
    
    acc1=new(49,15000);
    acc2=acc1;
    
    acc1.deposit(4000);
    $display(" After Depositing 4000 through acc1 Object");
    acc1.display();
    acc2.deposit(2999);
    $display(" After Depositing 2999 through acc2 Object");
    acc2.display();
    
    acc1.withdraw(9999);
    $display(" After Depositing 9999 through acc1 Object");
    acc1.display();
    acc2.withdraw(7000);
    $display(" After Depositing 7000 through acc2 Object");
    acc2.display();
    
  
  end 
endmodule:handle_construct

/*
=================================
       CLASS ASSIGNMENT
=================================

 After Depositing 4000 through acc1 Object

===================================
        Bank Account Details
  Account NO.: 49
  Balance: 19000  
===================================
 After Depositing 2999 through acc2 Object

===================================
        Bank Account Details
  Account NO.: 49
  Balance: 21999  
===================================
 After Depositing 9999 through acc1 Object

===================================
        Bank Account Details
  Account NO.: 49
  Balance: 12000  
===================================
 After Depositing 7000 through acc2 Object

===================================
        Bank Account Details
  Account NO.: 49
  Balance: 5000  
===================================*/
