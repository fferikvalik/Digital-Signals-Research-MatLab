function [y_n] = y_nfun(x_n)
    % Инициализация выходного сигнала
    y_n = zeros(size(x_n));
    
    % Основное вычисление по формуле y(n) = x(n) + (1/2) * x(n-10)
    for i = 1:length(x_n)
        if i > 10
            y_n(i) = x_n(i) + (1/2) * x_n(i - 10);
        else
            y_n(i) = x_n(i); % Для первых 10 элементов
        end
    end
end
