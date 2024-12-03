% Параметры генерации звука
L = 32000;       % Длина сигнала (количество отсчётов)
fs = 44100;      % Частота дискретизации (Гц)
a = 0.95;        % Коэффициент затухания
f_0 = 440;       % Частота ноты Ля первой октавы (Гц)
M = round(fs / f_0); % Период задержки в отсчётах, соответствующий частоте f_0

% Генерация начального белого шума
x = zeros(1, L);        % Создание нулевого сигнала длины L
x(1:M) = (1 / 10) * (rand(1, M) - 0.5); % Первые M отсчётов — случайный шум с малой амплитудой

% Инициализация выходного сигнала
y = zeros(1, L);        % Создание нулевого выходного сигнала длины L
y(1:M) = x(1:M);        % Копирование начального шума в выходной сигнал

% Реализация алгоритма Карплуса-Стронга
for n = M+1:L
    y(n) = x(n) + a * y(n - M); % Добавление затухания через коэффициент a
end

% Воспроизведение звука
sound(y, fs);           % Воспроизведение звукового сигнала с частотой дискретизации fs

% Построение графика выходного сигнала
plot(y, 'b');           % Построение графика выходного сигнала
title('Нота Ля первой октавы'); % Заголовок графика
grid on;                % Включение сетки на графике

% Сохранение выходного сигнала в аудиофайл
audiowrite('ks_out.wav', y, fs); % Сохранение звукового сигнала в файл ks_out.wav
