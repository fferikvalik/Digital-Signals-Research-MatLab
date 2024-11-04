function [Signal_power] = power_sig(x, N)
    % power_sig - Function to calculate the power of a given signal.
    %
    % Inputs:
    %   x - Input signal (vector) for which the power is to be calculated.
    %   N - Number of samples in the signal used for normalization.
    %
    % Outputs:
    %   Signal_power - A structure containing:
    %       .value - Power of the signal in linear scale.
    %       .value_db - Power of the signal in decibels (dB).

    % Calculate the sum of the squared absolute values of the signal
    sum_signal = sum(abs(x) .^ 2);
    
    % Calculate the average power of the signal
    Signal_power.value = (1 / N) .* sum_signal;
    
    % Convert the average power to decibels (dB)
    Signal_power.value_db = 10 * log10(Signal_power.value);
end
