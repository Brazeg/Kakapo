%% 1. Skript zur Erzeugung der Sendesignale am Sender 
clc; 
clear variables; % clear all variables

% 1.1 Definition der Simulationsparameter:

nBits = 5000; % Anzahl der zu erzeugenden Bits

snrdB = -inf; % gewünschter SNR Wert

p = 1; % Leistung

const = [-1-1j, -1+1j, 1-1j, 1+1j]; % Konstellationspunkte-Vektor für QPSK 

%% Erzeugung der pseudozufälligen Bitsequenz 
bits = generateBits(nBits);

%% Zuweisung der QPSK Symbole zu den Bitsequenz-Paaren
mappedBits = mapper(bits,const);

% Erzeugung eines Einheitskreises
theta = linspace(0,2*pi); % Erzeugung von 100 Werten
x1 = sqrt(2)*cos(theta); % 
y1 = sqrt(2)*sin(theta);  
betrag = abs(mappedBits);
phase = angle(mappedBits);
const_points = betrag.*exp(phase*1j);

% Ausgabe der Konstellationspunkte in einem Konstellationsdiagram
figure(1);
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
%% 2.3.1. Generierung der komplexen Kanalkoeffizienten h(t) und Errechnung
% der Skalierungsvektoren

nSamp = numel(mappedBits);
complexCoefficient = radioFadingChannel(nSamp);
scaledCoefficient = setMeanPower(complexCoefficient, p);

figure(2);
subplot(2,2,1);
histogram(abs(scaledCoefficient), 'Normalization','pdf') % Amplitude der PDF
xlabel('Amplitude');
ylabel('PDF von Amplitude');

subplot(2,2,2);
histogram(angle(scaledCoefficient), 'Normalization','pdf') % Phase der PDF
xlabel('Phase (rad)');
ylabel('PDF von der Phase');

subplot(2,2,3);
histogram(abs(scaledCoefficient), 'Normalization','cdf') % Amplitude der CDF
xlabel('Amplitude');
ylabel('CDF von Amplitude');

subplot(2,2,4);
histogram(angle(scaledCoefficient), 'Normalization','cdf') % Phase der CDF
xlabel('Phase (rad)');
ylabel('CDF von der Phase');

figure(3);
histogram2(real(scaledCoefficient),imag(scaledCoefficient),'Normalization','pdf','FaceColor','flat');
axis square;
xlabel('realteil');
ylabel('imaginärteil');
zlabel('PDF');

%% 2.3.2 Multiplikation der Kanalkoeffizienten mit den Modulationssymbolen
% und die Addition mit weißem Rauschen

signal = scaledCoefficient.*mappedBits;
channelOutput = setSNR(signal, snrdB);

% Testfälle:
% 1: gewünschter SNR Wert geht gegen unendlich -> Signalleistung bleibt 
% 2: gewünschter SNR Wert geht gegen minus unendliche -> Rauschleistung
% bleibt
% 3: gewünschter SNR Wert gleich der Signalleistung -> Rauschleistung +
% Signalleistung
leistungChannelOutput = mean(abs(channelOutput).^2);

