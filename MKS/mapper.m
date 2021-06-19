function y = mapper(bits, const)
%% 2.2.1. Zuordnung der Bitsequenzen zu Modulationssymbolen
% Funktion zur Zuordnung der erzeugten Bitsequenzen zu Modulationssymbolen

y = reshape(bits, 2, []); % Aufteilung der Bitsequenz in 2 Zeilen (rows)
y = y'; % Aus zwei Reihen-, werden zwei Spaltenvektoren mit 25 Reihen

y = bi2de(y, 'left-msb'); % Reihenweise Berechnung der Bitwerte in Dezimalwerte
y = y'; % aus Spaltenvektor, Reihenvektor machen
y = const(y+1); % Zuweisung der Dezimalzahlen zu den QPSK Konstellationspunkten + 1

% Zuweisung der Konstellationspunkte zu den errechneten Dezimalwerten
% for i = 1:numel(y)
%     if y(i) == 0
%         y(i) = const(1);
%     elseif y(i) == 1
%         y(i) = const(2);
%     elseif y(i) == 2
%         y(i) = const(3);
%     elseif y(i) == 3
%         y(i) = const(4);
%     end
% end

end

