# Signal Processing Scripts

This directory contains MATLAB scripts for implementing signal processing techniques including Sectioned Convolution and Recursive Method for exponential sequences.

## Files

- `secConv.m`: Implements Sectioned Convolution using Overlap-Save or Overlap-Add method.
- `recursiveConv.m`: Implements the recursive method to perform convolution with a^n\*u[n].

## Usage

### Sectioned Convolution

1. Load the script `secConv.m`.
2. Call the function `secConv` with the input signal, impulse response, segment length, and method.

Example:
```matlab
x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
h = [1, 1, 1];
L = 5;

% Using Overlap-Save Method
y_save = secConv(x, h, L, 'overlap_save');
disp('Overlap-Save Method:');
disp(y_save);

% Using Overlap-Add Method
y_add = secConv(x, h, L, 'overlap_add');
disp('Overlap-Add Method:');
disp(y_add);

% Full Convolution for Comparison
y_full = conv(x, h);
disp('Full Convolution:');
disp(y_full);
```

#### Verification

By displaying the output of three methods, we can verify that the section convolution has the correct output.

### Recursive method to perform convolution with a^n\*u[n]

1. Load the script `recursiveConv.m`.
2. Call the function `recursiveConv` with the input signal, exponential base, and desired output length.

Example
```matlab
x = [1 2 3 4 5];
a = 0.5;
N = 10;

%Output
y = recursiveConv(x, a, N);
```

#### Verification

Since a^n\*u[n] is a IIR, we can nor calculate the infinite length output by the computer neither straightly use convolution function in matlab to verify the result. However, the result is able to be easily verified by hand calculation.