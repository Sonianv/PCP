library verilog;
use verilog.vl_types.all;
entity Control_Unit_tb is
    port(
        opcode          : out    vl_logic_vector(5 downto 0);
        clk             : out    vl_logic;
        rst             : out    vl_logic;
        flags           : out    vl_logic_vector(3 downto 0);
        alu_op          : out    vl_logic_vector(4 downto 0);
        immediate       : out    vl_logic;
        bra             : out    vl_logic;
        RD              : out    vl_logic;
        WR              : out    vl_logic;
        alu_en          : out    vl_logic;
        psh             : out    vl_logic;
        pop             : out    vl_logic;
        hlt             : out    vl_logic;
        mov_en          : out    vl_logic
    );
end Control_Unit_tb;
