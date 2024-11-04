% FOR TASK 2!!!!

function autocorrelation_analysis(N)  

    % Parameters of the signal for variant 4
    n = 0:N-1;
    x = 0.9.^n .* sin(2 * pi * 8 * n / N + pi / 4);
    
    % Calculation of ACF with periodic extension
    % Using xcorr function for calculating autocorrelation
    Rxx = xcorr(x, 'biased');
    
    % Define lag axis for ACF
    lag = -N+1:N-1;
    
    % Plotting the signal and its ACF
    figure;
    
    % Plot of the signal x(n)
    subplot(2, 1, 1);
    stem(n, x, 'b', 'filled');
    title('Signal x(n)');
    xlabel('n');
    ylabel('x(n)');
    grid on;
    
    % Plot of the autocorrelation function Rxx
    subplot(2, 1, 2);
    plot(lag, Rxx, 'r', 'LineWidth', 1.5);
    title('Autocorrelation Function R_{xx}');
    xlabel('Lag');
    ylabel('R_{xx}');
    grid on;
    
    % Estimation of the period based on ACF
    [~, locs] = findpeaks(Rxx);
    if ~isempty(locs)
        estimated_period = abs(lag(locs(2)) - lag(locs(1)));
        fprintf('Estimated period of the signal based on ACF: %d\n', estimated_period);
    else
        fprintf('Period not found. Check the signal parameters.\n');
    end
    
    % Save the plots as a PNG file
    FileName = 'Task_2.png';
    print('-dpng', '-opengl', '-r300', FileName);  % Save figure as PNG with high resolution
end
