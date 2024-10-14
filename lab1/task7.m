% Параметры для варианта 1
r = 0.89;
omega = pi / 10;
z = r * exp(1j * omega);  % Комплексная экспонента

% Вектор целых чисел от 0 до 100
n = 0:100;

% Используем функцию для получения комплексной экспоненты
x = cplx_exp(z, n);

% График действительной и мнимой частей
figure;
subplot(2,1,1);
plot(n, real(x), 'b', 'LineWidth', 1.5);
xlabel('n');
ylabel('Real Part');
title('Действительная часть');

subplot(2,1,2);
plot(n, imag(x), 'r', 'LineWidth', 1.5);
xlabel('n');
ylabel('Imaginary Part');
title('Мнимая часть');

% График спирали (действительная часть на оси y, мнимая на оси x)
figure;
plot(real(x), imag(x), 'k', 'LineWidth', 1.5);
xlabel('Real Part');
ylabel('Imaginary Part');
title('Комплексная спираль');

% Эксперименты с углом θ
theta = linspace(0, 2*pi, 100);  % Можно менять угол theta

% Трехмерный график с использованием plot3
figure;
plot3(n, real(x), imag(x), 'm', 'LineWidth', 1.5);
xlabel('n');
ylabel('Real Part');
zlabel('Imaginary Part');
title('Трехмерная спираль комплексной экспоненты');
grid on;
