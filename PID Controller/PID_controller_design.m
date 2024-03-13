%----------INTEGRATOR-------------
num = [1];
den = [1 0];
w = logspace(-3,3);
g = freqs(num,den,w);
semilogx(w,20*log10(abs(g))), grid,xlabel('w'), ylabel('dB gain');

%----------PROPOTIONAL-------------

Kp=1;
num = [Kp];
den = [1];
w = logspace(-3,3);
g = freqs(num,den,w);
semilogx(w,20*log10(abs(g))), grid,xlabel('w'), ylabel('dB gain');

%----------DERIVATIVE-------------

num = [1 0];
den = [1 10];
w = logspace(-3,3);
g = freqs(num,den,w);
semilogx(w,20*log10(abs(g))), grid,xlabel('w'), ylabel('dB gain');


%-------Plant Example INTEGRATOR Ki=1 -------
ki = 1;
nc = [ki];
dc = [1 0];
w = logspace(-3,3);
gc = freqs(nc,dc,w);
subplot(2,1,1),semilogx(w,20*log10(abs(gc))); grid,xlabel('w'); hold;

%--- Time response -----
np = [2.2];
dp = conv(conv([0.1 1], [0.4 1]), [1.2 1]);
[ns,ds] = feedback(conv(nc,np),conv(dc,dp),[1],[1]);
subplot(2,1,2),step(ns,ds);