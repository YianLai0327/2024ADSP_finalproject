function y = recursiveConv(x, a, N)
    % Recursive Convolution with (a^n)u[n]
    % Inputs:
    % x - input signal
    % a - exponential base
    % N - desired output length
    % Output:
    % y - output signal after convolution

    y = zeros(1, N);
    M = length(x);

    %initial condition
    y(1) = x(1);
    x_pad = [x, zeros(1, (N-M))];
    %bottom-up recursive method
    for i = 2:N
        y(i) = y(i-1)*a + x_pad(i);
    end
end