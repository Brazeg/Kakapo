%% 1. Skript zur Erzeugung der Sendesignale am Sender 
% 1.1 Definition der Simulationsparameter:
% Eingabeparameter

% Anzahl der zu erzeugenden Bits
nBits = 50;

% Konstellationspunkte-Vektor für QPSK
const = [-1-1j, 1-1j, -1+1j, 1+1j];

% Aufruf der Funktion generateBits
bits = generateBits(nBits);

% Aufruf der Funktion mapper
%mapper(bits, const);