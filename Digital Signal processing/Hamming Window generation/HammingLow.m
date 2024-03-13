
Fs = 48000;  % Sampling Frequency

N    = 50;       % Order
Fc   = 1000;    % Cutoff Frequency
flag = 'scale';  % Sampling Flag

% Create the window vector for the design algorithm.
win = hamming(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'low', win, flag);

freqz(b,1)

b_=cast(b,"int16");
b_=b_';
writematrix(b_,'data1.dat');

% save 'HLcoeff.dat' b -ascii    
% load HLcoeff.dat 
% 
% save 'HLip.dat'  -ascii  
% load HLip.dat 
