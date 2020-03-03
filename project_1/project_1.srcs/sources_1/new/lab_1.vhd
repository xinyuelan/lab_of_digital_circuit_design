----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/11/08 14:19:19
-- Design Name: 
-- Module Name: lab_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSMACH is
port (input : in std_logic; -- system input to start the system
clk,reset : in std_logic); -- clock and reset inputs
end SSMACH;
-- purpose: Implement main architecture for SSMACH
architecture BEHAVIOR of SSMACH is
type STATES is (START, OPENED, CLOSED); -- possible states
signal PRESENT_STATE : STATES; -- present state
begin -- BEHAVIOR
-- purpose: Main process
process (clk, reset)
begin -- process
-- activities triggered by asynchronous reset (active high)
if reset = '1' then
PRESENT_STATE <= START; -- default state
-- activities triggered by rising edge of clock
elsif clk'event and clk = '1' then
case PRESENT_STATE is
when START =>
if INPUT='1' then
PRESENT_STATE <= OPENED;
else
PRESENT_STATE <= START;
end if;
when OPENED =>
PRESENT_STATE <= CLOSED;
when CLOSED =>
PRESENT_STATE <= START;
when others =>
PRESENT_STATE <= START;
end case;
end if;
end process;
end BEHAVIOR;
