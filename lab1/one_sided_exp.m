function x = one_sided_exp(a, n)
    % Функция для формирования односторонней экспоненты
    % x(n) = a^n * u(n), где u(n) - единичный скачок
    x = (a .^ n) .* (n >= 0);
end