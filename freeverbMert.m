[x, Fs] = audioread('Tremolo Dry.wav');

%damp
initialDamp = 0.5;
scaleDamp = 0.4;
d = initialDamp*scaleDamp;
d = .8;

%roomsize
initialRoom = 0.5;
scaleRoom = 0.28;
offsetRoom = 0.7;
f = initialRoom*scaleRoom + offsetRoom;
f = 0.9999;

%Delay for 8 parallel lowpass feedback comb filters
lbcfN = [1116 1188 1356 1277 1422 1491 1617 1557];

parallelLBCF = zeros(size(x));
for N = lbcfN
   parallelLBCF = parallelLBCF + LBCF(f, d, N, x); 
end


xAP1 = allpass(225, 0.5, parallelLBCF);
xAP2 = allpass(556, 0.5, xAP1);
xAP3 = allpass(441, 0.5, xAP2);
xAP4 = allpass(341, 0.5, xAP3);
% out = .5*x + .5*xAP4;
out = xAP4/max(abs(xAP4));

sound(out, Fs)
