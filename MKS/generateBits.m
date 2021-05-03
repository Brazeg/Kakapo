%% 2.2.1. Erzeugung der Bitsequenzen
% Funktion zur Erzeugung der Bitsequenzen
function y = generateBits(nBits)

% Erzeugung von zufällig generierten Bits der Anzahl nBits
y = randi([0 1], nBits, 1);

% Visualisierung der erzeugten Bits
plot(y, 'r*')
title('zufaellig erzeugte Bits von 1 bis einschl. 50');
xlabel('Anzahl der Bits');
ylabel('Bit-Zustaende');
grid on;
end