% Параметры
n = -10:20;
a = 0.8; % Затухание (|a| < 1)

% Генерация сигнала
x = one_sided_exp(a, n);

% Построение графика
figure;
stem(n, x, 'LineWidth', 1.5);
xlabel('n');
ylabel('x(n)');
title('Односторонняя затухающая экспонента');
grid on;
