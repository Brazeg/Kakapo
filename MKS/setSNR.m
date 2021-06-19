function y = setSNR(x, snrdB)
% Diese Funktion erhält als Eingabeparameter das Signal x als Zeilenvektor 
% von komplexen Zahlen und das gewünschte SNR pro Symbol in dB (snrdB). 
% 
% Der Ausgabeparameter y beschreibt das verrauschte Eingangssignal, 
% wieder als Zeilenvektoraus komplexen Zahlen.

meanP = setMeanPower(x,1);
snrB = db(snrdB./log2(size(x)));

realteil = randn(nSamp,1);
imagteil = randn(nSamp,1);



end
