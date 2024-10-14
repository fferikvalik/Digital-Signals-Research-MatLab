% Заданные параметры
omega1 = pi / 3;
omega2 = pi / 4;
a = 1.1;
b = 0.89;

% Определение n для каждой последовательности
n1 = 0:25;          % для x1
n2 = -15:25;        % для x2
n3 = -20:0;         % для x3
n4 = 0:50;          % для x4

% Определение последовательностей
x1 = sin(omega1 * n1);             % x1(n) = sin(ω1 * n)
x2 = cos(omega1 * n2);             % x2(n) = cos(ω1 * n)
x3 = (a .^ n3) .* sin(omega2 * n3); % x3(n) = a^n * sin(ω2 * n)
x4 = (b .^ n4) .* cos(omega2 * n4); % x4(n) = b^n * cos(ω2 * n)

% Построение графиков

% График x1(n)
figure;
subplot(2,2,1);
plot(n1, x1, 'b', 'LineWidth', 1.5); % Линия соединяет точки
% hold on;
stem(n1, x1, 'b', 'LineWidth', 1.5); % Сами точки
xlabel('n');
ylabel('x_1(n)');
title('График x_1(n) = sin(ω_1 n)');
grid on;

% График x2(n)
subplot(2,2,2);
plot(n2, x2, 'r', 'LineWidth', 1.5); % Линия соединяет точки
% hold on;
stem(n2, x2, 'r', 'LineWidth', 1.5); % Сами точки
xlabel('n');
ylabel('x_2(n)');
title('График x_2(n) = cos(ω_1 n)');
grid on;

% График x3(n)
subplot(2,2,3);
plot(n3, x3, 'g', 'LineWidth', 1.5); % Линия соединяет точки
hold on;
stem(n3, x3, 'g', 'LineWidth', 1.5); % Сами точки
xlabel('n');
ylabel('x_3(n)');
title('График x_3(n) = a^n sin(ω_2 n)');
grid on;

% График x4(n)
subplot(2,2,4);
plot(n4, x4, 'm', 'LineWidth', 1.5); % Линия соединяет точки
hold on;
stem(n4, x4, 'm', 'LineWidth', 1.5); % Сами точки
xlabel('n');
ylabel('x_4(n)');
title('График x_4(n) = b^n cos(ω_2 n)');
grid on;
