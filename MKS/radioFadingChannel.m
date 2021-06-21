%% 2.3.1 Generierung von komplexen Kanalkoeffizienten
% Der Real- als auch der Imaginärteil der Kanalkoeffizienten werden
% pseudozufällig generiert. 
% -------------------------------------------------------
% Eingabe: Anzahl der zu generierender Kanalkoeffizienten
% -------------------------------------------------------
% Ausgabe: Generierte komplexe Kanalkoeffiziente

function y = radioFadingChannel(nSamp)

realteil = randn(1,nSamp); % Generierung der Realteils
imagteil = randn(1,nSamp); % Generierung des Imaginärteils
y = realteil + 1j*imagteil; % Zusammenführung der generierten Anteile

end

