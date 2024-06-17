function y = secConv(x, h, L, method)
    % Sectioned Convolution using Overlap-Save or Overlap-Add Method
    % Inputs:
    % x - input signal
    % h - impulse response
    % L - length of each segment
    % method - 'overlap_save' or 'overlap_add'
    % Output:
    % y - output signal after convolution
    
    M = length(h);
    N = L + M - 1; % Length of each convolution segment

    switch method
        case 'overlap_save'
            % Overlap-Save Method
            y = [];
            % Pad x with zeros at the beginning to handle the initial overlap
            x = [zeros(1, M - 1), x];
            num_seg = ceil((length(x) - M + 1) / L);
            for k = 1:num_seg
                x_segment = x(((k-1)*L + 1) : ((k-1)*L + N));
                y_segment = conv(x_segment, h);
                if k ~= num_seg
                    y = [y, y_segment(M:end-M+1)];
                else
                    y = [y, y_segment(M:end)];
                end
            end
        case 'overlap_add'
            % Overlap-Add Method
            y = zeros(1, length(x) + M - 1);
            for i = 1:L:length(x)
                x_segment = x(i:min(i + L - 1, length(x)));
                y_segment = conv(x_segment, h);
                y(i : i + N - 1) = y(i : i + N - 1) + y_segment;
            end
        otherwise
            error('Invalid method. Use "overlap_save" or "overlap_add".');
    end
end