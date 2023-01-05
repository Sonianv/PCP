library verilog;
use verilog.vl_types.all;
entity processor_tb is
    port(
        clk             : out    vl_logic;
        rst             : out    vl_logic;
        BADR            : out    vl_logic_vector(9 downto 0);
        hlt             : out    vl_logic;
        bra             : out    vl_logic;
        PC              : out    vl_logic_vector(9 downto 0)
    );
end processor_tb;
