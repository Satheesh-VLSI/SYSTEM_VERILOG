
module call_by_reference;
  
  logic [8:0] data;
  bit parity; //parity=0 --> even parity
              //parity=1 --> odd parity
  
  function automatic logic [8:0] parity_generated_data(ref logic [8:0] data,bit parity);
    bit temp;
    
    if(parity)
      data={~^data,data[7:0]}; //odd parity
    else
      data={^data,data[7:0]}; //even parity
  
    
    return data;
      
  endfunction
  
  function automatic void data_display(ref logic [8:0] data,bit parity);
    
    $display("Input data : %b",data);
    
    if(parity)begin
      $display("\nODD Parity added Data");
      $display("Data = %b",parity_generated_data(data,parity));   //calling the function
    end
    else begin
      $display("\nEVEN Parity added Data");
      $display("Data = %b",parity_generated_data(data,parity));   //calling the function
    end
    
    
    $display("\n-------------------------------------------\n");
  endfunction
    
  initial begin 
    
    $display("-------------------------------------------");
    $display("             CALL BY REFERENCE            ");
    $display("-------------------------------------------");
    data=8; parity=0;
    data_display(data,parity);
    
    data=20; parity=0;
    data_display(data,parity);
    
    data=40; parity=1;
    data_display(data,parity);
    
    data=27; parity=1;
    data_display(data,parity);
    
    data=40; parity=0;
    data_display(data,parity);
    
    data=100; parity=1;
    data_display(data,parity);
    
    data=39; parity=0;
    data_display(data,parity);
    
  end

  /*
-------------------------------------------
            CALL BY REFERENCE            
-------------------------------------------
Input data : 000001000

EVEN Parity added Data
Data = 100001000

-------------------------------------------

Input data : 000010100

EVEN Parity added Data
Data = 000010100

-------------------------------------------

Input data : 000101000

ODD Parity added Data
Data = 100101000

-------------------------------------------

Input data : 000011011

ODD Parity added Data
Data = 100011011

-------------------------------------------

Input data : 000101000

EVEN Parity added Data
Data = 000101000

-------------------------------------------

Input data : 001100100

ODD Parity added Data
Data = 001100100

-------------------------------------------

Input data : 000100111

EVEN Parity added Data
Data = 000100111

-------------------------------------------*/
    
endmodule
