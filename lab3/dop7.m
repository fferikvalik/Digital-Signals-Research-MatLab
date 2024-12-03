clearvars
clc

% Параметры для входного импульсного сигнала
N = 30; % Длина импульсного сигнала
x_impuls = zeros(1, N); % Задаем начальные значения нулями
x_impuls(1) = 1; % Создаем единичный импульс x(0) = 1

% Система (а): y(n) = x(n-1)
b_a = [0, 1]; % Коэффициенты системы (a): b, сдвиг на 1
a_a = [1];    % Коэффициенты знаменателя (нет зависимости от y(n))
y_a = filter(b_a, a_a, x_impuls); % Импульсная характеристика системы (а)

% Построение графика для системы (а)
subplot(4, 1, 1);
stem(0:N-1, x_impuls, 'b', 'LineWidth', 1.5); % Входной импульс
title('Импульсный входной сигнал x(n)', 'FontSize', 14);
xlabel('n', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Амплитуда', 'FontSize', 14);
grid on;

subplot(4, 1, 2);
stem(0:N-1, y_a, 'r', 'LineWidth', 1.5); % Выходной сигнал системы (а)
title('Импульсная характеристика системы (a)', 'FontSize', 14);
xlabel('n', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Амплитуда', 'FontSize', 14);
grid on;

% Система (б): y(n) = n^2 * x(n-1)
y_b = zeros(1, N); % Инициализация выхода системы (б)
for n = 2:N
    y_b(n) = (n^2) * x_impuls(n-1); % Реализация разностного уравнения системы (б)
end

% Построение графика для системы (б)
subplot(4, 1, 3);
stem(0:N-1, y_b, 'g', 'LineWidth', 1.5); % Выходной сигнал системы (б)
title('Импульсная характеристика системы (b)', 'FontSize', 14);
xlabel('n', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Амплитуда', 'FontSize', 14);
grid on;

% Система (в): y(n) = ∑ x(n-k), где k от -5 до 5
k1 = -5; % Нижняя граница суммы
k2 = 5;  % Верхняя граница суммы
y_c = zeros(1, N); % Инициализация выхода системы (в)

% Реализация суммирования с учетом границ индексов
for n = 1:N
    for k = k1:k2
        if (n-k) > 0 && (n-k) <= N % Проверяем, чтобы индексы оставались в пределах массива
            y_c(n) = y_c(n) + x_impuls(n-k);
        end
    end
end

% Построение графика для системы (в)
subplot(4, 1, 4);
stem(0:N-1, y_c, 'm', 'LineWidth', 1.5); % Выходной сигнал системы (в)
title('Импульсная характеристика системы (c)', 'FontSize', 14);
xlabel('n', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Амплитуда', 'FontSize', 14);
grid on;

% Сохранение графика в файл
FileName = 'Task_dop7_updated.png';
print('-dpng', '-opengl', '-r300', FileName);
