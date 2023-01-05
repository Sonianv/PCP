library verilog;
use verilog.vl_types.all;
entity movR is
    port(
        data_acc        : in     vl_logic_vector(15 downto 0);
        data_imm        : in     vl_logic_vector(15 downto 0);
        sel_xy          : in     vl_logic;
        sel_imm         : in     vl_logic;
        en              : in     vl_logic;
        data_out0       : out    vl_logic_vector(15 downto 0);
        data_out1       : out    vl_logic_vector(15 downto 0)
    );
end movR;
