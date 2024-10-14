A = 1;          % Амплитуда
f0 = 0.9;       % Частота в кГц
phi0 = pi/10;   % Начальная фаза в радианах
fs = 8;         % Частота дискретизации в кГц
t0 = 0;         % Начальное время в секундах
t1 = 0.01;      % Конечное время в секундах (уменьшили для лучшего отображения)

% Вызов функции
[t, s] = generate_sine(A, f0, phi0, fs, t0, t1);
