with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

with Cellular; use Cellular;

procedure Main is

    Width, Number : Natural;

begin

    if Argument_Count < 2 then
        Put("usage: cellular <width> <lines>");
        return;
    end if;

    Width := Natural'Value(Argument(1));
    Number := Natural'Value(Argument(2));

    declare
        Current : Cellular.CellularArray (Integer range 1..Width);
    begin
        Generate(Current);

        Cellular.Put(Current);
        New_Line;
        for I in 1..Number loop
            Current := Cellular.NextArray(Current);
            Cellular.Put(Current);
            New_Line;
        end loop;
    end;

end Main;
