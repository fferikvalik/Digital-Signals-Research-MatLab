% Define the signal length
N = 64;

% Define the index range
n = 0:N-1;

% Define the signals
x1 = 0.5 * sin(2 * pi * 2 * n / N);   % x1(n) = 0.5 * sin((2 * pi * 2 * n) / N)
x2 = 0.5 * sin(2 * pi * 20 * n / N);  % x2(n) = 0.5 * sin((2 * pi * 20 * n) / N)

% Calculate power for x1 and x2
[P_x1, P_x1_dB] = signal_power(x1);
[P_x2, P_x2_dB] = signal_power(x2);

% Display power results
fprintf('Power of x1: %.4f, Power of x1 in dB: %.2f dB\n', P_x1, P_x1_dB);
fprintf('Power of x2: %.4f, Power of x2 in dB: %.2f dB\n', P_x2, P_x2_dB);

% Calculate orthogonality and correlation coefficient
ortogonal = sum(x1 .* x2) == 0;  % Check if signals are orthogonal
corelation_coef = (1 / N) * sum(x1 .* x2);  % Calculate correlation coefficient

% Display results for orthogonality and correlation
if ortogonal
    fprintf('Signals x1(n) and x2(n) are orthogonal.\n');
else
    fprintf('Signals x1(n) and x2(n) are not orthogonal.\n');
end
fprintf('Correlation coefficient: %.4f\n', corelation_coef);

% Plot signals
figure;

subplot(2, 1, 1);
plot(n, x1, 'b', 'LineWidth', 1.5);
title('Signal x_1(n)');
xlabel('n');
ylabel('x_1(n)');
grid on;

subplot(2, 1, 2);
plot(n, x2, 'r', 'LineWidth', 1.5);
title('Signal x_2(n)');
xlabel('n');
ylabel('x_2(n)');
grid on;
