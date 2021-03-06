------------------------------------------------------------------------
-- Script created table file
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library DSO;
use DSO.Global.all;

package pFastFirCoeff is
constant cFastFirCoeff : aInputValues(0 to 128-1) := ( 2, -1, -23, 101, 173, 17, -18, 5, 5, -18, 17, 173, 101, -23, -1, 2, 1, 1, -13, 40, 91, 18, -12, 3, 2, -2, -10, 62, 80, 1, -7, 3, 3, -7, 1, 80, 62, -10, -2, 2, 3, -12, 18, 91, 40, -13, 1, 1, -2, 0, 29, 26, -1, 0, 0, 0, -2, 2, 31, 23, -2, 0, 0, 0, -3, 5, 33, 20, -3, 0, 0, 0, -3, 7, 34, 16, -3, 0, 0, 0, -3, 10, 35, 13, -4, 0, 0, 0, -4, 13, 35, 10, -3, 0, 0, 0, -3, 16, 34, 7, -3, 0, 0, 0, -3, 20, 33, 5, -3, 0, 0, 0, -2, 23, 31, 2, -2, 0, 0, 0, -1, 26, 29, 0, -2, 0, 0, 0);
end;
