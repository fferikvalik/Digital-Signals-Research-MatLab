% Clear all variables and the command window
clearvars
clc

% Define the signal length
N = 36;
n = 0:N-1;  % Define the index range

% Define the signal x(n) using a decaying exponential and sine function
x = 0.9.^n .* sin(2 * pi * 8 * n / N + pi / 4);

% Extend the signal with zeros to allow lag calculations
x_ext = [x, zeros(1, N)];

% Calculate the autocorrelation function R(i) for each lag i
for i = 0:N-1
    R(i+1) = sum(x_ext(1:N) .* x_ext(i+1:N+i));  % Sum product for each lag
end

% Find the maximum autocorrelation (excluding zero lag) to estimate the period
[max_R, max_index] = max(R(2:N));  % Find maximum value and its index
T = max_index;  % Estimate the period based on the autocorrelation peak

% Plot the original signal x(n)
subplot(2, 1, 1);
stem(n, x);
title("Signal x(n)");
xlabel("n");
ylabel("x(n)");

% Plot the autocorrelation function R(i)
subplot(2, 1, 2);
stem(1:N-1, R(2:N));
title("Autocorrelation Function");
xlabel("Lag");
ylabel("R(i)");

% Display the estimated period in the command window
fprintf("Estimated Period: %d\n", T);
