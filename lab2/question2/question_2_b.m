% 2 b) 

clc;
clear;
close all;

% Testa funktionen
L = 4; 
N = 100;
method = 'RK4';

V = computeVolume(L, N, method);
fprintf('Volym för L=%.2f, N=%d med %s: %.6f\n', L, N, method, V);
