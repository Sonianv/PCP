library verilog;
use verilog.vl_types.all;
entity Control_Unit is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        flags           : in     vl_logic_vector(3 downto 0);
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
end Control_Unit;
