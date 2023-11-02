module utils;
  task assert_true;
    input x;
    begin
      if (!x) begin
        $error($time, " Assertion failed");
        $finish_and_return(1);
      end
    end
  endtask

  task assert_false;
    input x;
    begin
      if (x) begin
        $error($time, " Assertion failed");
        $finish_and_return(1);
      end
    end
  endtask

endmodule
