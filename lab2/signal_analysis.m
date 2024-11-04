function [P_x1_dB, P_x2_dB, correlation] = signal_analysis(N)
    % Define signal parameters for variant 4
    n = 0:N-1;  % Sample indices
    x1 = 0.9.^n .* sin(2 * pi * 8 * n / N);  % Signal x1(n)
    x2 = (1.05).^n .* cos(2 * pi * 8 * n / N);  % Signal x2(n)
    
    % Calculate power of signal x1
    P_x1 = (1 / N) * sum(abs(x1).^2);  % Average power
    P_x1_dB = 10 * log10(P_x1);  % Power in decibels
    
    % Calculate power of signal x2
    P_x2 = (1 / N) * sum(abs(x2).^2);  % Average power
    P_x2_dB = 10 * log10(P_x2);  % Power in decibels
    
    % Calculate correlation coefficient to check orthogonality
    correlation = sum(x1 .* x2) / sqrt(sum(x1.^2) * sum(x2.^2));
    
    % Output results
    fprintf('Power of x1 in decibels: %.2f dB\n', P_x1_dB);
    fprintf('Power of x2 in decibels: %.2f dB\n', P_x2_dB);
    fprintf('Correlation coefficient: %.4f\n', correlation);
    
    % Check orthogonality
    if abs(correlation) < 1e-5
        fprintf('Signals x1(n) and x2(n) are orthogonal.\n');
    else
        fprintf('Signals x1(n) and x2(n) are not orthogonal.\n');
    end

    % Plotting the signals
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
end
