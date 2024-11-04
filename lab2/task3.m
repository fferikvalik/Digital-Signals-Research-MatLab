clearvars; % Clear all variables from the workspace
clc;       % Clear the command window

flag = 0;  % Initialize a flag variable for managing signal extension type

% Load the audio file and read the audio data into 'signal' and the sample rate into 'fs'
[signal, fs] = audioread('02L3.wav');

% Define parameters for segment analysis
segmentLength = 640; % Length of each segment in samples
overlap = 160;       % Number of overlapping samples between consecutive segments

% Calculate the number of segments that can be extracted from the signal
numSegments = floor((length(signal) - overlap) / (segmentLength - overlap));

% Preallocate an array to store the pitch periods for each segment
pitchPeriods = zeros(1, numSegments);

% Loop through each segment to analyze the signal
for i = 1:numSegments
    % Calculate the start and end indices for the current segment
    startIndex = (i - 1) * (segmentLength - overlap) + 1; % Starting index of the segment
    endIndex = startIndex + segmentLength - 1;             % Ending index of the segment
    
    % Extract the current segment from the signal
    segment = signal(startIndex:endIndex);
    
    % Calculate the autocorrelation function (ACF) for the current segment
    autocorr = AKF_function(segment, flag); 
    
    % Find the peaks in the autocorrelation result
    [PKS, loc] = findpeaks(autocorr); % PKS contains the peak values, loc contains their locations
    
    maxIndex = 0; % Initialize the variable to store the index of the maximum peak
    max_R = max(PKS); % Find the maximum value among the peaks
    
    % Loop through the found peaks to locate the index of the maximum peak
    for l = 1:length(PKS)
        if PKS(l) == max_R
            maxIndex = loc(l); % Store the index of the maximum peak
        end
    end
    
    % Store the pitch period corresponding to the current segment
    pitchPeriods(i) = maxIndex; 
    
    % Increment the flag for the next segment; it can indicate type of signal extension
    flag = flag + 1; 
    
    % Reset the flag before the last segment if necessary
    if i == numSegments - 1
        flag = 0; 
    end
end

% Output results in a graph
figure; % Create a new figure for plotting
plot(1:numSegments, pitchPeriods); % Plot the pitch periods against segment numbers
xlabel('Segment Number'); % Label for the x-axis
ylabel('Pitch Period');    % Label for the y-axis
title('Pitch Period for Each Segment'); % Title of the graph

% Calculate and output the average pitch period across all segments
meanPitchPeriod = mean(pitchPeriods); % Calculate the mean pitch period
fprintf('Average pitch period: %.2f samples\n', meanPitchPeriod); % Display the average pitch period in samples

% Save the graph as a PNG image file
FileName = 'Task_3.png'; % Specify the filename for saving
print('-dpng', '-opengl', '-r300', FileName); % Save the figure with specified resolution
