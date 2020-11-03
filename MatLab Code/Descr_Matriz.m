% Descritor Matriz de co-ocorr�ncia
% Para usar esta fun��o passa a imagem para extrair suas caracteristicas,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Para extrair as caracteristicas com este descritor primeiro tem que
% extrair uma matriz de co-ocrrencia, e com esta matriz extrai as caracteristicas 

function Carac = Descr_Matriz(Imagem) 

% Fun��o para extrair matriz de co-ocorrencia
Mc = graycomatrix(Imagem, 'Offset', [-1 1], 'NumLevels', 256, 'GrayLimits', [0 255], 'Symmetric', false);
% Fun��o para extrair vetores de atributos
Estruct = graycoprops(Mc,{'Contrast', 'Correlation', 'Energy', 'Homogeneity'});
%Estruct = graycoprops(Mc,{'Correlation', 'Energy', 'Homogeneity'});
% Vetores de caracteristicas
Carac = [Estruct.Contrast, Estruct.Correlation, Estruct.Energy, Estruct.Homogeneity];
%Carac = [Estruct.Correlation, Estruct.Energy, Estruct.Homogeneity];