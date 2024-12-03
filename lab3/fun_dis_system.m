% Функция реализации системы
function [y] = fun_dis_system(x)
    N = length(x); % Длина входного сигнала
    y = zeros(1, N); % Инициализация выходного сигнала
    
    for i = 1:N
        if i == 1
            y(i) = 0;
        elseif i == 2
            y(i) = x(i-1);
        elseif i == 3
            y(i) = x(i-1) + 0.4 * x(i-2);
        else
            y(i) = x(i) + 0.4 * x(i-2) - 0.5 * y(i-1) + 0.2 * y(i-2);
        end
    end
end
