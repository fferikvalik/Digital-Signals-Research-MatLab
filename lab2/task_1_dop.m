% Parameters
N = 100;  % Length of the signals
n = 0:N-1;  % Index array for the signals

% Original signals
x1 = 0.9.^n .* sin(2 * pi * 8 * n / N);  % Signal x1(n) defined as a damped sine wave
x2 = (1.05).^n .* cos(2 * pi * 8 * n / N);  % Signal x2(n) defined as an amplified cosine wave

% Calculate power of x1
P_x1 = (1 / N) * sum(abs(x1).^2);  % Compute average power of the signal x1
P_x1_dB = 10 * log10(P_x1);  % Convert power to decibels

% Calculate power of x2
P_x2 = (1 / N) * sum(abs(x2).^2);  % Compute average power of the signal x2
P_x2_dB = 10 * log10(P_x2);  % Convert power to decibels

% Scaling factor for matching powers
k = sqrt(P_x1 / P_x2);  % Calculate the scaling factor to equalize power levels

% Modified signal x2
x2_modified = k * x2;  % Scale x2 to match the power of x1

% Calculate power of modified x2
P_x2_modified = (1 / N) * sum(abs(x2_modified).^2);  % Compute average power of the modified signal
P_x2_modified_dB = 10 * log10(P_x2_modified);  % Convert power to decibels

% Output power levels
fprintf('Power of x1: %.2f dB\n', P_x1_dB);  % Display power of x1 in dB
fprintf('Power of x2: %.2f dB\n', P_x2_dB);  % Display power of x2 in dB
fprintf('Power of modified x2: %.2f dB\n', P_x2_modified_dB);  % Display power of modified x2 in dB

% Plot the signals
figure;

% Plot of signal x1
subplot(3, 1, 1);  % Create a subplot for x1
plot(n, x1, 'b', 'LineWidth', 1.5);  % Plot x1 in blue
title('Signal x_1(n)');  % Title for the first plot
xlabel('n');  % x-axis label
ylabel('x_1(n)');  % y-axis label
grid on;  % Enable grid on the plot

% Plot of signal x2
subplot(3, 1, 2);  % Create a subplot for x2
plot(n, x2, 'r', 'LineWidth', 1.5);  % Plot x2 in red
title('Signal x_2(n)');  % Title for the second plot
xlabel('n');  % x-axis label
ylabel('x_2(n)');  % y-axis label
grid on;  % Enable grid on the plot

% Plot of modified signal x2
subplot(3, 1, 3);  % Create a subplot for modified x2
plot(n, x2_modified, 'g', 'LineWidth', 1.5);  % Plot modified x2 in green
title('Modified Signal x_2(n)');  % Title for the third plot
xlabel('n');  % x-axis label
ylabel('x_2''(n)');  % y-axis label (note the prime indicating modification)
grid on;  % Enable grid on the plot

% Save the plots to a PNG file
FileName = 'Signal_Analysis.png';  % Specify the filename for saving
print('-dpng', '-opengl', '-r300', FileName);  % Save the plots as a high-resolution PNG file
