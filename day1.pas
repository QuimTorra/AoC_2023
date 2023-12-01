// =========== AOC d1 =========== 
// =========== PART 1 ===========

program AoC_2023_day1_part1;
uses sysutils;

var 
line: string;
character: char;
number: string = '';
total: int64 = 0;
i: integer;

begin
    readln(line);
    while (line <> 'end') do
    begin
        number := '';
        for i := 1 to Length(line) do
        begin
            character := line[i];
            if (character in ['0'..'9']) then number := Concat(number, character);
        end;
        number := number[1] + number[Length(number)];
        total := total + StrToInt(number);
        writeln(number);
        readln(line);
    end;
    writeln('res::' + IntToStr(total));
end.

// =========== PART 2 ===========

program AoC_2023_day1_part2;
uses sysutils;
var 
line: string;
character: char;
number: string = '';
s_number: string = '';
total: int64 = 0;
numbers: array[1..9] of string = ('one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine');
p: integer;
i: integer;
j: integer;

begin
    readln(line);
    while (line <> 'end') do
    begin
        number := '';
        s_number := '';
        for i := 1 to Length(line) do
        begin
            character := line[i];
            if (character in ['0'..'9']) then
            begin
                number := Concat(number, character);
                s_number := '';
            end
            else begin
                s_number := Concat(s_number, character);
                for j := 1 to Length(numbers) do
                begin
                    p := pos(numbers[j], s_number);
                    if (p > 0) then
                    begin
                        number := Concat(number, IntToStr(j));
                        s_number := s_number[Length(s_number)];
                    end;
                end;
            end;
        end;
        number := number[1] + number[Length(number)];
        total := total + StrToInt(number);
        writeln(number);
        readln(line);
    end;
    writeln('res::' + IntToStr(total));
end.