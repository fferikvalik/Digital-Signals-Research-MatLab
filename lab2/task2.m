clearvars
clc

N = 36;
n = 0:N-1;
x = 0.9.^n .* sin(2 * pi * 8 * n / N + pi / 4);

x_ext = [x, zeros(1, N)];

for i = 0:N-1
    R(i+1) = sum(x_ext(1:N) .* x_ext(i+1:N+i));
end

[max_R, max_index] = max(R(2:N));
T = max_index;

subplot(2, 1, 1);
stem(n, x);
title("?????? x(n)");
xlabel("n");
ylabel("x(n)");

subplot(2, 1, 2);
stem(1:N-1, R(2:N));
title("?????????????????? ???????");
xlabel("????????");
ylabel("R(i)");

fprintf("??????: %d\n", T);
