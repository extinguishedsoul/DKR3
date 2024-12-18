program dkr3;
function f(x: real): real;
begin
  f := 2 * Power(x, 3) + Power(x, 2) - 2 * x + 16;
end;
function LeftRectangles(a, b: real; n: integer): real;
var h, integral: real; i: integer;
begin
  h := (b - a) / n;
  integral := 0;
  for i := 0 to n - 1 do
    integral := integral + f(a + i * h);
  LeftRectangles := integral * h;
end;
function EstimateError(a, b: real; n: integer): real;
var f2_a, f2_b: real;
begin
  f2_a := 12 * Power(a, 2) + 2;
  f2_b := 12 * Power(b, 2) + 2;
  EstimateError := Power(b - a, 2) * Max(Abs(f2_a), Abs(f2_b)) / (2 * Power(n, 2));
end;
var a, b: real; n, choice: integer;
begin
  repeat
    writeln('1.Ввод пределов интегрирования');
    writeln('2.Вычисление интеграла методом левых прямоугольников');
    writeln('3.Оценка погрешность');
    writeln('4.Выход');
    write('Выбор: '); readln(choice);
    case choice of
      1: begin
           write('Введите нижний предел (a): '); readln(a);
           write('Введите верхний предел (b): '); readln(b);
           write('Введите количество разбиений (n): '); readln(n);
         end;
      2: writeln('Интеграл: ', LeftRectangles(a, b, n):0:6);
      3: writeln('Погрешность: ', EstimateError(a, b, n):0:6);
    end;
  until choice = 4;
end.
