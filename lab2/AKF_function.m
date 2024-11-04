% FOR TASK 3!!!

function [autocorr] = AKF_function(signal, flag) 
    % AKF_function calculates the autocorrelation function of a given signal.
    % The type of extension for the signal can be controlled by the 'flag' parameter.
    
    N = length(signal); % Get the length of the input signal
    autocorr = zeros(1, N); % Initialize the autocorrelation array with zeros

    % If flag is 0, calculate the standard autocorrelation
    if flag == 0
        for lag = 1:N % Loop over each lag value from 1 to N
            % Calculate the autocorrelation at the given lag
            autocorr(lag) = sum(signal(1:N-lag+1) .* signal(lag:N));
        end
    % If flag is not 0, perform periodic extension of the signal
    elseif flag ~= 0
        % Extend the signal by concatenating it with itself
        extr_signal = [signal, signal]; % Create an extended signal
        
        for i = 1:N % Loop through each index of the original signal
            % Calculate the autocorrelation for the extended signal
            autocorr(i) = sum(extr_signal(1:N) .* extr_signal(i+1:N+i));
        end
    end
end
