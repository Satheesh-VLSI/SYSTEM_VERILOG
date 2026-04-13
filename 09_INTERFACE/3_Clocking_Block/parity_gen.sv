module top;
  
  
  logic clk;
  initial clk=0;
  always #5 clk=~clk;
  
  port P(clk);  //INterface instantiation
  defparam P.N=5;
  
  
  parity_gen_FSM fsm(P);  //DUT instantiation
  
  parity_gen_FSM_Tb fsmtb(P);  //Testbench instantiation
  
endmodule
//======================================
//              INTERFACE
//======================================
interface port #(parameter N)(input clk);
  
  logic rst;
  logic [N-1:0] x;
  logic odd,even;
  
  clocking CB @(posedge clk);   
    default input #1step output #0;   
    output rst,x;   
    input odd,even;    
  endclocking  
  
  modport dut(input rst,input x,input clk,output odd,output even);
  modport tb(clocking CB,input clk,output rst,output x,input odd,input even);
  

endinterface

//======================================
//                 DUT
//======================================
//moore
module parity_gen_FSM(port.dut P);
  logic [1:0] state,next;
  localparam s0=0, //even number of ones here
             s1=1; //odd number of ones here
  
  logic exor;
  
  always@(*)begin
    exor=0;
    foreach(P.x[i])begin
      exor=exor^P.x[i];
    end
      
  end
  
  always_ff @(posedge P.clk or posedge P.rst)begin
    if(P.rst)
      state<=s0;
    else
      state<=next;
  end
  
  always_comb begin
    next=state;
    P.odd=0;
    P.even=0;
    case(state)
      s0:begin 
        next=(exor)?s1:s0;
        P.odd=0;
        P.even=1;
      end
      s1:begin 
        next=(exor)?s1:s0;
        P.odd=1;
        P.even=0;
      end
      default:next=s0;
    endcase
    
  end
endmodule

//======================================
//              TESTBENCH
//======================================
//Testbench
module parity_gen_FSM_Tb(port.tb P);
  
  
  initial begin
    P.CB.rst<=1; P.CB.x<=0;
    $monitor($time,"Data_in=%b   clk=%b   rst=%b   even_parity=%b  odd_parity=%b",P.x,P.clk,P.rst,P.even,P.odd);
    #5 P.CB.rst<=0; 

    @(P.CB) P.CB.x<=$random;
    @(P.CB) P.CB.x<=$random;
    @(P.CB) P.CB.x<=$random;
    @(P.CB) P.CB.x<=$random;
    @(P.CB) P.CB.x<=$random;
    @(P.CB) P.CB.x<=$random;
    @(P.CB) P.CB.x<=$random;
    @(P.CB) P.CB.x<=$random;
    @(P.CB) P.CB.x<=$random;
    #20 $finish;
  end
  initial begin
    $dumpfile("p.vcd");
    $dumpvars;
  end
  
endmodule

/*
                   0Data_in=xxxxx   clk=0   rst=x   even_parity=0  odd_parity=0
                   5Data_in=00100   clk=1   rst=0   even_parity=1  odd_parity=0
                  10Data_in=00100   clk=0   rst=0   even_parity=1  odd_parity=0
                  15Data_in=00001   clk=1   rst=0   even_parity=0  odd_parity=1
                  20Data_in=00001   clk=0   rst=0   even_parity=0  odd_parity=1
                  25Data_in=01001   clk=1   rst=0   even_parity=0  odd_parity=1
                  30Data_in=01001   clk=0   rst=0   even_parity=0  odd_parity=1
                  35Data_in=00011   clk=1   rst=0   even_parity=1  odd_parity=0
                  40Data_in=00011   clk=0   rst=0   even_parity=1  odd_parity=0
                  45Data_in=01101   clk=1   rst=0   even_parity=1  odd_parity=0
                  50Data_in=01101   clk=0   rst=0   even_parity=1  odd_parity=0
                  55Data_in=01101   clk=1   rst=0   even_parity=0  odd_parity=1
                  60Data_in=01101   clk=0   rst=0   even_parity=0  odd_parity=1
                  65Data_in=00101   clk=1   rst=0   even_parity=0  odd_parity=1
                  70Data_in=00101   clk=0   rst=0   even_parity=0  odd_parity=1
                  75Data_in=10010   clk=1   rst=0   even_parity=1  odd_parity=0
                  80Data_in=10010   clk=0   rst=0   even_parity=1  odd_parity=0
                  85Data_in=00001   clk=1   rst=0   even_parity=1  odd_parity=0
                  90Data_in=00001   clk=0   rst=0   even_parity=1  odd_parity=0
                  95Data_in=00001   clk=1   rst=0   even_parity=0  odd_parity=1
                 100Data_in=00001   clk=0   rst=0   even_parity=0  odd_parity=1
 
    */


    
