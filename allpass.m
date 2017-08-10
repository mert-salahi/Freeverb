function [y, b, a] = allpass(k, g, x)
    b = [g zeros(1,k-1) 1];
    a = [1 zeros(1,k-1) g];
    y = filter(b,a,x);
end