module top;
  ports  #(8) p();//interface instantiation
  
  ALU Dut(p); //dut instantiation
  
  ALU_tb tb(p);//testbench instantiation
endmodule

//======================================
//              INTERFACE
//======================================
interface ports #(parameter N);
  logic signed[N-1:0] a;
  logic signed [N-1:0] b;
  logic [N-1:0] op;
  logic signed [(2*N)-1:0] out;
    
    modport dut_port(input a,input b,input op,output out);
    modport tb_port(output a,output b,output op,input out);
endinterface

//======================================
//                 DUT
//======================================
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

//======================================
//              TESTBENCH
//======================================
module ALU_tb(ports.tb_port p);
  int i;

initial begin
 p.a=4'b0110;p.b=4'b1001;
  for(i=0;i<13;i++)begin
    p.op=i;
    #1;
    case(i)
      0:$display($time,"  || A=%b(%0d)  B=%b(%0d) || A+B=%b OR %0d     ||",p.a,p.a,p.b,p.b,p.out,p.out);
      1:$display($time,"  || A=%b(%0d)  B=%b(%0d) || A-B=%b OR %0d     ||",p.a,p.a,p.b,p.b,p.out,p.out);
      2:$display($time,"  || A=%b(%0d)  B=%b(%0d) || A*B=%b OR %0d     ||",p.a,p.a,p.b,p.b,p.out,p.out);
      3:$display($time,"  || A=%b(%0d)  B=%b(%0d) || A/B=%b OR %0d     ||",p.a,p.a,p.b,p.b,p.out,p.out);
      4:$display($time,"  || A=%b(%0d)  B=%b(%0d) || A mod B=%b OR %0d ||",p.a,p.a,p.b,p.b,p.out,p.out);
      5:$display($time,"  || A=%b(%0d)  B=%b(%0d) || A AND B=%b OR %0d ||",p.a,p.a,p.b,p.b,p.out,p.out);
      6:$display($time,"  || A=%b(%0d)  B=%b(%0d) || A OR B=%b OR %0d  ||",p.a,p.a,p.b,p.b,p.out,p.out);
      7:$display($time,"  || A=%b(%0d)  B=%b(%0d) || A EXOR B=%b OR %0d||",p.a,p.a,p.b,p.b,p.out,p.out);
      8:$display($time,"  || A=%b(%0d)  B=%b(%0d) || A EXNOR B=%b OR %0d||",p.a,p.a,p.b,p.b,p.out,p.out);
      9:$display($time,"  || A=%b(%0d)  B=%b(%0d) || not A=%b OR %0d    ||",p.a,p.a,p.b,p.b,p.out,p.out);
      10:$display($time," || A=%b(%0d)  B=%b(%0d) || not B=%b OR %0d    ||",p.a,p.a,p.b,p.b,p.out,p.out);
      11:$display($time," || A=%b(%0d)  B=%b(%0d) || A<<B=%b OR %0d     ||",p.a,p.a,p.b,p.b,p.out,p.out);
      12:$display($time," || A=%b(%0d)  B=%b(%0d) || A>>B=%b OR %0d     ||",p.a,p.a,p.b,p.b,p.out,p.out);
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
  /*
                   1  || A=00000110(6)  B=00001001(9) || A+B=0000000000001111 OR 15     ||
                  12  || A=00000110(6)  B=00001001(9) || A-B=1111111111111101 OR -3     ||
                  23  || A=00000110(6)  B=00001001(9) || A*B=0000000000110110 OR 54     ||
                  34  || A=00000110(6)  B=00001001(9) || A/B=0000000000000000 OR 0     ||
                  45  || A=00000110(6)  B=00001001(9) || A mod B=0000000000000110 OR 6 ||
                  56  || A=00000110(6)  B=00001001(9) || A AND B=0000000000000000 OR 0 ||
                  67  || A=00000110(6)  B=00001001(9) || A OR B=0000000000001111 OR 15  ||
                  78  || A=00000110(6)  B=00001001(9) || A EXOR B=0000000000001111 OR 15||
                  89  || A=00000110(6)  B=00001001(9) || A EXNOR B=0000000011110000 OR 240||
                 100  || A=00000110(6)  B=00001001(9) || not A=0000000011111001 OR 249    ||
                 111 || A=00000110(6)  B=00001001(9) || not B=0000000011110110 OR 246    ||
                 122 || A=00000110(6)  B=00001001(9) || A<<B=0000110000000000 OR 3072     ||
                 133 || A=00000110(6)  B=00001001(9) || A>>B=0000000000000000 OR 0     ||
*/


  
