%-------------------------------------------------------------------------------
% File:         comptrap.m
% Authors:      Igor Janjic
% Description:  Implements composite trapezoidal numerical integration.
%               Approximates I = int f(x) dx over [a, b] using composite
%               trapezoidal rule, where f is a function defined by func_int.
% Inputs:
%   a           Left endpoint.
%   b           Right endpoint.
%   n           Nodes + 1.
% Outputs:
%   I           Approximate value of the integration.
%-------------------------------------------------------------------------------

function [I] = comptrap(a, b, n)

% Initization.
h = (b - a)/n;

% Contributions from nodes x_{j}, excluding a and b.
I1 = 0;
for i = 1:(n - 1)
    x = a + i*h;
    I1 = I1 + func_int(x);
end

% Compute I.
I = (h/2)*(func_int(a) + 2*I1 + func_int(b));

end

% Evaluate function f to be integrated at position x.
function [f] = func_int(x)

switch x
    case 1
        f = 2.4142;
    case 2
        f = 2.6734;
    case 3
        f = 2.8974;
    case 4
        f = 3.0976;
    case 5
        f = 3.2804;
end

end
