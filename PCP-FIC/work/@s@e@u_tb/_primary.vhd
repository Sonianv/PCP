library verilog;
use verilog.vl_types.all;
entity SEU_tb is
    port(
        number          : out    vl_logic_vector(8 downto 0);
        en              : out    vl_logic;
        rezultat        : out    vl_logic_vector(15 downto 0)
    );
end SEU_tb;
