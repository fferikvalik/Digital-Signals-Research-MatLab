clearvars
clc

% Parameters for the AR(1) process
rho = 0.5;            % Autocorrelation coefficient
sigma_sq = 10;        % Variance of the noise
C = 0;                % Mean of the noise

T = 100;              % Number of points in the time series
X = zeros(T, 1);      % Temporary array for generating X

delay = 10;           % Delay of 10 time units
weakening_factor = 0.5; % Signal attenuation factor

dispersion = [1, 2, 5]; % Variances for the noise
Y = zeros(T, 3);        % Array to store signals with different noise variances

% Generation of the AR(1) process
for t = 2:T
    epsilon = sqrt(sigma_sq) * randn(); % Noise with variance sigma_sq
    X(t) = C + rho * X(t-1) + epsilon;  % AR(1) model equation
end

% Generation of delayed and weakened signal
delayed_X = [zeros(delay, 1); X(1:T-delay)]; % Delay the signal
X_delay = weakening_factor * delayed_X;      % Attenuate the signal

% Adding noise with variances 1, 2, and 5
for i = 1:3
    noise = sqrt(dispersion(i)) * randn(T, 1); % Noise with the corresponding variance
    Y(:, i) = X_delay + noise;                 % Signal with added noise
end

% Calculation of correlation between x(n) and y(n)
corr_x_y1 = xcorr(X, Y(:, 1)); % Correlation with noise variance 1
corr_x_y2 = xcorr(X, Y(:, 2)); % Correlation with noise variance 2
[corr_x_y3, lag] = xcorr(X, Y(:, 3)); % Correlation with noise variance 5

% Plotting the results
subplot(4, 2, 1);
plot(X);
title('AR(1) Process with \rho = 0.5 and \sigma^2 = 10');
xlabel('Time');
ylabel('Value');

% Plot of the delayed signal
subplot(4, 2, 2);
plot(X_delay);
title('Delayed and Attenuated AR(1) Process');
xlabel('Time');
ylabel('Value');

% Plots of signals with added noise (variances 1, 2, 5)
subplot(4, 2, 3);
plot(Y(:, 1));
title('Signal with Added Noise (Variance 1)');

subplot(4, 2, 4);
plot(Y(:, 2));
title('Signal with Added Noise (Variance 2)');

subplot(4, 2, 5);
plot(Y(:, 3));
title('Signal with Added Noise (Variance 5)');

% Correlation function plots
subplot(4, 2, 6);
plot(lag, corr_x_y1);
title('Correlation between x(n) and y1(n)');

subplot(4, 2, 7);
plot(lag, corr_x_y2);
title('Correlation between x(n) and y2(n)');

subplot(4, 2, 8);
plot(lag, corr_x_y3);
title('Correlation between x(n) and y3(n)');

% Saving the plots to a file
FileName = 'Task_5.png';
print('-dpng', '-opengl', '-r300', FileName);
