% Параметры
fs = 16000;              % Частота дискретизации
frequencies = [659, 622, 659, 622, 494, 587, 523, 440]; % Частоты
duration = 0.5;          % Длительность каждого сигнала в секундах
t = 0:1/fs:duration-1/fs;

% Генерация сигнала
signal = [];
for f = frequencies
    signal = [signal, sin(2 * pi * f * t)];
end

% Сохранение wav-файла
audiowrite('sine_sequence.wav', signal, fs);
n