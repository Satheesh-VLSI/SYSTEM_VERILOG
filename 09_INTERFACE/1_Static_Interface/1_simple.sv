module top;
  ports p();  //interface instantiation
  
  
  ALU Dut(.a(p.a),  //DUT instantiation
          .b(p.b),
          .op(p.op),
          .out(p.out));
  
  ALU_tb tb(p);  //testbench instantiation
endmodule
// ====================
//       INTERFACE
// ====================
  interface ports;
    logic signed [3:0] a;
    logic signed [3:0] b;
    logic [3:0] op;
    logic signed [7:0] out;
endinterface
// ====================
//          DUT
// ====================
  module ALU (input [3:0] a,b,op,output logic [7:0] out);
  
  always @(*) begin
    case(op)
       0:out=a+b;    //ADD
       1:out=a-b;    //SUB
       2:out=a*b;    //MULTIPLY
       3:out=a/b;    //Division(Quotient)
       4:out=a%b;    //Division(Remainder)
       5:out=a&b;    //AND 
       6:out=a|b;    //OR
       7:out=a^b;    //EXOR
       8:out={4'b0,a~^b};  //EXNOR
       9:out={4'b0,~a};    //NOT a
       10:out={4'b0,~b};  //NOT b
       11:out=a<<b; //b right shifts a
       12:out=a>>b; //a left shifts b
       default: out=8'bx;
    endcase
  end
endmodule

// ====================
//      TESTBENCH
// ====================
module ALU_tb(ports p);
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
/*
                   1 || A=0110  B=1001 || A+B=00001111 ||
                  12 || A=0110  B=1001 || A-B=11111101 ||
                  23 || A=0110  B=1001 || A*B=00110110 ||
                  34 || A=0110  B=1001 || A/B=00000000 ||
                  45 || A=0110  B=1001 || A mod B=00000110 ||
                  56 || A=0110  B=1001 || A AND B=00000000 ||
                  67 || A=0110  B=1001 || A OR B=00001111 ||
                  78 || A=0110  B=1001 || A EXOR B=00001111 ||
                  89 || A=0110  B=1001 || A EXNOR B=00000000 ||
                 100 || A=0110  B=1001 || not A=00001001 ||
                 111 || A=0110  B=1001 || not B=00000110 ||
                 122 || A=0110  B=1001 || A<<B=00000000 ||
                 133 || A=0110  B=1001 || A>>B=00000000 ||
*/

  
  
