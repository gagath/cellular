with Ada.Text_IO; use Ada.Text_IO;

package body Cellular is

    procedure Generate(Previous : in out CellularArray) is
        Generator : Boolean_Random.Generator;
    begin
        Reset(Generator);
        for I in Previous'Range loop
            Previous(I) := Random(Generator);
        end loop;
    end Generate;

    function "="(Left, Right : in CellularArray) return Boolean is
    begin
        if Left'Size /= Right'Size then
            return False;
        end if;

        for I in Left'Range loop
            if Left(I) /= Right(I) then
                return False;
            end if;
        end loop;

        return True;
    end;

    function NextStep(Left, Cell, Right : in Boolean) return Boolean is
    begin
        return (not Left and (Cell or Right)) or
               (Left and not Cell and not Right);
    end NextStep;

    function NextArray(Previous : in CellularArray) return CellularArray is
        Result : CellularArray(Previous'Range) := (
            Others => False
            );
    begin
        for I in Previous'Range loop
            if I > Previous'First and I < Previous'Last then
                Result(I) := NextStep(Previous(I-1), Previous(I), Previous(I+1));
            else
                Result(I) := Previous(I);
            end if;
        end loop;

        return Result;
    end NextArray;

    procedure Put(Line : in CellularArray) is
    begin
        for I in Line'Range loop
            if Line(I) then
                Put("@");
            else
                Put(".");
            end if;
        end loop;
    end Put;

end Cellular;
