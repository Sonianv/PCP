library verilog;
use verilog.vl_types.all;
entity SEU is
    port(
        NR              : in     vl_logic_vector(8 downto 0);
        enable          : in     vl_logic;
        result          : out    vl_logic_vector(15 downto 0)
    );
end SEU;
