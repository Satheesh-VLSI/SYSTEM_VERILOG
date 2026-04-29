class bank_account;
  int acc_no;
  int balance;
  
  function new(int acc_no,balance);
    this.acc_no=acc_no;
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
    
  endfunction:display
  
endclass

module handle_construct;
  
  initial begin 
    
    bank_account acc1,acc2;
    bank_account acc3=new(25,900);
    
    $display("=================================");
    $display("  CLASS HANDLE AND CONSTRUCTOR");
    $display("=================================\n");
    
    acc1=new(49,15000);
    acc2=new(56,23000);
    
    acc1.deposit(4000);
    acc2.deposit(2999);
    acc3.deposit(999);
    
    acc1.withdraw(9999);
    acc2.withdraw(7000);
    acc3.withdraw(10000);
    
    acc1.display();
    acc2.display();
    acc3.display();
  
  end 
endmodule:handle_construct

/*

=================================
  CLASS HANDLE AND CONSTRUCTOR
=================================

xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   INSUFFICIENT BALANCE
     Withdraw failed
xxxxxxxxxxxxxxxxxxxxxxxxxxxxx

===================================
        Bank Account Details
  Account NO.: 49
  Balance: 9001  

===================================
        Bank Account Details
  Account NO.: 56
  Balance: 18999  

===================================
        Bank Account Details
  Account NO.: 25
  Balance: 1899 */
