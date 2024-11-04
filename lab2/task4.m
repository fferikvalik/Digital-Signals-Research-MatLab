clearvars; % Clear all variables from the workspace
clc; % Clear the command window

% Load the audio signal from the specified WAV file
[signal, fs] = audioread('02L4.wav');

% Set options for vocal separation
threshold = -20; % Define a threshold for separating vocal and non-vocal signals
N = 100; % Define the parameter N for the separation function

% Call the function to separate the vocalized and unvocalized parts of the signal
[x_v, x_u] = vu_separate(signal, N, threshold);

% Save the separated vocalized signal to a new WAV file
audiowrite('vocalized.wav', x_v, fs); 
% Save the separated unvocalized signal to another WAV file
audiowrite('unvocalized.wav', x_u, fs); 

% Generate output graphs for visualization
figure(1);

% Plot the vocalized signal
subplot(3, 1, 1);
plot(x_v);
title('Vocalized Signal'); % Title for the vocalized signal plot

% Plot the unvocalized signal
subplot(3, 1, 2);
plot(x_u);
title('Unvocalized Signal'); % Title for the unvocalized signal plot

% Plot the original signal
subplot(3, 1, 3);
plot(signal);
title('Original Signal'); % Title for the original signal plot

% Save the figure as a PNG file
FileName = 'Task_4.png'; 
print('-dpng', '-opengl','-r300', FileName); 
