library verilog;
use verilog.vl_types.all;
entity ALU_tb is
    port(
        A               : out    vl_logic_vector(15 downto 0);
        B               : out    vl_logic_vector(15 downto 0);
        enable          : out    vl_logic;
        opcode          : out    vl_logic_vector(5 downto 0);
        Result          : out    vl_logic_vector(15 downto 0);
        flags           : out    vl_logic_vector(3 downto 0)
    );
end ALU_tb;
