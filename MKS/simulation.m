%% 1. Skript zur Erzeugung der Sendesignale am Sender 
clc; 
clear variables; % clear all variables

% 1.1 Definition der Simulationsparameter:
prompt = 'Wieviele Bits sollen übertragen werden? ';
nBits = input(prompt); % Anzahl der zu erzeugenden Bits

const = [-1-1j, -1+1j, 1-1j, 1+1j]; % Konstellationspunkte-Vektor für QPSK 

%% Erzeugung der pseudozufälligen Bitsequenz 
bits = generateBits(nBits);

%% Zuweisung der QPSK Symbole zu den Bitsequenz Paaren
mappedBits = mapper(bits,const);

theta = linspace(0,2*pi); % Erzeugung von 100 Werten
x1 = sqrt(2)*cos(theta); % 
y1 = sqrt(2)*sin(theta);  
betrag = abs(mappedBits);
phase = angle(mappedBits);
const_points = betrag.*exp(phase*1j);
% Ausgabe der Konstellationspunkte in einem Konstellationsdiagram
figure(2);
hold on;
plot(x1,y1,'b-');
%axis([-2 2 -2 2]);
plot(const_points, 'rs');
title('Konstellationsdiagramm der ermittelten Symbole');
xlabel('Realteil');
ylabel('Imaginärteil');
axis square;
grid on;
hold off;
%% Generierung der komplexen Kanalkoeffizienten h(t) 
nSamp = numel(mappedBits);
complexCoefficient = radioFadingChannel(nSamp);

% figure(3);
% plot(complexCoefficient,'ro');
% %xlabel('');
% %ylabel('Bit-Zustaende');
% axis square;