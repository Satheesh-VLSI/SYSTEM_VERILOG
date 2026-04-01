module unpacked_struct;


  typedef struct {
    string name;
    int marks[3];   
    int total;
    real average;
  } student;

  student s1,s2;

  
  function int calc_total(student s);
    return s.marks[0]+s.marks[1]+s.marks[2];
  endfunction

  
  function  real calc_avg(student s);
    return (s.total/3.0);
  endfunction

  
  task display_student(student s);
 
    $display("Name     : %s", s.name);
    $display("Marks    : %0d,%0d,%0d", s.marks[0], s.marks[1], s.marks[2]);
    $display("Total    : %0d", s.total);
    $display("Average  : %0f", s.average);
    $display("--------------------------------");
  endtask

  initial begin

    // Assign values
    s1.name="Satheesh";
    s1.marks='{85,90,95};

    s2.name="Sam";
    s2.marks='{99,75,80};

    
    s1.total=calc_total(s1);
    s1.average=calc_avg(s1);

    s2.total=calc_total(s2);
    s2.average=calc_avg(s2);

     $display("\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
     $display("         Student Report     ");
     $display("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n");
    display_student(s1);
    display_student(s2);

  end

endmodule

/*
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         Student Report     
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

Name     : Satheesh
Marks    : 85,90,95
Total    : 270
Average  : 90.000000
--------------------------------
Name     : Sam
Marks    : 99,75,80
Total    : 254
Average  : 84.666667
--------------------------------
*/

