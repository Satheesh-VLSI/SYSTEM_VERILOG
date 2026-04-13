module top;
  ports p(); //interface instantiation
  
  ALU Dut(p); //DUT instantiation
  
  ALU_tb tb(p); //Testbench instantiation
endmodule
//====================================
//              INTERFACE
//====================================
  interface ports;
    logic [3:0] a;
    logic [3:0] b;
    logic [3:0] op;
    logic [7:0] out;
    
    modport dut_port(input a,input b,input op,output out);
    modport tb_port(output a,output b,output op,input out);
endinterface

//====================================
//               DUT
//====================================
module ALU (ports.dut_port p);
  
  always @(*) begin
    case(p.op)
       0:p.out=p.a+p.b;    //ADD
       1:p.out=p.a-p.b;    //SUB
       2:p.out=p.a*p.b;    //MULTIPLY
       3:p.out=p.a/p.b;    //Division(Quotient)
       4:p.out=p.a%p.b;    //Division(Remainder)
       5:p.out=p.a&p.b;    //AND 
       6:p.out=p.a|p.b;    //OR
       7:p.out=p.a^p.b;    //EXOR
      8:p.out={4'b0,p.a~^p.b};  //EXNOR
      9:p.out={4'b0,~p.a};    //NOT a
      10:p.out={4'b0,~p.b};  //NOT b
       11:p.out=p.a<<p.b; //b right shifts a
       12:p.out=p.a>>p.b; //a left shifts b
       default: p.out=8'bx;
    endcase
  end
endmodule

//====================================
//             TESTBENCH
//====================================
module ALU_tb(ports.tb_port p);
  int i;

initial begin
 p.a=4'b0110;p.b=4'b1001;
  for(i=0;i<13;i++)begin
    p.op=i;
    #1;
    case(i)
      0:$display($time," || A=%b  B=%b || A+B=%b ||",p.a,p.b,p.out);
      1:$display($time," || A=%b  B=%b || A-B=%b ||",p.a,p.b,p.out);
      2:$display($time," || A=%b  B=%b || A*B=%b ||",p.a,p.b,p.out);
      3:$display($time," || A=%b  B=%b || A/B=%b ||",p.a,p.b,p.out);
      4:$display($time," || A=%b  B=%b || A mod B=%b ||",p.a,p.b,p.out);
      5:$display($time," || A=%b  B=%b || A AND B=%b ||",p.a,p.b,p.out);
      6:$display($time," || A=%b  B=%b || A OR B=%b ||",p.a,p.b,p.out);
      7:$display($time," || A=%b  B=%b || A EXOR B=%b ||",p.a,p.b,p.out);
      8:$display($time," || A=%b  B=%b || A EXNOR B=%b ||",p.a,p.b,p.out);
      9:$display($time," || A=%b  B=%b || not A=%b ||",p.a,p.b,p.out);
      10:$display($time," || A=%b  B=%b || not B=%b ||",p.a,p.b,p.out);
      11:$display($time," || A=%b  B=%b || A<<B=%b ||",p.a,p.b,p.out);
      12:$display($time," || A=%b  B=%b || A>>B=%b ||",p.a,p.b,p.out);
      default:$display($time," Invalid Operation");
    endcase
    #10;
  end
end  
  initial begin
    $dumpfile("mux.vcd");
    $dumpvars;
    #1000
    $finish;
  end
endmodule
  
  
