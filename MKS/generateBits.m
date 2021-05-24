%% 2.2.1. Erzeugung der Bitsequenzen
% -----------------------------------------------------------
% Eingabeparameter: Anzahl an Bits, die erzeugt werden sollen
% -----------------------------------------------------------
% Ausgabeparameter: Pseudozufällig generierte Bitsequenz als Reihenvektor
% -----------------------------------------------------------
function y = generateBits(nBits)

% Erzeugung von zufällig generierten Bits 
y = randi([0 1], 1, nBits);

% Umwandlung der Bitsequenz in ein logischen boolean Datentyp
y = boolean(y);

% Visualisierung der erzeugten Bits
x = 1:50; % Definition der x-Achse
figure;
stem(x,y); 
title('zufaellig erzeugte Bits von 1 bis einschl. 50');
xlabel('Anzahl der Bits');
ylabel('Bit-Zustaende');
end