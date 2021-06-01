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


end