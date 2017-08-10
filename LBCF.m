function y = LBCF(f, d, N, input)
    b = [zeros(1,N-1) -d 1];
    a = [1 -d zeros(1, N-2) -f*(1-d)];
    y = filter(b, a, input);
end