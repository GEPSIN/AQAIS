% EXTRAÇÃO DE CARACTERISITICAS = Extração de informações da imagem, para 
% propositos de segmentação e classificação
% Extração de informações de texturas
% Metodo Descritores baseados em histograma

function [media, variancia, assimetria, curtose, energia, entropia] = Descr_Histograma (Imagem_Constratada)

DB = size(Imagem_Constratada); % Armazenamento de tamanho da matriz (Linha x Coluna) Banda
[contB, indiB] = imhist(Imagem_Constratada); % Histograma de imagem Banda 
% ContB4 e a contagem dos pixels que tem o mesmo valor de nivel de cinza
% indiB4 e o valor do nivel de cada pixel
P = contB/(DB(1,1)*DB(1,2)); % Densidade de probalidade de um conjunto 
%de pixels de mesmo valor de niveis de cinza
%Momentos estatisiticos para formação de descritores
media = sum(indiB.*P);
variancia = sum((indiB - media).^2.*P);
assimetria = sqrt(variancia)^(-3)*sum((indiB - media).^3.*P);
curtose = sqrt(variancia)^(-4)*sum((indiB - media).^3.*P);
energia = sum(P.^2);
c = 0.01; % constante para não calcular log2(0)
entropia = -sum(P.*log2(P+c));
