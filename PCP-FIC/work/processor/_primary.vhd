library verilog;
use verilog.vl_types.all;
entity processor is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        BADR            : in     vl_logic_vector(9 downto 0);
        hlt             : in     vl_logic;
        bra             : in     vl_logic;
        PC              : out    vl_logic_vector(9 downto 0)
    );
end processor;
