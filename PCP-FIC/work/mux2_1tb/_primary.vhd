library verilog;
use verilog.vl_types.all;
entity mux2_1tb is
    port(
        data_in1        : out    vl_logic_vector(15 downto 0);
        data_in0        : out    vl_logic_vector(15 downto 0);
        sel             : out    vl_logic;
        data_out        : out    vl_logic_vector(15 downto 0)
    );
end mux2_1tb;
