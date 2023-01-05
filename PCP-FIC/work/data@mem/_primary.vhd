library verilog;
use verilog.vl_types.all;
entity dataMem is
    generic(
        N               : integer := 16
    );
    port(
        clk             : in     vl_logic;
        WR              : in     vl_logic;
        RD              : in     vl_logic;
        address         : in     vl_logic_vector(8 downto 0);
        data_in         : in     vl_logic_vector;
        data_out        : out    vl_logic_vector
    );
end dataMem;
