%% 1. Skript zur Erzeugung der Sendesignale am Sender 


clc; clear variables; % clear all variables

% 1.1 Definition der Simulationsparameter:

nBits = 50; % Anzahl der zu erzeugenden Bits

const = [-1-1j, -1+1j, 1-1j, 1+1j]; % Konstellationspunkte-Vektor für QPSK 

%% Aufruf der Funktion generateBits
bits = generateBits(nBits);

%% Aufruf der Funktion mapper
mappedBits = mapper(bits, const);