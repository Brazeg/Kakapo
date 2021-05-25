%% 2.2.1. Zuordnung der Bitsequenzen zu Modulationssymbolen
% Funktion zur Zuordnung der erzeugten Bitsequenzen zu Modulationssymbolen
function y = mapper(bits, const)

y = reshape(bits, 2, []); % Aufteilung der Bitsequenz in 2 Reihen, je 25 Spalten
y = y'; % Aus zwei Reihen-, werden zwei Spaltenvektoren mit 25 Reihen
y = bi2de(y, 'left-msb'); % Reihenweise Berechnung der Bitwerte in Dezimalwerte
y = y'; % aus Spaltenvektor, Reihenvektor machen


% Zuweisung der Konstellationspunkte zu den errechneten Dezimalwerten
for i = 1:numel(y)
    if y(i) == 0
        y(i) = const(1);
    elseif y(i) == 1
        y(i) = const(2);
    elseif y(i) == 2
        y(i) = const(3);
    elseif y(i) == 3
        y(i) = const(4);
    end
end



% Ausgabe der Konstellationspunkte in einem Konstellationsdiagram

% Einheitskreis
% theta = linspace(0,2 * pi);
% x1 = cos(theta);
% y1 = sin(theta);  

% figure;
% hold on;
% plot(x1,y1,'b--');
% axis([-2 2 -2 2]);
% plot(y(1), 'ro');
% grid on;
% hold off;
end

