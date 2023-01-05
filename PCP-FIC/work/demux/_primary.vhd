library verilog;
use verilog.vl_types.all;
entity demux is
    port(
        data_in         : in     vl_logic_vector(15 downto 0);
        sel             : in     vl_logic;
        en              : in     vl_logic;
        data_out0       : out    vl_logic_vector(15 downto 0);
        data_out1       : out    vl_logic_vector(15 downto 0)
    );
end demux;
