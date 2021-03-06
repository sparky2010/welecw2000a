------------------------------------------------------------------------
-- Script created table file
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library DSO;
use DSO.Global.all;

package pFirCoeff is
constant cFirCoeff : aInputValues(0 to 128-1) := ( 241, 723, 1205, 1687, 2168, 2650, 3132, 3614, 482, 964, 1446, 1928, 2409, 2891, 3373, 3855, 62, 310, 559, 807, 1055, 1303, 1552, 1800, 124, 372, 621, 869, 1117, 1365, 1614, 1862, 186, 434, 683, 931, 1179, 1427, 1676, 1924, 248, 496, 745, 993, 1241, 1489, 1738, 1986, 26, 283, 540, 797, 1054, 0, 0, 0, 51, 308, 565, 822, 1079, 0, 0, 0, 77, 334, 591, 848, 1105, 0, 0, 0, 103, 360, 617, 874, 1131, 0, 0, 0, 129, 386, 643, 900, 1157, 0, 0, 0, 154, 411, 668, 925, 1182, 0, 0, 0, 180, 437, 694, 951, 1208, 0, 0, 0, 206, 463, 720, 977, 1234, 0, 0, 0, 231, 488, 745, 1002, 1259, 0, 0, 0, 257, 514, 771, 1028, 1285, 0, 0, 0);
end;
