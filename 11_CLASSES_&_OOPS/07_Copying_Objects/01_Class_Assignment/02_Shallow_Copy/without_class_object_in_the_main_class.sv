
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

module shallow_copy;
  
  initial begin 
    
    bank_account acc1,acc2;
    
    $display("=================================");
    $display("         SHALLOW COPY");
    $display("=================================\n");
    
    acc1=new(49,15000);
    acc2=new acc1;
    
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
endmodule:shallow_copy

/*
=================================
         SHALLOW COPY
=================================

After Depositing 10000 through acc1 Object:

===================================
        Bank Account Details
  Account NO.: 49
  Balance: 20000  
===================================
After Depositing 5000 through acc2 Object:

===================================
        Bank Account Details
  Account NO.: 49
  Balance: 25000  
===================================
After Withdrawing 10000 through acc1 Object:

===================================
        Bank Account Details
  Account NO.: 49
  Balance: 10000  
===================================
After Withdrawing 5000 through acc2 Object:

===================================
        Bank Account Details
  Account NO.: 49
  Balance: 20000  
===================================*/
