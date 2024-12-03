% Основной скрипт
n = 0:50; 
x_n = delta(n); % Дельта-функция
y_n = fun_dis_system(x_n); % Реализация системы

% Графики
subplot(2, 1, 1); 
hold on 
stem(n, x_n, 'k'); 
title("x(n)"); 
xlabel("n"); ylabel("Амплитуда");
grid on;

subplot(2, 1, 2); 
hold on 
stem(n, y_n, 'b'); 
title("Реакция дискретной системы на дельта-импульс"); 
xlabel("n"); ylabel("Амплитуда");
grid on;

% Функция дельта-импульса
function [d] = delta(n)
    d = (n == 0); % Дельта-функция: 1 в нуле, 0 в остальных
end
