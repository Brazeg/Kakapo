%% 2.3.1 Generierung von komplexen Kanalkoeffizienten
% Der Real- als auch der Imaginärteil der Kanalkoeffizienten werden
% pseudozufällig generiert. 
% -------------------------------------------------------
% Eingabe: Anzahl der zu generierender Kanalkoeffizienten
% -------------------------------------------------------
% Ausgabe: Generierte komplexe Kanalkoeffiziente

function y = radioFadingChannel(nSamp)

realteil = randn(nSamp,1); % Generierung der Realteils
imagteil = randn(nSamp,1); % Generierung des Imaginärteils
h = realteil + 1j*imagteil; % Zusammenführung der generierten Anteile

gain = mean(abs(h).^2);
E = mean(abs(h/gain).^2);
y = abs(h/gain).^2;
figure(3);
histogram(realteil, 'ro');
%xlabel('');
%ylabel('Bit-Zustaende');
axis square;
end

