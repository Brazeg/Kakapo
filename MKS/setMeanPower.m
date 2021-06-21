function y = setMeanPower(x, power)
% eingabe: x = komplexe kanalkoeffiziente, p = (power/Leistung)
% ausgabe: y = skalierten kanalkoeffizienten

% Berechnung des Skalierungsfaktors alpha in Abhängigkeit der Leistung
alpha = sqrt(mean(abs(x).^2)./power);

% Skalierte Kanalkoeffizienten 
y = x/alpha;

end
