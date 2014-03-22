with Ada.Numerics.Discrete_Random;

package Cellular is

    type CellularArray is array(Integer range <>) of Boolean;

    package Boolean_Random is new Ada.Numerics.Discrete_Random(Boolean);
    use Boolean_Random;

    procedure Generate (Previous : in out CellularArray);

    function "=" (Left, Right : in CellularArray) return Boolean;

    function NextStep(Left, Cell, Right : in Boolean) return Boolean;

    function NextArray(Previous : in CellularArray) return CellularArray;

    procedure Put(Line : in CellularArray);

end Cellular;
