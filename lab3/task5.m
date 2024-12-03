% Коэффициенты разностного уравнения
b = [1 0 0.4];        % Коэффициенты числителя
a = [1 0.5 -0.2];     % Коэффициенты знаменателя

% Частотный диапазон
[H, omega] = freqz(b, a, 1024); % Частотная характеристика

% Амплитудный и фазовый отклики
magnitude_response = abs(H);    % Модуль H(e^{jω}) - АЧХ
phase_response = angle(H);      % Фаза H(e^{jω}) - ФЧХ

% Построение графиков
figure;

subplot(2, 1, 1);
plot(omega/pi, magnitude_response, 'b', 'LineWidth', 1.5);
title('Амплитудно-частотная характеристика (АЧХ)');
xlabel('\omega / \pi');  
ylabel('|H(e^{j\omega})|');
grid on;

subplot(2, 1, 2);
plot(omega/pi, phase_response, 'k', 'LineWidth', 1.5);
title('Фазо-частотная характеристика (ФЧХ)');
xlabel('\omega / \pi');  
ylabel('arg(H(e^{j\omega}))');
grid on;

% Поиск частоты, где АЧХ минимальна
[H_min, idx_min] = min(magnitude_response);
omega_0 = omega(idx_min) / pi; % Частота с минимальной АЧХ в нормированных единицах
fprintf('Минимум АЧХ достигается при \u03c9_0 = %.3fπ, |H(e^{j\u03c9_0})| = %.3f\n', omega_0, H_min);
