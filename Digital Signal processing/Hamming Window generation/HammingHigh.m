
Fs = 100000;  % Sampling Frequency

N    = 50;       % Order
Fc   = 10800;    % Cutoff Frequency
flag = 'scale';  % Sampling Flag

Sblow=10000; %stop band frequncy
Sbhigh=20000; %stop band high
t=1:1/Fs:100;

x=sin(2*pi*t);
y=bandstop(x,[Sblow Sbhigh],Fs);

% Create the window vector for the design algorithm.
 win = hamming(N+1);
 y1=y.*win;
 plot(t,y1)
% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'high', win, flag);

freqz(b,1)

save 'Hhcoeff.dat' b -ascii    
load Hhcoeff.dat 

