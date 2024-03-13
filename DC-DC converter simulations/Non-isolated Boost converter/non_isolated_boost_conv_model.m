%----- model for a non isolated boost converter
clear all;
clc
disp(["the values of the plant paraameters"]);
Vg = 15; %v
D = 0.4; % duty cycle
L = 2e-3; %H
C = 10e-6; %F
R = 100; %ohm

% steady state model of the boost conveter
% given by As, Bs, Cs, and Ds matrices

As = [0 -(1-D)/L ; (1-D)/C -1/(R*C)];
Bs = [1/L 0 0; 0 -1/C 0];
Cs = [0 1; 1 0];
Ds = [0 0 0; 0 0 0];

Vo = -Cs(1,:)*inv(As)*Bs(:,1)*Vg % steady state Vo
Ig = -Cs(2,:)*inv(As)*Bs(:,1)*Vg % steady state Ig

%SMALL SIGNAL MODEL OF THE BOOST CONVERTER
a = [0 -(1-D)/L; (1-D)/C -1/R/C];
b = [1/L 0 Vo/L; 0 -1/C -Ig/C];
c = [0 1];
d = [0 0 0];
ulabels = ['vg iz d'];
ylabels = ['vo ig'];
xlabels = ['il vc'];

printsys(As,Bs,Cs,Ds,ulabels,ylabels,xlabels)
printsys(a,b,c,d,ulabels,ylabels,xlabels)
disp(['Transfer function in s-domain'])
disp(['vo/d (s)'])
TFb = zpk(tf(ss(a,b(:,3),c,[0])))


rlocus(TFb)