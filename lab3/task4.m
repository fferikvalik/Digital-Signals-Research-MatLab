% Параметры
n = 0:50;              % Временная шкала
x_n = delta(n);        % Дельта-импульс (входной сигнал)

% Коэффициенты разностного уравнения
b = [1 0 0.4];         % Коэффициенты при x(n)
a = [1 0.5 -0.2];      % Коэффициенты при y(n)

% Импульсная характеристика
y = filter(b, a, x_n);

% Построение графика
stem(n, y, 'b', 'LineWidth', 1.5);
title("Импульсная характеристика системы");
xlabel("n"); ylabel("Амплитуда");
grid on;

% Функция дельта-импульса
function d = delta(n)
    d = (n == 0); % Дельта-функция: 1 в нуле, 0 в остальных
end
