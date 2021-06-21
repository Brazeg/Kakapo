function y = setSNR(x, snrdB)
% Diese Funktion erhält als Eingabeparameter das Signal x als Zeilenvektor 
% von komplexen Zahlen und das gewünschte SNR pro Symbol in dB (snrdB). 
% 
% Der Ausgabeparameter y beschreibt das verrauschte Eingangssignal, 
% wieder als Zeilenvektoraus komplexen Zahlen.

% Leistung des Signals
p = 1;
skaliertesSignal = setMeanPower(x,p);

% Pn = Pb/SNRb
rauschleistung = p/(10^(snrdB/10));

realteil = randn(1,length(x));
imagteil = randn(1, length(x));
n = (realteil + 1j*imagteil);
skaliertesRauschen = setMeanPower(n,rauschleistung);

y = skaliertesSignal + skaliertesRauschen;

end
