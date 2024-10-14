% Номер варианта
n0 = 9;

% Диапазон значений n
n = -10:20;

% Вычисление единичного импульса y(n) = delta(n - n0)
y_delta = delta(n - n0);

% Вычисление единичного скачка y(n) = u(n - n0)
y_step = unit_step(n - n0);

% Построение графика единичного импульса
figure;
subplot(2,1,1);
stem(n, y_delta, 'r', 'LineWidth', 2);
title('Единичный импульс \delta(n - n_0)');
xlabel('n');
ylabel('\delta(n - n_0)');
grid on;

% Построение графика единичного скачка
subplot(2,1,2);
stem(n, y_step, 'b', 'LineWidth', 2);
title('Единичный скачок u(n - n_0)');
xlabel('n');
ylabel('u(n - n_0)');
grid on;
