library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        enable          : in     vl_logic;
        opcode          : in     vl_logic_vector(5 downto 0);
        Result          : out    vl_logic_vector(15 downto 0);
        flags           : out    vl_logic_vector(3 downto 0)
    );
end ALU;
