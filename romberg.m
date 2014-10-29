%-------------------------------------------------------------------------------
% File:         romberg.m
% Authors:      Igor Janjic
% Description:  Implements Romberg's method.
%               Creates the Romberg table.
% Inputs:
%   a           Left endpoint.
%   b           Right endpoint.
%   m           Number of Romberg steps.
% Outputs:
%   R           Romberg table.
%-------------------------------------------------------------------------------

function [R] = romberg(a, b, m)

% Reserve space for R.
R = zeros(m);

% Row k = 1.
h = b - a;
R(1, 1) = comptrap(a, b, 1);

% Row k = 2, ..., m.
for k = 2:m
    h = h/2;
    R(k, 1) = comptrap(a, b, 2^(k - 1));
    for j = 2:k
        R(k, j) = R(k, j - 1) + (R(k, j - 1) - R(k - 1, j - 1))/(4^(j - 1) - 1);
    end
end

end
