-------------------------------------------------------------------------------
-- Project    : Welec W2000A 
-------------------------------------------------------------------------------
-- File       : TestbenchFastFirDecimator-ea.vhd
-- Author     : Alexander Lindert <alexander_lindert at gmx.at>
-- Created    : 2008-08-14
-- Last update: 2009-03-04
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
--  Copyright (c) 2008, Alexander Lindert
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
--  For commercial applications where source-code distribution is not
--  desirable or possible, I offer low-cost commercial IP licenses.
--  Please contact me per mail.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  
-- 2008-08-14  1.0    
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library DSO;
use DSO.pDSOConfig.all;
use DSO.Global.all;
use DSO.pFastFirCoeff.all;
use DSO.pPolyphaseDecimator.all;
use work.pShortInputValues.all;

entity Testbench is
end entity;

architecture bhv of Testbench is
 -- type   aM is array (natural range<>) of aDecimator;
  signal Clk125                  : std_ulogic := '1';
  signal ResetAsync              : std_ulogic := cResetActive;
  signal Input                   : aValues(0 to cChannels-1);
  signal Output                  : aLongValues(0 to cChannels-1);
  signal DrawInput, DrawAliasing : aValue;
  signal DrawOutput              : aLongValue;
  signal Valid                   : std_ulogic;
  signal M                       : aM(0 to 3) := (0 => M1, 1 => M2, 2 => M4, 3 => M10);
  signal Decimator               : aDecimator;
  signal i                       : natural range 0 to cCoefficients-1;
  signal DrawValid, InputValid   : std_ulogic;

  function to_int(constant M : aDecimator) return integer is
    variable vRet : integer;
  begin
    case M is
      when M1  => vRet := 1;
      when M2  => vRet := 2;
      when M4  => vRet := 4;
      when M10 => vRet := 10;
    end case;
    return vRet;
  end function;
begin
  
  DUT : entity DSO.TopFastPolyPhaseDecimator
    port map (
      iClk        => Clk125,
      iResetAsync => ResetAsync,
      iDecimator  => Decimator,
      iData       => Input,
      iValid      => InputValid,
      oData       => Output,
      oValid      => Valid);

  Clk125 <= not Clk125 after 1 ms / 250;  -- simulation time 1 ms is in real 1 us!

  stimuli : process
  begin
    Decimator  <= M1;
    Input      <= (others => (others => '0'));
    wait for 8 us;
    ResetAsync <= not cResetActive;

    for d in M'range loop
      Decimator <= M(d);

      for i in 0 to to_int(M(d))*10 loop
        for j in 0 to 7 loop
          if j = 0 then
            InputValid <= '1';
          else
            InputValid <= '0';
          end if;
          Input <= (others => (others => '0'));
          wait until Clk125 = '1';
        end loop;
      end loop;
      InputValid             <= '1';
      Input(0)               <= to_signed(-1*2**7, cBitWidth);
      Input(1 to Input'high) <= (others => (others => '0'));
      wait until Clk125 = '1';
      for i in 0 to to_int(M(d))*10 loop
        for j in 0 to 7 loop
          if j = 0 then
            InputValid <= '1';
          else
            InputValid <= '0';
          end if;
          Input <= (others => (others => '0'));
          wait until Clk125 = '1';
        end loop;
      end loop;
    end loop;

    for d in M'range loop
      Decimator <= M(d);
      for i in 0 to to_int(M(d))*10 loop
        for j in 0 to 7 loop
          if j = 0 then
            InputValid <= '1';
          else
            InputValid <= '0';
          end if;
          Input <= (others => (others => '0'));
          wait until Clk125 = '1';
        end loop;
      end loop;
      for i in 0 to to_int(M(d))*6 loop
        for j in 0 to 7 loop
          if j = 0 then
            InputValid <= '1';
          else
            InputValid <= '0';
          end if;
          Input <= (others => to_signed(-1*2**7, cBitWidth));
          wait until Clk125 = '1';
        end loop;
      end loop;
      --InputValid <= '1';
      for i in 0 to to_int(M(d))*20 loop
        for j in 0 to 7 loop
          if j = 0 then
            InputValid <= '1';
          else
            InputValid <= '0';
          end if;
          Input <= (others => to_signed(0, cBitWidth));
          wait until Clk125 = '1';
        end loop;
      end loop;
    end loop;

    InputValid <= '1';
    for d in M'range loop
      Decimator <= M(d);
      for i in 0 to cShortInputValues'length-1 loop
        for j in 0 to cChannels-1 loop
          Input(j) <= to_signed(cShortInputValues(i), cBitWidth);
        end loop;
        wait until Clk125 = '1';
      end loop;
    end loop;
    report "Simulation finished, no failiure!" severity failure;
    
  end process;


  Display : process (Clk125)
    variable j : integer range 0 to cCoefficients-1;
  begin
    if ResetAsync = cResetActive then
      i <= 0;
    elsif rising_edge(Clk125) then
      DrawInput <= Input(i);
      DrawValid <= Valid;
      if Valid = '1' then
        DrawOutput   <= Output(0);
        DrawAliasing <= Input(0);
      end if;
    end if;
    
  end process;

end architecture;
