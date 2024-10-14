% Параметры
r1 = 0.2;
r2 = 0.8;
alpha = linspace(0, 6*pi, 1000); % Шаг для трёх периодов

% Определение смещенной синусоиды для r = 0.2
Sb1 = zeros(size(alpha));
for i = 1:length(alpha)
    if alpha(i) < 2*pi / (1 + r1)
        Sb1(i) = 0.5 * (1 - cos((1 + r1) / 2 * alpha(i)));
    else
        Sb1(i) = 0.5 * (1 - cos((1 + r1) / (2 * r1) * alpha(i) + (r1 - 1) / r1 * pi));
    end
end

% Определение смещенной синусоиды для r = 0.8
Sb2 = zeros(size(alpha));
for i = 1:length(alpha)
    if alpha(i) < 2*pi / (1 + r2)
        Sb2(i) = 0.5 * (1 - cos((1 + r2) / 2 * alpha(i)));
    else
        Sb2(i) = 0.5 * (1 - cos((1 + r2) / (2 * r2) * alpha(i) + (r2 - 1) / r2 * pi));
    end
end

% Построение графика
figure;
plot(alpha, Sb1, 'b', 'LineWidth', 1.5); hold on;
plot(alpha, Sb2, 'r', 'LineWidth', 1.5);
legend('r = 0.2', 'r = 0.8');
xlabel('\alpha');
ylabel('S_b(\alpha)');
title('Смещенная синусоида для разных значений r');
grid on;
