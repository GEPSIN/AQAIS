% Aplicando convolução a uma imagem
% Para aplicar uma mascara sobre uma imagem usa-se a função
% imfilter(IMG,mask), onde IMG e a imagem e mask e a mascara manual
% Para aplicar uma mascara pre-definida pelo MATLAB usa-se a função
% fspecial(tipo,param) defini o tipo da mascara(tipo de filtro) e
% parametros adicionais do filtro
%==========================================================================
% Filtro Laplaciano
% este e um filtro de realce usado para destacar transiçãoes de niveis de
% niveis  da imagem este e um filtro usado para realçar os detalhes da
% imagem podemos falar que esse um filtro passa-altas, ele acentua
% detalhes finos como por exemplo pontos isolados, linhas, bordas etc..

function [Diferenca, Imagem_Filtrada]  = Filtro_Laplaciano(Imagem_Constratada)

maskfl = fspecial('laplacian',0.2);
% função fspecial('laplacian', alpha) e usado para calcular a mascar do
% filtro laplaciano e alpha e um parametro que controla o formato do filtro
Diferenca = imfilter(Imagem_Constratada,maskfl); % convolução do filtro laplaciano
Imagem_Filtrada = Imagem_Constratada - Diferenca; 
% Este filtro entrega como resultado somente os detalhes realçados, para
% podermos ter a imagem realçada temos que substrair a imaagem original da
% imagem realçado ou somar dependendo se o pixel central da mascara for
% positivo ou negativo