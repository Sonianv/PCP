library verilog;
use verilog.vl_types.all;
entity instrMem is
    generic(
        N               : integer := 16
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        PC              : in     vl_logic_vector(9 downto 0);
        data            : out    vl_logic_vector
    );
end instrMem;
