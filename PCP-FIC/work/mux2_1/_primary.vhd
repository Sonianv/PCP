library verilog;
use verilog.vl_types.all;
entity mux2_1 is
    generic(
        N               : integer := 16
    );
    port(
        data_in0        : in     vl_logic_vector;
        data_in1        : in     vl_logic_vector;
        sel             : in     vl_logic;
        data_out        : out    vl_logic_vector
    );
end mux2_1;
