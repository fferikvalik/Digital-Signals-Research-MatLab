function [P_x, P_dB] = signal_power(x)
    % signal_power - Calculates the power of a signal in linear and decibel forms
    % Inputs:
    %   x - Input signal
    % Outputs:
    %   P_x - Power of the signal in linear form
    %   P_dB - Power of the signal in decibels

    % Determine the length of the signal
    N = length(x);
    
    % Calculate the signal power using formula (2.3)
    P_x = (1 / N) * sum(abs(x).^2);
    
    % Convert power to decibels
    P_dB = 10 * log10(P_x);
end